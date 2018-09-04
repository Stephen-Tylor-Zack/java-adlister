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
                <div class="col-4-md">
                    <h1>${ad.title}</h1>
                    <h2>${ad.description}</h2>
                    <a class="btn btn-primary" href="/ads/edit-ad?id=${ad.id}">Edit</a>
                    <a class="btn btn-primary" id="deletebtn" href="/ads/delete-ad?id=${ad.id}">Delete</a>
                </div>
            </c:forEach>
        </div>
    </div>

    <jsp:include page="/WEB-INF/partials/footer.jsp" />

<script>
    document.getElementById("deletebtn").addEventListener("click", function (ev) {
      var deleteChoice = confirm("Are you sure you want to delete?");
        if (deleteChoice) {

        }
    });
    console.log(document.getElementById("adId" + "${ad.id}"));

</script>
</body>
</html>
