<%--
    Document   : test
    Created on : Feb 12, 2014, 2:20:53 PM
    Author     : Sigve
--%>

<%@ include file="/WEB-INF/jsp/include.jsp" %> 

<html>
    <head><title><fmt:message key="title"/></title>
        <link rel="stylesheet" type="text/css" href="Resources/css/jquery.gridster.css">
        <link rel="stylesheet" type="text/css" href="Resources/css/demo.css">
    </head>
    <script type="text/javascript" src="<c:url value="/Resources/js/raphael.2.1.0.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/justgage.1.0.1.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/jQuery.1.11.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/highcharts.js" />"></script>
    <script type="text/javascript" src="<c:url value="/Resources/js/jquery.gridster.min.js" />"></script>


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

    <script type="text/javascript">

        var gridster;

    $(function(){

      gridster = $(".gridster > ul").gridster({
          widget_margins: [5, 5],
          widget_base_dimensions: [100, 55]
      }).data('gridster');

    });

    </script> 


    <script>
        var chart;
        $(document).ready(function() {
            chart = new Highcharts.Chart({
                credits: {
                    enabled: false
                },
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
        <%--
       <div class="grid">
           <h3>Materialer og Kjemi</h3> 
          
           <div id="links">
               placeholder 1<br>
               placeholder 2<br>
               placeholder 3
           </div>
           <div id="g1"></div>
           <div id="g2"></div>
           <div id="chart"></div>

         
        </div>
        --%>
        
        
        <div class="gridster ready">
            <ul style="width: 100%; position: relative; height: 100%;">
                <li data-col="1" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:relative"><div id="g1"></div></li>
                <li data-col="2" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:relative"><div id="g2"></div></li>
                <li data-col="3" data-row="1" data-sizex="6" data-sizey="6" class="gs-w" style="position:relative"><div id="chart"></div></li>
            </ul>
        </div
        
     

    </body>
</html>


