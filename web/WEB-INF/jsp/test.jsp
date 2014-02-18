<%-- 
    Document   : test
    Created on : Feb 12, 2014, 2:20:53 PM
    Author     : Sigve
--%>
<%@ include file="/WEB-INF/jsp/include.jsp" %> 

<html>
    <head><title><fmt:message key="title"/></title>
        <style>
            body {
                text-align: center;
            }

            #g1 {
                width:400px; height:320px;
                display: inline-block;
                margin: 1em;
            }

            #g2, #g3, #g4 {
                width:100px; height:80px;
                display: inline-block;
                margin: 1em;
            }

            p {
                display: block;
                width: 450px;
                margin: 2em auto;
                text-align: left;
            }
        </style>
        <script type="text/javascript" src="<c:url value="/Resources/js/raphael.2.1.0.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/Resources/js/justgage.1.0.1.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/Resources/js/jQuery.1.11.js" />"></script>


      

        <script>
            var g1;
            var number = 0;

            window.onload = function() {
                var g1 = new JustGage({
                    id: "g1",
                    value: number,
                    min: 0,
                    max: 100,
                    title: "Timelister",
                    label: "antall"
                });


                setInterval(function() {
                    g1.refresh(getRandomInt(50, 100));

                }, 2500);
            };
        </script> 

        <script>
            $(document).ready(function() {
                var interval = 2500;   //number of mili seconds between each call
                var refresh = function() {
                    $.ajax({
            <%--
            url: "test.jsp",
            --%>
                        cache: false,
                        success: function(html) {
                            $('#work').html(html);
                            setTimeout(function() {
                                refresh();
                            }, interval);
                        }
                    });
                };
                refresh();
            });
        </script>

    </head>
    <body>
        <div id="g1"></div>
        <h3>Statistics</h3>
        <div id="work">
            <c:forEach items="${WorkHours}" var="hours">
                <c:out value="Hours total: ${hours.hoursTotal}"/>, <c:out value="Percent external hours: ${hours.percentExternal}"/><br><br>
            </c:forEach>  
        </div>
    </body>
</html>
