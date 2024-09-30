<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="메인 화면"></c:set>
<%@ include file="../common/head.jspf"%>

<hr />

<div class="mx-auto max-w-screen-lg">

	<!-- Weather Display Section -->
	<div id="weather-section" style="margin-top: 20px;">
		<h3>Current Weather:</h3>
		<p id="weather-info">Fetching weather...</p>
	</div>
	<body>
	<button class="button" type="button" onclick="getWeather()">현재 날씨는?</button>
	<dl>
		<dt>기온</dt>
		<dd class="temperature"></dd>
		<dt>위치</dt>
		<dd class="place"></dd>
		<dt>설명</dt>
		<dd class="description"></dd>
	</dl>

	<script>
        const apiKey = '2b62a46be3f92ad9414c7c6d8a36433c'; // Replace with your OpenWeatherMap API key

        function getWeather() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(success, error);
            } else {
                document.querySelector('.description').innerText = "Geolocation is not supported by this browser.";
            }
        }

        function success(position) {
            const latitude = position.coords.latitude;
            const longitude = position.coords.longitude;

            const url = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${apiKey}&units=metric`;

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    document.querySelector('.temperature').innerText = `${data.main.temp}°C`;
                    document.querySelector('.place').innerText = data.name;
                    document.querySelector('.description').innerText = data.weather[0].description;
                })
                .catch(() => {
                    document.querySelector('.description').innerText = "Unable to fetch weather data.";
                });
        }

        function error() {
            document.querySelector('.description').innerText = "Unable to retrieve your location.";
        }
    </script>

	<style>
#location {
	position: fixed;
	bottom: 20px;
	right: 20px;
	background-color: rgba(0, 0, 0, 0.7);
	color: white;
	padding: 10px;
	border-radius: 5px;
	font-size: 14px;
}
</style>

	<div id="location">Fetching location...</div>

	<script>
        function showLocation(position) {
            const latitude = position.coords.latitude;
            const longitude = position.coords.longitude;
            document.getElementById("location").textContent = `Latitude: ${latitude}, Longitude: ${longitude}`;
        }

        function showError(error) {
            let message = "";
            switch (error.code) {
                case error.PERMISSION_DENIED:
                    message = "사용자가 위치 정보 제공을 거부했습니다.";
                    break;
                case error.POSITION_UNAVAILABLE:
                    message = "위치 정보를 사용할 수 없습니다.";
                    break;
                case error.TIMEOUT:
                    message = "위치 정보 요청이 시간 초과되었습니다.";
                    break;
                case error.UNKNOWN_ERROR:
                    message = "알 수 없는 오류가 발생했습니다.";
                    break;
            }
            document.getElementById("location").textContent = message;
        }


        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showLocation, showError);
            } else {
                document.getElementById("location").textContent = "Geolocation is not supported by this browser.";
            }
        }

        
        // Call the function to get the location
        getLocation();
    </script>

</body>
</div>



<%@ include file="../common/foot.jspf"%>
