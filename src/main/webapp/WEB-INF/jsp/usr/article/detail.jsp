
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<hr />

<style>
</style>



<!-- 조회수 증가 -->
<script>
    const params = {};
    params.id = parseInt('${param.id}');
    params.memberId = parseInt('${loginedMemberId}');
    var isAlreadyAddGoodRp = ${isAlreadyAddGoodRp};
    var isAlreadyAddBadRp = ${isAlreadyAddBadRp};

    function ArticleDetail__doIncreaseHitCount() {
        $.get('../article/doIncreaseHitCountRd', {
            id : params.id,
            ajaxMode : 'Y'
        }, function(data) {
            $('.article-detail__hit-count').empty().html(data.data1);
        }, 'json');
    }

    $(function() {
        // Call the function immediately when the page is loaded
        ArticleDetail__doIncreaseHitCount();
    });
</script>

<!-- 조회수 증가(복잡) -->
<!-- <script>
    const params = {};
    params.id = parseInt('${param.id}');
    params.memberId = parseInt('${loginedMemberId}');
    var isAlreadyAddGoodRp = ${isAlreadyAddGoodRp};
    var isAlreadyAddBadRp = ${isAlreadyAddBadRp};

    function ArticleDetail__doIncreaseHitCount() {
        const localStorageKey = 'article__' + params.id + '__alreadyOnView';
        if (localStorage.getItem(localStorageKey)) {
            return;
        }
        localStorage.setItem(localStorageKey, true);
        $.get('../article/doIncreaseHitCountRd', {
            id : params.id,
            ajaxMode : 'Y'
        }, function(data) {
            $('.article-detail__hit-count').empty().html(data.data1);
        }, 'json');
    }

    $(function() {
        setTimeout(ArticleDetail__doIncreaseHitCount, 2000);
    });
</script> -->



<section class="mt-6 text-xl px-4">
	<div class="mx-auto max-w-screen-lg">
		<!-- 상단 글 정보 -->
		<table class="table-auto" style="width: 100%;">
			<tr>
				<div class="post-num">
					<td style="text-align: left;">글 번호: ${article.id}</td>
				</div>
				<div class="post-date">
					<td style="text-align: right;">작성 날짜: ${article.updateDate}</td>
				</div>
			</tr>
		</table>

		<!-- 제목 및 작성자, 조회수 -->
		<table class="table-auto mt-4" style="width: 100%;">
			<tr>
				<div class="post-name">
					<td style="text-align: left;">제목: ${article.title}</td>
				</div>

				<div class="post-look">
					<td style="text-align: right; color: #656565;">조회수:
						${article.hitCount}</td>
				</div>
			</tr>
			<tr>
				<div class="post-writer">
					<td style="text-align: left; padding-bottom: 20px;">작성자:
						${article.extra__writer}</td>
				</div>
			</tr>
		</table>

		<hr></hr>
		<!-- 본문 내용 -->
		<!-- 본문 내용 -->
		<p
			style="white-space: pre-wrap; padding-top: 20px; min-height: 300px; text-indent: 0;">${article.body}
		</p>



		<!-- 좋아요 / 싫어요 -->
		<div class="mt-10 mb-10 text-center">
			<button id="likeButton" class="btn btn-outline btn-success"
				onclick="doGoodReaction(${param.id})">
				👍 좋아요 <span class="likeCount">${article.goodReactionPoint}</span>
			</button>
			<button id="DislikeButton" class="btn btn-outline btn-error"
				onclick="doBadReaction(${param.id})">
				👎 싫어요 <span class="DislikeCount">${article.badReactionPoint}</span>
			</button>
		</div>

		<div class="btns">
			<button class="btn" type="button" onclick="history.back()">뒤로가기</button>
			<c:if test="${article.userCanModify }">
				<a class="btn" href="../article/modify?id=${article.id }">수정</a>
			</c:if>
			<c:if test="${article.userCanDelete }">
				<a class="btn" a
					onclick="if(confirm('정말 삭제 하시겠습니까?') == false) return false;"
					href="../article/doDelete?id=${article.id }">삭제</a>
			</c:if>
		</div>
		<hr style="margin-top: 20px;"></hr>
	</div>

</section>

<script>
	function ReplyWrite__submit(form) {
		console.log(form.body.value);
		
		form.body.value = form.body.value.trim();
		
		/* if(form.body.value.length < 3){
			alert('3글자 이상 입력해');
			form.body.focus();
			return;
		} */
		
		form.submit();
	}
</script>
<!-- 좋아요 싫어요  -->
<script>
<!-- 좋아요 싫어요 버튼	-->
	function checkRP() {
		if (isAlreadyAddGoodRp == true) {
			$('#likeButton').toggleClass('btn-outline');
		} else if (isAlreadyAddBadRp == true) {
			$('#DislikeButton').toggleClass('btn-outline');
		} else {
			return;
		}
	}
function doGoodReaction(articleId) {
		if(isNaN(params.memberId) == true){
			if(confirm('로그인 창으로 이동하시겠습니까?')){
// 				console.log(window.location.href);
// 				console.log(encodeURIComponent(window.location.href));
				var currentUri = encodeURIComponent(window.location.href);
				window.location.href = '../member/login?afterLoginUri=' + currentUri;
			}
			return;
		}	
	
	
		$.ajax({
			url: '/usr/reactionPoint/doGoodReaction',
			type: 'POST',
			data: {relTypeCode: 'article', relId: articleId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				console.log('data.data1Name : ' + data.data1Name);
				console.log('data.data1 : ' + data.data1);
				console.log('data.data2Name : ' + data.data2Name);
				console.log('data.data2 : ' + data.data2);
				if(data.resultCode.startsWith('S-')){
					var likeButton = $('#likeButton');
					var likeCount = $('#likeCount');
					var likeCountC = $('.likeCount');
					var DislikeButton = $('#DislikeButton');
					var DislikeCount = $('#DislikeCount');
					var DislikeCountC = $('.DislikeCount');
					
					if(data.resultCode == 'S-1'){
						likeButton.toggleClass('btn-outline');
						likeCount.text(data.data1);
						likeCountC.text(data.data1);
					}else if(data.resultCode == 'S-2'){
						DislikeButton.toggleClass('btn-outline');
						DislikeCount.text(data.data2);
						DislikeCountC.text(data.data2);
						likeButton.toggleClass('btn-outline');
						likeCount.text(data.data1);
						likeCountC.text(data.data1);
					}else {
						likeButton.toggleClass('btn-outline');
						likeCount.text(data.data1);
						likeCountC.text(data.data1);
					}
					
				}else {
					alert(data.msg);
				}
		
			},
			error: function(jqXHR,textStatus,errorThrown) {
				alert('좋아요 오류 발생 : ' + textStatus);
			}
			
		});
	}
function doBadReaction(articleId) {
	if(isNaN(params.memberId) == true){
		if(confirm('로그인 창으로 이동하시겠습니까?')){
//				console.log(window.location.href);
//				console.log(encodeURIComponent(window.location.href));
			var currentUri = encodeURIComponent(window.location.href);
			window.location.href = '../member/login?afterLoginUri=' + currentUri; // 로그인 페이지에 원래 페이지의 정보를 포함시켜서 보냄
		}
		return;
	}	
	 $.ajax({
			url: '/usr/reactionPoint/doBadReaction',
			type: 'POST',
			data: {relTypeCode: 'article', relId: articleId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				console.log('data.data1Name : ' + data.data1Name);
				console.log('data.data1 : ' + data.data1);
				console.log('data.data2Name : ' + data.data2Name);
				console.log('data.data2 : ' + data.data2);
				if(data.resultCode.startsWith('S-')){
					var likeButton = $('#likeButton');
					var likeCount = $('#likeCount');
					var likeCountC = $('.likeCount');
					var DislikeButton = $('#DislikeButton');
					var DislikeCount = $('#DislikeCount');
					var DislikeCountC = $('.DislikeCount');
					
					
					if(data.resultCode == 'S-1'){
						DislikeButton.toggleClass('btn-outline');
						DislikeCount.text(data.data2);
						DislikeCountC.text(data.data2);
					}else if(data.resultCode == 'S-2'){
						likeButton.toggleClass('btn-outline');
						likeCount.text(data.data1);
						likeCountC.text(data.data1);
						DislikeButton.toggleClass('btn-outline');
						DislikeCount.text(data.data2);
						DislikeCountC.text(data.data2);
		
					}else {
						DislikeButton.toggleClass('btn-outline');
						DislikeCount.text(data.data2);
						DislikeCountC.text(data.data2);
					}
			
				}else {
					alert(data.msg);
				}
			},
			error: function(jqXHR,textStatus,errorThrown) {
				alert('싫어요 오류 발생 : ' + textStatus);
			}
			
		});
	}
	$(function() {
		checkRP();
	});
</script>
<!-- 댓글 수정 -->
<!-- <script>
function toggleModifybtn(replyId) {
	
	console.log(replyId);
	
	$('#modify-btn-'+replyId).hide();
	$('#save-btn-'+replyId).show();
	$('#reply-'+replyId).hide();
	$('#modify-form-'+replyId).show();
}
function doModifyReply(replyId) {
	 console.log(replyId); // 디버깅을 위해 replyId를 콘솔에 출력
	    
	    // form 요소를 정확하게 선택
	    var form = $('#modify-form-' + replyId);
	    console.log(form); // 디버깅을 위해 form을 콘솔에 출력
	    // form 내의 input 요소의 값을 가져옵니다
	    var text = form.find('input[name="reply-text-' + replyId + '"]').val();
	    console.log(text); // 디버깅을 위해 text를 콘솔에 출력
	    // form의 action 속성 값을 가져옵니다
	    var action = form.attr('action');
	    console.log(action); // 디버깅을 위해 action을 콘솔에 출력
	
    $.post({
    	url: '/usr/reply/doModify', // 수정된 URL
        type: 'POST', // GET에서 POST로 변경
        data: { id: replyId, body: text }, // 서버에 전송할 데이터
        success: function(data) {
        	$('#modify-form-'+replyId).hide();
        	$('#reply-'+replyId).text(data);
        	$('#reply-'+replyId).show();
        	$('#save-btn-'+replyId).hide();
        	$('#modify-btn-'+replyId).show();
        },
        error: function(xhr, status, error) {
            alert('댓글 수정에 실패했습니다: ' + error);
        }
	})
}
</script> -->
<section class="mt-10 text-xl px-4 mx-auto max-w-screen-lg">
	<!-- 댓글 리스트 -->
	<div class="mx-auto">
		<table class="table" border="1" cellspacing="0" cellpadding="5"
			style="width: 100%; border-collapse: collapse;">
			<tbody>
				<c:forEach var="reply" items="${replies}">
					<tr>
						<td style="text-align: left; width: 150px;">${reply.extra__writer}</td>
						<td style="text-align: left;">${reply.body}</td>
						<td style="text-align: right; width: 150px;">${reply.regDate.substring(0,16)}</td>
						<c:if test="${reply.userCanDelete }">
							<td style="text-align: right; width: 100px;"><a
								class="btn btn-outline btn-xs btn-error"
								onclick="if(confirm('정말 삭제?') == false) return false;"
								href="/usr/reply/doDelete?id=${reply.id }">삭제</a></td>
						</c:if>
					</tr>
				</c:forEach>
				<c:if test="${empty replies}">
					<tr>
						<td colspan="3" style="text-align: center;">댓글이 없습니다</td>
					</tr>
				</c:if>
			</tbody>
			<c:if test="${rq.isLogined() }">
				<form action="../reply/doWrite" method="POST"
					onsubmit="ReplyWrite__submit(this); return false;">
					<table class="table" border="1" cellspacing="0" cellpadding="5"
						style="width: 100%; border-collapse: collapse;">
						<input type="hidden" name="relTypeCode" value="article" />
						<input type="hidden" name="relId" value="${article.id }" />
						<tbody>
							<tr>
								<th>댓글 내용 입력</th>
								<td style="text-align: center;"><textarea
										class="input input-bordered input-sm w-full max-w-xs"
										name="body" autocomplete="off" placeholder="내용을 입력해"></textarea>
								</td>
								<td style="text-align: center;">
									<button class="btn btn-outline">작성</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</c:if>
			<c:if test="${!rq.isLogined() }">
        댓글 작성을 위해 <a class="btn btn-outline btn-primary"
					href="${rq.loginUri }">로그인</a>이 필요합니다
    </c:if>
		</table>
	</div>
</section>


<%@ include file="../common/foot.jspf"%>
