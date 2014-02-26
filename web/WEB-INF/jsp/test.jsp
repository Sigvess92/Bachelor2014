<%--
    Document   : test
    Created on : Feb 12, 2014, 2:20:53 PM
    Author     : Sigve
--%>

<%@ include file="/WEB-INF/jsp/include.jsp" %> 

<html>
    <head><title><fmt:message key="title"/></title>
    </head>
    <body>
        
        <div class="gridster ready">
            <ul style="width: 100%; position: relative; height: 100%;">
                <li data-col="5" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute">
                    <img id="logo" src="<c:url value="/Resources/images/sintef.gif"/>"> 
                </li>
                <li data-col="1" data-row="2" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute"><div id="g1"></div></li>
                <li data-col="3" data-row="2" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute"><div id="g2"></div></li>
                <li data-col="5" data-row="2" data-sizex="6" data-sizey="6" class="gs-w" style="position:absolute"><div id="chart"></div></li>
                <li data-col="5" data-row="8" data-sizex="6" data-sizey="7" class="gs-w" style="position:absolute"><div id="chart2"></div></li>
                <li data-col="1" data-row="4" data-sizex="4" data-sizey="7" class="gs-w" style="position:absolute"><div id="chart3"></div></li>
            </ul>
        </div
    </body>
</html>


