<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <div class="row justify-content-center">
        <h1>Find your next adventure here...</h1>
    </div>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <a href="/ads/ad?id=${ad.id}"><h2>${ad.title}</h2></a>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>

<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
