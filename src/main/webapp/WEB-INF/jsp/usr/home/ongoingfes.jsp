<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    // 오늘 날짜 가져오기
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date today = sdf.parse(sdf.format(new Date())); // 시간 정보를 제거하여 비교
%>

<div class="festival-section">
    <h2>진행중인 축제 Top 10</h2>
    <table class="festival-table">
        <thead>
        <tr>
            <th></th>
            <th>축제명</th>
            <th>종료일</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <%
            // 축제 데이터 배열
            String[][] festivals = {
                    {"1", "제28회 파주장단콩축제", "2024-11-24"},
                    {"2", "11월 마토예술제<겨울이야기(가칭)>", "2024-11-30"},
                    {"3", "서천철새여행", "2024-12-01"},
                    {"4", "평창송어축제", "2024-12-01"},
                    {"5", "제11회 해운대 빛축제", "2024-12-01"},
                    {"6", "제37회 해운대북극곰축제", "2024-12-01"},
                    {"7", "크리스마스 구남로 거리공연", "2024-12-01"},
                    {"8", "2024년 송년의 밤 특별 콘서트", "2024-12-13"},
                    {"9", "시흥 거북섬 산타 페스타", "2024-12-15"},
                    {"10", "산타축제", "2024-12-25"}
            };

            for (String[] festival : festivals) {
                String rank = festival[0];
                String name = festival[1];
                String endDate = festival[2];

                // 종료일로 D-Day 계산
                String dDay;
                try {
                    Date endDateParsed = sdf.parse(endDate);
                    long diff = (endDateParsed.getTime() - today.getTime()) / (24 * 60 * 60 * 1000); // 일 단위로 계산

                    // 정확한 조건 처리
                    if (diff == 0) {
                        dDay = "D-DAY"; // 종료일이 오늘인 경우
                    } else if (diff == 1) {
                        dDay = "D-1"; // 종료일이 내일인 경우
                    } else if (diff > 1) {
                        dDay = "D-" + diff; // 종료일이 미래인 경우
                    } else {
                        dDay = "종료"; // 종료일이 이미 지난 경우
                    }
                } catch (Exception e) {
                    dDay = "Error";
                }
        %>
        <tr>
            <td><%= rank %></td>
            <td><%= name %></td>
            <td class="enddate"><%= endDate %></td>
            <td><%= dDay %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>