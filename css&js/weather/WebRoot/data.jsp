<%@page language="java" contentType="text/html; charset=utf-8"import="java.util.*,org.apache.struts2.json.JSONUtil,com.spring.utils.*" pageEncoding="utf-8"%>

<%
	//String code = request.getParameter("code") ;
	String code = "12" ;
	List<String> strings = WeatherUtil.getWeather(Integer.parseInt(code));
	System.out.println(strings);

%>