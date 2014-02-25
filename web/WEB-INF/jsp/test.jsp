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

        $(function() {

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

    <script>
        var chart2;
        $(document).ready(function() {
            chart2 = new Highcharts.Chart({
                credits: {
                    enabled: false
                },
                chart: {
                    type: 'column',
                    renderTo: 'chart2',
                    events: {
                        load: updateChart2
                    }
                },
                title: {
                    text: 'Issues'
                },
                xAxis: {
                    title: {
                        text: 'A'
                    },
                    categories: ['derp']
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Total'
                    }
                },
                series: [{
                        name: 'Bug',
                        data: [3]
                    },
                    {
                        name: 'Feature',
                        data: [4]
                    },
                    {
                        name: 'Test case',
                        data: [5]
                    }]
            });
            setInterval(updateChart2, 2500);
        });
        var updateChart2 = function() {
            var bug = 0;
            var feature = 0;
            var test = 0;
            $.get('IssueServlet', function(responseJson) {
                if (responseJson != null) {
                    $.each(responseJson, function(key, value) {
                        if (value['issuetype'] === "Bug") {
                            bug++;
                        } else if (value['issuetype'] === "Feature") {
                            feature++;
                        } else {
                            test++;
                        }
                    });
                    chart2.series[0].data[0].update(bug);
                    chart2.series[1].data[0].update(feature);
                    chart2.series[2].data[0].update(test);
                }
            });
        };
    </script> 
    <script>
        var chart3;
        // Radialize the colors
        Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function(color) {
            return {
                radialGradient: {cx: 0.5, cy: 0.3, r: 0.7},
                stops: [
                    [0, color],
                    [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
                ]
            };
        });

        // Build the chart

        $(document).ready(function() {
            chart3 = new Highcharts.Chart({
                credits: {
                    enabled: false
                },
                chart: {
                    type: 'pie',
                    renderTo: 'chart3',
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Browser market shares at a specific website, 2010'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            formatter: function() {
                                return '<b>' + this.point.name + '</b>: ' + this.percentage + ' %';
                            }
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Browser share',
                        data: [
                            ['Firefox', 45.0],
                            ['IE', 26.8],
                            {
                                name: 'Chrome',
                                y: 12.8,
                                sliced: true,
                                selected: true
                            },
                            ['Safari', 8.5],
                            ['Opera', 6.2],
                            ['Others', 0.7]
                        ]
                    }]
            });
        });
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
                <li data-col="1" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute"><div id="g1"></div></li>
                <li data-col="3" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute"><div id="g2"></div></li>
                <li data-col="5" data-row="1" data-sizex="6" data-sizey="6" class="gs-w" style="position:absolute"><div id="chart"></div></li>
                <li data-col="5" data-row="7" data-sizex="6" data-sizey="6" class="gs-w" style="position:absolute"><div id="chart2"></div></li>
                <li data-col="1" data-row="3" data-sizex="4" data-sizey="4" class="gs-w" style="position:absolute"><div id="chart3"></div></li>
            </ul>
        </div



    </body>
</html>


