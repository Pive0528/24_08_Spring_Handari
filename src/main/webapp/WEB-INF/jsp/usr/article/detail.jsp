<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>
<hr />

<!-- <iframe src="http://localhost:8080/usr/article/doIncreaseHitCount?id=757" frameborder="0"></iframe> -->
<!-- 변수 -->
<script>
	const params = {};
	params.id = parseInt('${param.id}');
	params.memberId = parseInt('${loginedMemberId}')
	
	console.log(params);
	console.log(params.id);
	console.log(params.memberId);

	var isAlreadyAddGoodRp = ${isAlreadyAddGoodRp};
	var isAlreadyAddBadRp = ${isAlreadyAddBadRp};
</script>

<!-- 조회수 -->
<script>
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
			console.log(data);
			console.log(data.data1);
			$('.article-detail__hit-count').empty().html(data.data1);
		}, 'json')
	}

	$(function() {
		// 		ArticleDetail__doIncreaseHitCount();
		setTimeout(ArticleDetail__doIncreaseHitCount, 2000);
	})
</script>


<section class="mt-6 text-xl px-4">
	<div class="mx-auto max-w-screen-lg">
		<table class="table" border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
			<tbody>
				<tr>
					<th style="text-align: center;">글 번호</th>
					<td style="text-align: center;">${article.id}</td>
				</tr>
				<tr>
					<th style="text-align: center;">작성 날짜</th>
					<td style="text-align: center;">${article.updateDate}</td>
				</tr>
				<tr>
					<th style="text-align: center;">제목</th>
					<td style="text-align: center;">${article.title}</td>
				</tr>
				<tr>
					<th style="text-align: center;">작성자</th>
					<td style="text-align: center;">${article.extra__writer}</td>
				</tr>
				<!--
				<tr>
					<th class="reaction" style="text-align: center;">좋아요</th>
					<td id="likeCount" style="text-align: center;">${article.goodReactionPoint}</td>
				</tr>
				<tr>
					<th style="text-align: center;">싫어요</th>
					<td id="DislikeCount" style="text-align: center;">${article.badReactionPoint}</td>
				</tr>
				 -->

				<tr>
					<th style="text-align: center;">좋아요 / 싫어요 ${usersReaction }</th>
					<td style="text-align: center;">

						<button id="likeButton" class="btn btn-outline btn-success" onclick="doGoodReaction(${param.id})">
							👍 LIKE <span class="likeCount">${article.goodReactionPoint}</span>
						</button>
						<button id="DislikeButton" class="btn btn-outline btn-error" onclick="doBadReaction(${param.id})">
							👎 DISLIKE <span class="DislikeCount">${article.badReactionPoint}</span>
						</button> <%-- 						<a href="/usr/reactionPoint/doGoodReaction?relTypeCode=article&relId=${param.id }&replaceUri=${rq.currentUri}" --%>
						<%-- 							class="btn btn-outline btn-success">👍 LIKE ${article.goodReactionPoint}</a> --%> <%-- 						<a href="/usr/reactionPoint/doBadReaction?relTypeCode=article&relId=${param.id }&replaceUri=${rq.currentUri}" --%>
						<%-- 							class="btn btn-outline btn-error">👎 DISLIKE ${article.badReactionPoint}</a> --%>
					</td>
				</tr>

				<tr>
					<th style="text-align: center;">조회수</th>
					<td style="text-align: center;"><span class="article-detail__hit-count">${article.hitCount}</span></td>
				</tr>
				
				<tr>
					<th style="text-align: center;">이미지</th>
					<td style="text-align: center;">
						<div style="text-align: center;">
							<img class="mx-auto rounded-xl" src="${rq.getImgUri(article.id)}" onerror="${rq.profileFallbackImgOnErrorHtml}"
								alt="" />
						</div>
						<div>${rq.getImgUri(article.id)}</div>
					</td>
				</tr>
				<tr>
					<th style="text-align: center;">내용</th>
					<td>
						<div class="toast-ui-viewer">
							<script type="text/x-template">${article.body}</script>
						</div>
					</td>
				</tr>

			</tbody>
		</table>
	</div>
</section>

</section>


<%@ include file="../common/foot.jspf"%>
