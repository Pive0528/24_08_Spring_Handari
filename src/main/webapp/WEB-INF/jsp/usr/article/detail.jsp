
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
>>>>>>> ef81f033edd23219255d15bff4c2d8e11a77c783
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="글 상세보기"></c:set>
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
<<<<<<< HEAD
		</table>

		<!-- 제목 및 작성자, 조회수 -->
		<table class="table-auto mt-4" style="width: 100%;">
			<tr>
				<div class="post-name">
					<td style="text-align: left;">제목: ${article.title}</td>
				</div>

				<div class="post-look">
					<td style="text-align: right; color: #656565;">조회수: ${article.hitCount}</td>
				</div>
			</tr>
			<tr>
				<div class="post-writer">
					<td style="text-align: left; padding-bottom: 20px;">작성자: ${article.extra__writer}</td>
				</div>
			</tr>
		</table>

		<hr></hr>
		<!-- 본문 내용 -->
		<!-- 본문 내용 -->
		<p style="white-space: pre-wrap; padding-top: 20px; min-height: 300px; text-indent: 0;">${article.body}</p>



		<!-- 좋아요 / 싫어요 -->
		<div class="mt-10 mb-10 text-center">
			<button id="likeButton" class="btn btn-outline btn-success" onclick="doGoodReaction(${param.id})">
				👍 좋아요 <span class="likeCount">${article.goodReactionPoint}</span>
			</button>
			<button id="DislikeButton" class="btn btn-outline btn-error" onclick="doBadReaction(${param.id})">
				👎 싫어요 <span class="DislikeCount">${article.badReactionPoint}</span>
			</button>
		</div>

		<div class="btns">
			<button class="btn" type="button" onclick="history.back()">뒤로가기</button>
			<c:if test="${article.userCanModify }">
				<a class="btn" href="../article/modify?id=${article.id }">수정</a>
			</c:if>
			<c:if test="${article.userCanDelete }">
				<a class="btn" a onclick="if(confirm('정말 삭제 하시겠습니까?') == false) return false;"
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
	<!-- 댓글 수 표시 -->
	<div class="mb-4">
		<h2 class="text-lg font-bold">댓글 ${replies.size()}</h2>
	</div>

	<!-- 댓글 리스트 -->
	<div class="mx-auto">
		<table class="table" border="0" cellspacing="0" cellpadding="10" style="width: 100%; border-collapse: collapse;">
			<tbody>
				<c:forEach var="reply" items="${replies}">
					<tr>
						<!-- 작성자와 작성 날짜 -->
						<td colspan="2" style="text-align: left;"><span style="font-weight: bold;">${reply.extra__writer}</span> <span
							style="color: #999; margin-left: 10px;">${reply.regDate}</span></td>
					</tr>
					<tr>
						<!-- 댓글 내용 및 삭제 버튼 -->
						<td style="text-align: left; width: 100%;">${reply.body}</td>
						<c:if test="${reply.userCanDelete}">
							<td style="text-align: right;"><a class="btn btn-outline btn-error"
								style="font-size: 12px; border-radius: 5px; white-space: nowrap;"
								onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="/usr/reply/doDelete?id=${reply.id}"> 삭제 </a></td>
						</c:if>
					</tr>
				</c:forEach>
				<!-- 댓글이 없을 때 표시 -->
				<c:if test="${empty replies}">
					<tr>
						<td colspan="2" style="text-align: center;">댓글이 없습니다</td>
					</tr>
				</c:if>
			</tbody>
=======
>>>>>>> ef81f033edd23219255d15bff4c2d8e11a77c783
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
<<<<<<< HEAD

	<!-- 댓글 입력 폼 -->
	<c:if test="${rq.isLogined()}">
		<form id="replyForm" action="../reply/doWrite" method="POST" class="mt-5">
			<div style="border: 1px solid #ddd; padding: 15px; border-radius: 5px;">
				<input type="hidden" name="relTypeCode" value="article" /> <input type="hidden" name="relId" value="${article.id}" />

				<!-- 댓글 입력 -->
				<textarea id="commentInput" class="input input-bordered w-full" name="body" autocomplete="off"
					placeholder="댓글 내용을 입력해주세요."
					style="height: 80px; width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px;"
					onkeydown="submitOnEnter(event)"></textarea>

				<!-- 작성 버튼 -->
				<div style="text-align: right; margin-top: 10px;">
					<button type="submit" class="btn btn-outline btn-primary">댓글 등록</button>
				</div>
			</div>
		</form>
	</c:if>

	<!-- 로그인 유도 -->
	<c:if test="${!rq.isLogined()}">
		<div style="margin-top: 20px; text-align: center;">
			댓글 작성을 위해 <a href="${rq.loginUri}" class="btn btn-outline btn-primary">로그인</a>이 필요합니다.
		</div>
	</c:if>
</section>
=======
>>>>>>> ef81f033edd23219255d15bff4c2d8e11a77c783

<!-- JavaScript for Enter Key Submission -->
<script>
    function submitOnEnter(event) {
        if (event.key === 'Enter' && !event.shiftKey) {
            event.preventDefault();  // Prevent new line
            document.getElementById('replyForm').submit();  // Trigger form submission
        }
    }
</script>




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
    <!-- 댓글 수 표시 -->
    <div class="mb-4">
        <h2 class="text-lg font-bold">댓글 ${replies.size()}</h2>
    </div>

    <!-- 댓글 리스트 -->
    <div class="mx-auto">
        <table class="table" border="0" cellspacing="0" cellpadding="10"
            style="width: 100%; border-collapse: collapse;">
            <tbody>
                <c:forEach var="reply" items="${replies}">
                    <tr>
                        <!-- 작성자와 작성 날짜 -->
                        <td colspan="2" style="text-align: left;"><span
                            style="font-weight: bold;">${reply.extra__writer}</span> <span
                            style="color: #999; margin-left: 10px;">${reply.regDate.substring(0,16)}</span>
                        </td>
                    </tr>
                    <tr>
                        <!-- 댓글 내용 및 삭제 버튼 -->
                        <td style="text-align: left; width: 100%;">${reply.body}</td>
                        <c:if test="${reply.userCanDelete}">
                            <td style="text-align: right;"><a
                                class="btn btn-outline btn-error"
                                style="font-size: 12px; border-radius: 5px; white-space: nowrap;"
                                onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
                                href="/usr/reply/doDelete?id=${reply.id}"> 삭제 </a></td>
                        </c:if>
                    </tr>
                </c:forEach>
                <!-- 댓글이 없을 때 표시 -->
                <c:if test="${empty replies}">
                    <tr>
                        <td colspan="2" style="text-align: center;">댓글이 없습니다</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

    <!-- 댓글 입력 폼 -->
    <c:if test="${rq.isLogined()}">
        <form id="replyForm" action="../reply/doWrite" method="POST" class="mt-5">
            <div style="border: 1px solid #ddd; padding: 15px; border-radius: 5px;">
                <input type="hidden" name="relTypeCode" value="article" /> 
                <input type="hidden" name="relId" value="${article.id}" />

                <!-- 댓글 입력 -->
                <textarea id="commentInput" class="input input-bordered w-full"
                    name="body" autocomplete="off" placeholder="댓글 내용을 입력해주세요."
                    style="height: 80px; width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px;"
                    onkeydown="submitOnEnter(event)"></textarea>

                <!-- 작성 버튼 -->
                <div style="text-align: right; margin-top: 10px;">
                    <button type="submit" class="btn btn-outline btn-primary">댓글 등록</button>
                </div>
            </div>
        </form>
    </c:if>

    <!-- 로그인 유도 -->
    <c:if test="${!rq.isLogined()}">
        <div style="margin-top: 20px; text-align: center;">
            댓글 작성을 위해 <a href="${rq.loginUri}"
                class="btn btn-outline btn-primary">로그인</a>이 필요합니다.
        </div>
    </c:if>
</section>

<!-- JavaScript for Enter Key Submission -->
<script>
    function submitOnEnter(event) {
        if (event.key === 'Enter' && !event.shiftKey) {
            event.preventDefault();  // Prevent new line
            document.getElementById('replyForm').submit();  // Trigger form submission
        }
    }
</script>





<%@ include file="../common/foot.jspf"%>
