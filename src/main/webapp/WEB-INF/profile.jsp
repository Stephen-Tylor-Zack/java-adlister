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
                    <img class="gameImgs" src="${result[0].cover.url}">
                    <input type="text" class="gameRating">
                    <h2>${ad.description}</h2>
                    <input id="id" type="hidden" value="${ad.id}" name="id">
                    <c:if test="${ad.username == sessionScope.user.username}">
                    <a class="btn btn-primary" href="/ads/edit-ad?id=${ad.id}">Edit</a>
                    <a class="btn btn-primary deletebtn" id="deletebtn" href="/ads/delete-ad?id=${ad.id}">Delete</a>
                    </c:if>
                </div>
            </c:forEach>
            <button id="button">dButton</button>
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


    var gameTitles = document.getElementsByClassName("gameTitle");

    var limitNum = gameTitles.length;

        $('.gameList').each(function (i, obj) {
            console.log(obj);
            var gameTitle = $(obj).children().first().html();
            $.get("/hello?search="+ gameTitle).done(function(data) {
                console.log(i);
                console.log(data[0].cover.url);
                console.log(data[0].rating);
                var ratingObj = data[0].rating;
                var rating = parseFloat(ratingObj).toFixed(2);
                console.log(rating);

                    $(obj).children().first().next().next().attr("src", data[0].cover.url);
                    // $('.gameImgs').attr("src", data[0].cover.url);
                    $('.gameRating').innerText = rating;
            });
        });


    // $('.gameTitle').each(function (i, obj) {
    //     console.log(obj.value);
    //     $.get("/hello?search="+obj.value).done(function(data) {
    //         console.log(data);
    //         console.log(data[0].cover.url);
    //         console.log(data[0].rating);
    //         var ratingObj = data[0].rating;
    //         var rating = parseFloat(ratingObj).toFixed(2);
    //         console.log(rating);
    //         $('.gameImgs').attr("src", data[0].cover.url);
    //         $('.gameRating').innerText = rating;
    //     });
    // });

    //
    // $('#button').click(function () {
    //     $('.gameTitle').each(function (i, obj) {
    //         console.log(obj.value);
    //         $.get("/hello?search="+obj.value).done(function(data) {
    //             console.log(data);
    //             console.log(data[0].cover.url);
    //             console.log(data[0].rating);
    //             url = data[0].cover.url;
    //             var rating = data[0].rating;
    //             $('.gameImgs').each(function (i, obj2, url) {
    //                 console.log(url);
    //                 console.log(obj2);
    //                 $(obj2).css("src", url)
    //             });
    //         });
    //     });
    // })



</script>
</body>
</html>
