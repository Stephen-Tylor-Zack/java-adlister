<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body id="index">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div>
        <h1>Welcome to the Next Level Game Lister! <br>Pick your path</h1>
    </div>



    <div class="card-group" action="/ads/category" name="category">
        <div class="card">
            <a href="/ads/category?cat=1">
            <img class="card-img-top" src="img/xbox-logo-png.png" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Xbox</h5>
            </div>
            </a>
        </div>
        <div class="card">
            <a href="/ads/category?cat=2">
            <img class="card-img-top" src="/img/Sony-PlayStation-Logo.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Playstation</h5>
            </div>
            </a>
        </div>
        <div class="card">
            <a href="/ads/category?cat=3">
            <img class="card-img-top" src="/img/nintendo-retro-arcade-game-logo-sticker-800x800.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Nintendo</h5>
            </div>
            </a>
        </div>
        <div class="card">
            <a href="/ads/category?cat=4">
            <img class="card-img-top" src="img/pc-game-logo-blacksolid.png" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">PC</h5>
            </div>
            </a>
        </div>
    </div>
</body>
</html>
