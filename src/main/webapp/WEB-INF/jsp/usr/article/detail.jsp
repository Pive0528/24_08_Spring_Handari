
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>
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
</script>

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
					<td style="text-align: left;">작성자: ${article.extra__writer}</td>
				</div>
			</tr>
		</table>

		<hr></hr>
		<!-- 본문 내용 -->
		<div class="mt-6 text-2xl">${article.body}</div>

		<!-- 좋아요 / 싫어요 -->
		<div class="mt-6 text-center">
			<button id="likeButton" class="btn btn-outline btn-success"
				onclick="doGoodReaction(${param.id})">
				👍 LIKE <span class="likeCount">${article.goodReactionPoint}</span>
			</button>
			<button id="DislikeButton" class="btn btn-outline btn-error"
				onclick="doBadReaction(${param.id})">
				👎 DISLIKE <span class="DislikeCount">${article.badReactionPoint}</span>
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
		
	</div>
</section>

<%@ include file="../common/foot.jspf"%>
