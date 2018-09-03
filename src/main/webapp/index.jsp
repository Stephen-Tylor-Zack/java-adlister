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
            <img class="card-img-top" src="img/xbox-logo-png.png" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><a href="/ads/category?cat=1">Xbox</a></h5>
            </div>
        </div>
        <div class="card">
            <img class="card-img-top" src="/img/Sony-PlayStation-Logo.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><a href="/ads/category?cat=2">Playstation</a></h5>
            </div>
        </div>
        <div class="card">
            <img class="card-img-top" src="/img/nintendo-retro-arcade-game-logo-sticker-800x800.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><a href="/ads/category?cat=3">Nintendo</a></h5>
            </div>
        </div>
        <div class="card">
            <img class="card-img-top" src="img/pc-game-logo-blacksolid.png" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title"><a href="/ads/category?cat=4">PC</a></h5>
            </div>
        </div>
    </div>
</body>
</html>
