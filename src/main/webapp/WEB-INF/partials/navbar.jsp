<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg">
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
            <c:choose>
                <c:when test="${sessionScope.user != null}" >
                    <li class="nav-item">
                        <a class="nav-link" href="/ads/create">Create Ad</a>
                    </li>
                </c:when>
            </c:choose>
        </ul>
        <form action="/ads" class="navbar-form form-inline my-2 my-lg-0" role="search">
            <div class="form-group">
                <input id="search" class="form-control mr-sm-2" name="search" type="search" placeholder="Search NLGL" aria-label="Search">
            </div>
            <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
        </form>
        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${sessionScope.user != null}" >
                    <div class="text-right p-0 mr-2">
                        <li>Welcome, ${sessionScope.user.username}!</li>
                    </div>
                    <div class="text-right p-0 mr-2">
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
