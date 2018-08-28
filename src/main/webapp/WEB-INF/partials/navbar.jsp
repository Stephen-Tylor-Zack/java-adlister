<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Next Level Game Lister</a>
    <a href="/"><i class="fas fa-gamepad"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/ads">Games</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/profile">Profile</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
        </form>
        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${sessionScope.user != null}" >
                    <div class="container text-right p-0 mr-2">
                        <li>Welcome, ${sessionScope.user.username}!</li>
                    </div>
                    <div class="container text-right p-0 mr-2">
                        <li><a href="/logout">Logout</a></li>
                    </div>
                </c:when>
                <c:otherwise>
                    <li class="ml-3 mr-2"><a href="/login">Login</a></li>
                    <li> | </li>
                    <li class="ml-2 mr-2"><a href="/register">Register</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>
