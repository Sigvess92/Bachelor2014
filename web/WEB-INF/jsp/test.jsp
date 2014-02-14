<%-- 
    Document   : test
    Created on : Feb 12, 2014, 2:20:53 PM
    Author     : Sigve
--%>
<%@ include file="/WEB-INF/jsp/include.jsp" %> 

<html>
    <head><title><fmt:message key="title"/></title>
        <script src="<c:url value="/resources/js/raphael.2.1.0.min.js" />"></script>
        <script src="<c:url value="/resources/js/justgage.1.0.1.min.js" />"></script>
        <script>

            var g1;

            window.onload = function() {
                var g1 = new JustGage({
                    id: "g1",
                    value: getRandomInt(0, 100),
                    min: 0,
                    max: 100,
                    title: "Big Fella",
                    label: "pounds"
                });

                setInterval(function() {
                    g1.refresh(getRandomInt(50, 100));
                }, 2500);
            };
        </script>
    </head>
    <body>
        <h1><fmt:message key="heading"/></h1>
        <p><fmt:message key="greeting"/> <c:out value="${model.now}"/></p>
        <h3>Statistics</h3>
        <c:forEach items="${model.hours}" var="hours">
            <c:out value="Hours total: ${hours.hoursTotal}"/>, <c:out value="Percent external hours: ${hours.percentExternal}"/><br><br>
        </c:forEach>      
        <div id="g1" class="200x160px"></div>
    </body>
</html>
