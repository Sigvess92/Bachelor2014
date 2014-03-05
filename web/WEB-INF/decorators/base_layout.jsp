<%-- 
    Document   : base_layout
    Created on : Feb 25, 2014, 3:24:20 PM
    Author     : Frode
--%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" 
           prefix="dec" %>
<%@ include file="/WEB-INF/jsp/include.jsp" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="Resources/css/jquery.gridster.css">
        <link rel="stylesheet" type="text/css" href="Resources/css/mainPage.css">
        <link rel="stylesheet" type="text/css" href="Resources/css/jquery-ui-1.10.4.custom.css">
    </head>
    <script type="text/javascript" src="<c:url value="/Resources/js/raphael.2.1.0.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/justgage.1.0.1.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/jQuery.1.11.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/jquery-ui-1.10.4.custom.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/highcharts.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/jquery.gridster.min.js" />"></script>
    <body>
        <div id="header">
            <h1>GAMIFICATION</h1>
        </div>
        <div id="content">
            <dec:body />
        </div>
    </body>    
</html>
