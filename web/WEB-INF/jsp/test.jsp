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
                <li data-col="8" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute">
                    <img id="logo" src="<c:url value="/Resources/images/sintef.gif"/>"> 
                </li>
                <li data-col="1" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute"><div id="g1"></div></li>
                <li data-col="15" data-row="1" data-sizex="2" data-sizey="2" class="gs-w" style="position:absolute"><div id="g2"></div></li>
                <li data-col="11" data-row="3" data-sizex="6" data-sizey="7" class="gs-w" style="position:absolute"><div id="chart"></div></li>
                <li data-col="1" data-row="3" data-sizex="6" data-sizey="7" class="gs-w" style="position:absolute"><div id="chart2"></div></li>
                <li data-col="8" data-row="3" data-sizex="2" data-sizey="3" class="gs-w" style="position:absolute"><div id="chart3"></div></li>
                <li data-col="3" data-row="1" data-sizex="2" data-sizey="3" class="gs-w" style="position:absolute"><div id="g3"></div></li>
                <li data-col="3" data-row="1" data-sizex="2" data-sizey="3" class="gs-w" style="position:absolute">
                    <div id="ach1">
                        <img id="pic1" src="<c:url value="/Resources/images/ach1.jpg"/>">
                        <br/><br/>
                        <h3>ach1</h3>
                    </div>
                </li>
                
            </ul>
        </div
    </body>
</html>


