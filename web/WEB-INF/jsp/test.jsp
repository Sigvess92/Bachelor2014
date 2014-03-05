<%--
    Document   : test
    Created on : Feb 12, 2014, 2:20:53 PM
    Author     : Sigve
--%>

<%@ include file="/WEB-INF/jsp/include.jsp" %> 

<html>
    <head>
        <title><fmt:message key="title"/></title>
    </head>

    <body>
        <script>
            function resetDB() {
                $.get('DBServlet', null, function(data) {
                });
            }
            $(function() {
                $("#dialog").dialog({
                    title: "Achievement get!",
                    autoOpen: false,
                    buttons: [{
                            text: "OK",
                            click: function() {
                                $(this).dialog("close");
                            }
                        }
                    ]
                });
            });
        </script>
        <%--GAGE SCRIPT--%>
        <script>
            var g1, g2, g3;
            var number = 0; //startvalue
            var oldcount = 0;
            window.onload = function() {
                var g1 = new JustGage({
                    id: "g1",
                    value: number,
                    min: 0,
                    max: 2000,
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
                var g3 = new JustGage({
                    id: "g3",
                    value: number,
                    min: 0,
                    max: 100,
                    title: "Achievements",
                    label: "Total"
                });
                //Give an initial value to oldcount so that old achievements doesn't trigger the pop-up at launch
                $.get('AchievementServlet', null, function(data) {
                    if (data != null) {
                        $.each(data, function(key, value) {
                            oldcount++;
                        });
                    }
                });
                //Update gages
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
                setInterval(function() {
                    var count = 0;
                    var text = 0;
                    var imgurl;
                    $.get('AchievementServlet', null, function(data) {
                        if (data != null) {
                            $.each(data, function(key, value) {
                                count++;
                                text = value['title'];
                                imgurl = value['image'];
                            });
                            if (oldcount < count) {
                                $("#contenttext").text(text);
                                $("<img/>").prependTo("#dialog").attr({src: imgurl});
                                $("#dialog").dialog("open");
                                oldcount = count;
                            }
                            g3.refresh(count);
                        }
                    }
                    );
                }, 2500);
            };            
        </script>

        <%--GRID SCRIPT--%>

        <script type="text/javascript">
            var gridster;
            $(function() {
                gridster = $(".gridster > ul").gridster({
                    widget_margins: [5, 5],
                    widget_base_dimensions: [100, 55]
                }).data('gridster');
            });
        </script> 

        <%--LINECHART SCRIPT--%>

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

        <%--BARCHART SCRIPT--%>

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
                            text: ''
                        },
                        categories: ['']
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: 'Total'
                        }
                    },
                    series: [{
                            name: 'Bug',
                            data: [0]
                        },
                        {
                            name: 'Feature',
                            data: [0]
                        },
                        {
                            name: 'Test case',
                            data: [0]
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

        <%--PIECHART SCRIPT--%>

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
                        plotShadow: false,
                        events: {
                            load: updateChart3
                        }
                    },
                    title: {
                        text: 'Status of Jira issues'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>' //convert to percentage
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: false,
                                color: '#000000',
                                connectorColor: '#000000',
                                formatter: function() {
                                    return '<b>' + this.point.name + '</b>: ' + this.percentage.toPrecision(3) + ' %'; //convert to percentage
                                }
                            }
                        }

                    },
                    series: [{
                            type: 'pie',
                            name: 'Status',
                            data: [
                                ['Resolved/Passed', 0],
                                ['Open', 0],
                                ['In-Progress', 0]
                            ]
                        }]
                });
                setInterval(updateChart3, 2500);
            });
            var updateChart3 = function() {
                var passed = 0;
                var open = 0;
                var inProgress = 0;
                $.get('IssueServlet', function(responseJson) {
                    if (responseJson != null) {
                        $.each(responseJson, function(key, value) {
                            if (value['status'] === "Passed") {
                                passed++;
                            } else if (value['status'] === "Open") {
                                open++;
                            } else {
                                inProgress++;
                            }
                        });
                        chart3.series[0].setData([['Passed/Resolved', passed], ['Open', open], ['In-progress', inProgress]]);
                    }
                });
            };
        </script>
        <div id="dialog" title="Basic dialog" style="display: none;">
            <div id="contenttext"></div>
        </div>

        <div class="gridster ready">
            <ul style="width: 100%; position: relative; height: 100%;">
                <li data-col="8" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute">
                    <img id="logo" src="<c:url value="/Resources/images/sintef.gif"/>"> 
                </li>
                <li data-col="1" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute"><div id="g1"></div></li>
                <li data-col="15" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute"><div id="g2"></div></li>
                <li data-col="11" data-row="3" data-sizex="6" data-sizey="7" class="gs-w" style="position:absolute"><div id="chart"></div></li>
                <li data-col="1" data-row="3" data-sizex="6" data-sizey="7" class="gs-w" style="position:absolute"><div id="chart2"></div></li>
                <li data-col="8" data-row="3" data-sizex="2" data-sizey="3" class="gs-w" style="position:absolute"><div id="chart3"></div></li>
                <li data-col="3" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute"><div id="g3"></div></li>
                <li data-col="3" data-row="1" data-sizex="1" data-sizey="1" class="gs-w" style="position:absolute">
                    <div id="resetdb">
                        <img name="Reset" id="reset" src="<c:url value="/Resources/images/reset.jpg"/>" onClick="resetDB()">
                        <h3>resetDB</h3>
                    </div>
                </li>
            </ul>
        </div>

    </body>
</html>


