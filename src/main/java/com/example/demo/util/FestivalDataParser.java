//package com.example.demo.util;
//
//import com.example.demo.service.Festival;
//import org.w3c.dom.*;
//import javax.xml.parsers.*;
//import java.io.File;
//import java.text.SimpleDateFormat;
//import java.util.*;
//import java.util.stream.Collectors;
//
//public class FestivalDataParser {
//    public static List<Festival> parseFestivalData(String filePath) {
//        List<Festival> festivals = new ArrayList<>();
//        try {
//            File xmlFile = new File(filePath);
//            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
//            DocumentBuilder builder = factory.newDocumentBuilder();
//            Document document = builder.parse(xmlFile);
//
//            NodeList nodeList = document.getElementsByTagName("record");
//
//            for (int i = 0; i < nodeList.getLength(); i++) {
//                Node node = nodeList.item(i);
//                if (node.getNodeType() == Node.ELEMENT_NODE) {
//                    Element element = (Element) node;
//
//                    Festival festival = new Festival();
//                    festival.setName(element.getElementsByTagName("축제명").item(0).getTextContent());
//                    festival.setStartDate(element.getElementsByTagName("축제시작일자").item(0).getTextContent());
//                    festival.setEndDate(element.getElementsByTagName("축제종료일자").item(0).getTextContent());
//                    festival.setLocation(element.getElementsByTagName("개최장소").item(0).getTextContent());
//
//                    festivals.add(festival);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return festivals;
//    }
//
//    public static List<Festival> getOngoingFestivals(List<Festival> festivals) {
//        Date today = new Date();
//        return festivals.stream()
//                .filter(f -> isDateAfter(today, f.getStartDate()) && isDateBefore(today, f.getEndDate()))
//                .sorted(Comparator.comparing(Festival::getEndDate))
//                .limit(10)
//                .collect(Collectors.toList());
//    }
//
//    public static List<Festival> getUpcomingFestivals(List<Festival> festivals) {
//        Date today = new Date();
//        return festivals.stream()
//                .filter(f -> isDateAfter(today, f.getStartDate()))
//                .sorted(Comparator.comparing(Festival::getStartDate))
//                .limit(10)
//                .collect(Collectors.toList());
//    }
//
//    private static boolean isDateAfter(Date base, String dateStr) {
//        try {
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//            Date date = sdf.parse(dateStr);
//            return !date.before(base);
//        } catch (Exception e) {
//            return false;
//        }
//    }
//
//    private static boolean isDateBefore(Date base, String dateStr) {
//        try {
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//            Date date = sdf.parse(dateStr);
//            return !date.after(base);
//        } catch (Exception e) {
//            return false;
//        }
//    }
//}
