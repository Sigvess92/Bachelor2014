<%-- 
    Document   : test
    Created on : Feb 12, 2014, 2:20:53 PM
    Author     : Sigve
--%>
<%@ include file="/WEB-INF/jsp/include.jsp" %> 

<html>
    <head><title><fmt:message key="title"/></title>
        <%--
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
        --%>
        <link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

        <style type="text/css">

            table, td, th

            {

                border:1px solid green;

                font-family: 'Oxygen', sans-serif;

            }

            th

            {

                background-color:green;

                color:white;

            }

            body

            {

                text-align: center;

            }

            .container

            {

                margin-left: auto;

                margin-right: auto;

                width: 40em;

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
        <%--
        <script>
            $(document).ready(function() {
             
                setInterval(updateDiv,2500);

            });
               var updateDiv = function() {
                    $.ajax({
                        cache: false,
                        success: function(html) {
                            $("#work").html(html);
                        }
                    });
                };
                          
            </script>
        --%>


        <script>
            $(document).ready(function() {
                setInterval(updateDiv, 500);
            });
            var updateDiv = function() {
                $.get('WorkHourServlet', function(responseJson) {
                    if (responseJson != null) {
                        $("#worktable").find("tr:gt(0)").remove();

                        var table = $("#worktable");
                        $.each(responseJson, function(key, value) {
                            var rowNew = $("<tr><td></td><td></td><td></td></tr>");
                            rowNew.children().eq(0).text(value['id']);
                            rowNew.children().eq(1).text(value['hoursTotal']);
                            rowNew.children().eq(2).text(value['percentExternal']);
                            rowNew.appendTo(table);
                        });
                    }

                });
            };










        </script>

    </head>
    <body class="container">
        <%--<div id="g1"></div>--%>
        <h3>Statistics</h3>


        <div id="workdiv">
            <table cellspacing ="0" id="worktable">
                <tr>
                    <th scope="col">ID:</th>
                    <th scope="col">Hours total:</th>
                    <th scope="col">Percent external:</th>
                </tr>

            </table> 
        </div>

    </body>
</html>
