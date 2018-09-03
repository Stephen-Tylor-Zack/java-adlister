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

<div>
    <div class="row justify-content-center">
        <h1>Find your next adventure here...</h1>
    </div>



<c:forEach var="ad" items="${ads}">
<div class="text-center allcard">
    <div class="card-header">
        <a href="/ads/ad?id=${ad.id}"><h5>${ad.title}</h5></a>
    </div>
    <div class="card-body">
        <p class="card-text">${ad.description}</p>
        <a href="/ads/ad?id=${ad.id}" class="btn btn-primary">View Ad</a>
    </div>
</div>
</c:forEach>

</div>

<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
