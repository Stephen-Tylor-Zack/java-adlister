<%@ page import="com.codeup.adlister.util.Igdb" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <div class="row">
            <div class="col-4">
                <h1>Welcome, ${sessionScope.user.username}!</h1>
                <h2>${sessionScope.user.email}</h2>
            </div>
        </div>
        <div class="row">
            <button onclick="location.href = '/edit-profile'">Edit Profile</button>
        </div>
        <div class="row">
            <c:forEach var="ad" items="${userAds}">
                <div class="col-4-md gameList">
                    <h1>${ad.title}</h1>
                    <input class="gameTitle" type="hidden" value="${ad.title}" >
                    <img src="${result[0].cover.url}">
                    <h2>${ad.description}</h2>
                    <input id="id" type="hidden" value="${ad.id}" name="id">
                    <c:if test="${ad.username == sessionScope.user.username}">
                    <a class="btn btn-primary" href="/ads/edit-ad?id=${ad.id}">Edit</a>
                    <a class="btn btn-primary deletebtn" id="deletebtn" href="/ads/delete-ad?id=${ad.id}">Delete</a>
                        <button class="test">test</button>
                    </c:if>

                </div>
            </c:forEach>


        </div>
    </div>

    <jsp:include page="/WEB-INF/partials/footer.jsp" />

<script>

    var elems = document.getElementsByClassName("deletebtn");
    var confirmIt = function (e) {
        if (!confirm('Are you sure?')) e.preventDefault();
    };
    for (var i = 0, l = elems.length; i < l; i++) {
        elems[i].addEventListener('click', confirmIt, false);
    }


    var titleAmount = document.getElementsByClassName("gameTitle");

    // for (var i = 0, l = titleAmount.length; i < l; i++) {
    //     console.log($('.gameList').first().children()[i].val());
    //     console.log($('.'+gameList));
    // }

    $('.gameTitle').each(function (i, obj) {
        console.log(obj.value)
        $.ajax("http://localhost:8080/hello?search="+obj.value);
    });

    $(".test").click(function () {
        console.log($('.gameList').first().children().next[0].innerHTML);
    });


    var test;
</script>
</body>
</html>
