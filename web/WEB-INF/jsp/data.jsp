<%-- 
    Document   : data
    Created on : Feb 18, 2014, 4:13:56 PM
    Author     : Sigve
--%>
<%@ include file="/WEB-INF/jsp/include.jsp" %> 
<%
int number;
controller.database.executions.DBController db = new controller.database.executions.DBController("jdbc:mysql://localhost:3306/bachelor","com.mysql.jdbc.Driver","root","admin");
number = db.getListNumber();
%>
<%=number %>
