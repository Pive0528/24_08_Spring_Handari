<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="메인화면"></c:set>
<%@ include file="../common/head.jspf"%>
<hr />

<!-- Importing the Jeju Myeongjo font -->
<style>
    @import url('//fonts.googleapis.com/earlyaccess/jejumyeongjo.css');

    /* Style for the background image */
    .background-image-section {
        background-image: url('https://i.ibb.co/1b1nYgT/image-1.png'); /* Replace with the actual image URL */
        background-size: cover;
        background-position: center;
        height: 400px;
        position: relative;s
        overflow: hidden;
    }

    /* Style for the text overlay */
    .text-overlay {
        position: absolute;
        top: 60%; /* Moved down */
        left: 5%;  /* Moved further to the left */
        transform: translateY(-50%); /* Center text vertically based on the adjusted top */
        font-family: 'Jeju Myeongjo', serif; /* Using the imported font */
        font-size: 30px;
        color: white;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7); /* Adding a shadow for better readability */
        max-width: 50%;
    }
</style>

<div class="mx-auto max-w-screen-lg">
    <!-- Background image container -->
    <div class="background-image-section">
        <!-- Text overlay -->
        <div class="text-overlay">
            가을의 첫 단풍을 볼 수 있는 곳, 설악산
        </div>
    </div>
</div>

<%@ include file="../common/foot.jspf"%>
