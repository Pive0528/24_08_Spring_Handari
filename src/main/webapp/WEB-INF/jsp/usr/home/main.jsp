<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="메인화면"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Calendar"%>
<hr />
<div class="mx-auto max-w-screen-lg">
<!-- Get the current month using JSP/Java -->
<%
Calendar cal = Calendar.getInstance();
int month = cal.get(Calendar.MONTH) + 1; // Adding 1 because months in Calendar start from 0
String imageUrl = "";
String textOverlay = "";// Logic for changing the image and text based on the month
if (month >= 8 && month <= 10) {
	imageUrl = "https://i.ibb.co/1b1nYgT/image-1.png";
	textOverlay = "가을의 첫 단풍을 볼 수 있는 곳, 설악산";
} else if (month >= 5 && month <= 7) {
	imageUrl = "https://i.ibb.co/NYyYGTK/image-2.png";
	textOverlay = "뜨거운 태양 아래 시원한 바람이 반가운 계절.";
} else if (month >= 2 && month <= 4) {
	imageUrl = "https://i.ibb.co/7tHzkxN/image-1.png";
	textOverlay = "싱그러운 벚꽃이 피는 계절.";
} else if (month >= 11 && month <= 1) {
	imageUrl = "https://i.ibb.co/CQdYYtx/image-3.png";
	textOverlay = "하얀 눈이 소복이 쌓여 세상을 포근하게 덮어주는 계절.";
}
%>


<!-- Importing the Jeju Myeongjo font -->
<style>
@import url('//fonts.googleapis.com/earlyaccess/jejumyeongjo.css');

/* Style for the background image */
.background-image-section {
	background-image: url('https://i.ibb.co/1b1nYgT/image-1.png');
	/* Replace with the actual image URL */
	background-size: cover;
	background-position: center;
	height: 400px;
	position: relative;
	s overflow: hidden;
}

/* Style for the text overlay */
.text-overlay {
	position: absolute;
	top: 60%; /* Moved down */
	left: 5%; /* Moved further to the left */
	transform: translateY(-50%);
	/* Center text vertically based on the adjusted top */
	font-family: 'Jeju Myeongjo', serif; /* Using the imported font */
	font-size: 30px;
	color: white;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
	/* Adding a shadow for better readability */
	max-width: 50%;
}
</style>


	<!-- Background image container -->
	<div class="background-image-section">
		<!-- Text overlay -->
		<div class="text-overlay">가을의 첫 단풍을 볼 수 있는 곳, 설악산</div>
	</div>

<!-- Importing the Jeju Myeongjo font -->
<style>
@import url('//fonts.googleapis.com/earlyaccess/jejumyeongjo.css');

/* General layout */
.main-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 20px;
}

.content-container {
	display: flex;
	justify-content: space-between;
	width: 80%;
	margin-top: 20px;
}

.notice-section, .festival-hot-section {
	width: 45%;
	background-color: white;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 8px;
}

.festivals-top10-section {
	display: flex;
	justify-content: space-between;
	width: 80%;
	margin-top: 40px;
	text-align: center;
}

.festival-list {
	width: 45%;
	background-color: white;
	border: 1px solid #ddd;
	padding: 20px;
	border-radius: 8px;
}

/* Styling for list and text */
.title {
	font-family: 'Jeju Myeongjo', serif;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

.list-item {
	font-family: 'Jeju Myeongjo', serif;
	margin: 5px 0;
	display: flex;
	justify-content: space-between;
}

.date {
	color: gray;
}

/* Styling for notice and festival HOT sections */
.notice-section .more-link, .festival-hot-section .more-link {
	text-align: right;
	font-size: 12px;
	color: #007BFF;
}

/* Styling for numbers */
.rank-number {
	background-color: #333;
	color: white;
	border-radius: 50%;
	width: 25px;
	height: 25px;
	display: inline-flex;
	justify-content: center;
	align-items: center;
}
</style>

<div class="main-container">
	<!-- Right-hand side content -->
	<div class="content-container">
		<!-- Notice Section -->
		<div class="notice-section">
			<div class="title">공지사항</div>
			<div class="list-item">
				사이트 운영 지침 <span class="date">09-04</span>
			</div>
			<div class="list-item">
				사이트 이용에 관하여 <span class="date">09-04</span>
			</div>
			<div class="list-item">
				네이버, 카카오 로그인 연동 안내 <span class="date">09-04</span>
			</div>
			<div class="more-link">
				<a href="#">더보기 -></a>
			</div>
		</div>

		<!-- Festival Hot Section -->
		<div class="festival-hot-section">
			<div class="title">축제후기 HOT</div>
			<div class="list-item">
				머드축제 진짜 좋았던 점 <span class="date">09-04</span>
			</div>
			<div class="list-item">
				와 진짜 인생 축제였습니... <span class="date">09-04</span>
			</div>
			<div class="list-item">
				1박2일로 친구랑 힐링여행... <span class="date">09-04</span>
			</div>
			<div class="more-link">
				<a href="#">더보기 -></a>
			</div>
		</div>
	</div>

	<!-- Bottom "진행중인 축제" and "진행예정 축제" -->
	<div class="festivals-top10-section">
		<!-- 진행중인 축제 Top 10 -->
		<div class="festival-list">
			<div class="title">진행중인 축제 Top 10</div>
			<div class="list-item">
				<span class="rank-number">1</span> 안성맞춤 남사당바우잡이축제 <span class="date">2024-08-05</span>
			</div>
			<div class="list-item">
				<span class="rank-number">2</span> 평창송어맨손잡이축제 <span class="date">2024-08-06</span>
			</div>
			<div class="list-item">
				<span class="rank-number">3</span> 평창송어맨손잡이축제 <span class="date">2024-08-06</span>
			</div>
			<!-- Continue for Top 10 -->
		</div>

		<!-- 진행예정 축제 Top 10 -->
		<div class="festival-list">
			<div class="title">진행예정 축제 Top 10</div>
			<div class="list-item">
				<span class="rank-number">1</span> 안성맞춤 남사당바우잡이축제 <span class="date">2024-10-05</span>
			</div>
			<div class="list-item">
				<span class="rank-number">2</span> 평창송어맨손잡이축제 <span class="date">2024-10-06</span>
			</div>
			<div class="list-item">
				<span class="rank-number">3</span> 평창송어맨손잡이축제 <span class="date">2024-10-06</span>
			</div>
			<!-- Continue for Top 10 -->
		</div>
	</div>
</div>
</div>

<%@ include file="../common/foot.jspf"%>
