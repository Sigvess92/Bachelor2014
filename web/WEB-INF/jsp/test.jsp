<%-- 
    Document   : test
    Created on : Feb 12, 2014, 2:20:53 PM
    Author     : Sigve
--%>
<%@ include file="/WEB-INF/jsp/include.jsp" %> 
<html>
  <head><title>Hello :: Spring Application</title></head>
  <body>
    <h1>Hello - Spring Application</h1>
    <p>Greetings, it is now <c:out value="${now}"/></p>
    <c:forEach items="${model.hours}" var="hours">
      <c:out value="${hours.hoursTotal}"/> <i>$<c:out value="${hours.percentExternal}"/></i><br><br>
    </c:forEach>
  </body>
</html>