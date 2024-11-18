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
    <h2>진행예정 축제 Top 10</h2>
    <table class="festival-table">
        <thead>
        <tr>
            <th></th>
            <th>축제명</th>
            <th>시작일</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <%
            // 축제 데이터 배열
            String[][] festivals = {
                    {"1", "제28회 파주장단콩축제", "2024-11-22\n"},
                    {"2", "11월 마토예술제<겨울이야기(가칭)>", "2024-11-30"},
                    {"3", "서천철새여행", "2024-11-30\n"},
                    {"4", "제11회 해운대 빛축제", "2024-12-01"},
                    {"5", "제37회 해운대북극곰축제", "2024-12-01"},
                    {"6", "크리스마스 구남로 거리공연", "2024-12-01"},
                    {"7", "거제대구수산물축제", "2024-12-01\n"},
                    {"8", "거제도국제펭귄수영축제", "2024-12-01\n"},
                    {"9", "애기동백축제", "2024-12-06\n"},
                    {"10", "거창크리스마스트리문화축제\n", "2024-12-06\n"}
            };

            for (String[] festival : festivals) {
                String rank = festival[0];
                String name = festival[1];
                String startDate = festival[2];

                // 시작일로 D-Day 계산
                String dDay;
                try {
                    Date startDateParsed = sdf.parse(startDate);
                    long diff = (startDateParsed.getTime() - today.getTime()) / (24 * 60 * 60 * 1000); // 일 단위로 계산

                    // 정확한 조건 처리
                    if (diff == 0) {
                        dDay = "D-DAY"; // 시작일이 오늘인 경우
                    } else if (diff > 0) {
                        dDay = "D-" + diff; // 시작일이 미래인 경우
                    } else {
                        dDay = "종료"; // 시작일이 이미 지난 경우
                    }
                } catch (Exception e) {
                    dDay = "Error";
                }
        %>
        <tr>
            <td><%= rank %></td>
            <td><%= name %></td>
            <td class="startdate"><%= startDate %></td>
            <td><%= dDay %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
