<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getAttribute("ip");
basePath+=path+"/";
String ctxPath=basePath.substring(0,basePath.length()-1);
/* String websocket=request.getServerName()+":"+request.getServerPort()+path; */

%>
<c:set var="_ctx" value="<%=ctxPath%>" />
<%-- <c:set var="_websocket" value="<%=websocket%>" /> --%>
<c:set var="_basePath" value="<%=basePath%>" />
