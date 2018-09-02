<%--
  Created by IntelliJ IDEA.
  User: stephenapolinar
  Date: 8/30/18
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.catgory}" />
    </jsp:include>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />


<c:forEach var="ad" items="${ads}">
    <div class="col-md-6">
        <a href="/ads/ad?id=${ad.id}"><h2>${ad.title}</h2></a>
        <p>${ad.description}</p>
    </div>
</c:forEach>

</body>
</html>
