<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome to the Next Level Game Lister! Pick your path</h1>
    </div>

    <div action="/ads/category" name="category">
        <a href="/ads/xbox"><h2>Xbox</h2></a>

    </div>

    <div>
        <a href="/ads/category?=Playstation"><h2>PS4</h2></a>
    </div>
    <div>
        <a href="/ads/category?=Nintendo"><h2>Nintendo</h2></a>
    </div>
    <div>
        <a href="/ads/category?=PC"><h2>PC</h2></a>
    </div>
</body>
</html>
