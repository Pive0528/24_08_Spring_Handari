//package com.example.demo.controller;
//
//import com.example.demo.service.Festival;
//import com.example.demo.util.FestivalDataParser;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/main")
//public class MainServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String filePath = getServletContext().getRealPath("/WEB-INF/festival.xml");
//        List<Festival> festivals = FestivalDataParser.parseFestivalData(filePath);
//
//        List<Festival> ongoingFestivals = FestivalDataParser.getOngoingFestivals(festivals);
//        List<Festival> upcomingFestivals = FestivalDataParser.getUpcomingFestivals(festivals);
//
//        request.setAttribute("ongoingFestivals", ongoingFestivals);
//        request.setAttribute("upcomingFestivals", upcomingFestivals);
//
//        request.getRequestDispatcher("/WEB-INF/jsp/main.jsp").forward(request, response);
//    }
//}
