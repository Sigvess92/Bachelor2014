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
            h3 {
                color:#B4CDCD;
                font-size:130%;
            }
            #logo {
                top: 0;
                left: 0;
            }

            #g1 {
                width: 20%; height: 16%;
                display: inline-block;
                margin: 1em;
                float: left;
            }

            #g2 {
                width: 20%; height: 16%;
                display: inline-block;
                margin: 1em;
                float: left;
            }

            #chart {
                width: 60%; height: 60%;
            }
        </style>
    </head>
    <script type="text/javascript" src="<c:url value="/Resources/js/raphael.2.1.0.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/justgage.1.0.1.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/jQuery.1.11.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/highcharts.js" />"></script>

    <script>
        var g1, g2;
        var number = 0;
        window.onload = function() {
            var g1 = new JustGage({
                id: "g1",
                value: number,
                min: 0,
                max: 18,
                title: "Timesheets",
                label: "Registered"
            });
            var g2 = new JustGage({
                id: "g2",
                value: number,
                min: 0,
                max: 100,
                title: "External hours",
                label: "Percent"
            });
            setInterval(function() {
                $.get('GaugeServlet', null, function(data) {
                    if (data != null) {
                        g1.refresh(data.toString());
                    }
                }
                );
            }, 2500);
            setInterval(function() {
                var count = 0;
                var percent = 0.0;
                $.get('WorkHourServlet', null, function(data) {
                    if (data != null) {
                        $.each(data, function(key, value) {
                            percent = percent + value['percentExternal'];
                            count++;
                        });
                        g2.refresh((percent / count).toPrecision(3));
                    }
                }
                );
            }, 2500);
        };
    </script>
    <%--
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
    --%>
    <script>
        var chart;
        $(document).ready(function() {
            chart = new Highcharts.Chart({
                chart: {
                    defaultSeriesType: 'line',
                    renderTo: 'chart',
                    inverted: false,
                    events: {
                        load: updateChart
                    }
                },
                title: {
                    text: 'Work hours'
                },
                xAxis: {
                    title: {
                        text: 'Day'
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Hours'
                    }
                },
                series: [{
                        name: 'Hours Total',
                        data: []
                    },
                    {
                        name: 'Goal',
                        data: []
                    }]
            });
            setInterval(updateChart, 2500);
        });
        var updateChart = function() {
            var hours = 0;
            $.get('WorkHourServlet', function(responseJson) {
                if (responseJson != null) {
                    $.each(responseJson, function(key, value) {
                        hours = hours + value['hoursTotal'];
                    });
                    var series = chart.series[0],
                            shift = series.data.length > 10;
                    chart.series[0].addPoint(hours, true, shift);
                    chart.series[1].addPoint(40 * 18, true, shift);//this needs to be fixed
                }
            });
        };
    </script>    
    <body>
        <img id="logo" src="<c:url value="/Resources/images/sintef.gif"/>">
        <div class="grid">
            <h3>Materialer og Kjemi</h3>            
            <div id="g1"></div>
            <div id="g2"></div>
            <div id="chart"></div>

            <%--
            <div id="workdiv">
                <table cellspacing ="0" id="worktable">
                    <tr>
                        <th scope="col">ID:</th>
                        <th scope="col">Hours total:</th>
                        <th scope="col">Percent external:</th>
                    </tr>
                </table> 
            </div>
            --%>
        </div>
    </body>
</html>
