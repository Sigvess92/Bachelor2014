<%-- 
    Document   : gridster
    Created on : Feb 24, 2014, 10:13:31 AM
    Author     : Frode
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/jsp/include.jsp" %> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <script type="text/javascript" src="<c:url value="/Resources/js/jQuery.1.11.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/jquery.gridster.js" />"></script>
    <script>
        $(function() { //DOM Ready

            $(".gridster ul").gridster({
                widget_margins: [10, 10],
                widget_base_dimensions: [140, 140]
            });

        });
    </script>

    <body>
        <div class="gridster">
    <ul>
        <li data-row="1" data-col="1" data-sizex="1" data-sizey="1"></li>
        <li data-row="2" data-col="1" data-sizex="1" data-sizey="1"></li>
        <li data-row="3" data-col="1" data-sizex="1" data-sizey="1"></li>
 
        <li data-row="1" data-col="2" data-sizex="2" data-sizey="1"></li>
        <li data-row="2" data-col="2" data-sizex="2" data-sizey="2"></li>
 
        <li data-row="1" data-col="4" data-sizex="1" data-sizey="1"></li>
        <li data-row="2" data-col="4" data-sizex="2" data-sizey="1"></li>
        <li data-row="3" data-col="4" data-sizex="1" data-sizey="1"></li>
 
        <li data-row="1" data-col="5" data-sizex="1" data-sizey="1"></li>
        <li data-row="3" data-col="5" data-sizex="1" data-sizey="1"></li>
 
        <li data-row="1" data-col="6" data-sizex="1" data-sizey="1"></li>
        <li data-row="2" data-col="6" data-sizex="1" data-sizey="2"></li>
    </ul>
</div>
    

    </body>
</html>

