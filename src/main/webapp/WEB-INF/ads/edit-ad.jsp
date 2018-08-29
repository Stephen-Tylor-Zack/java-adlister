<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="static com.codeup.adlister.controllers.CreateAdServlet.titleError" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Ed" />
    </jsp:include>
</head>
<body>
<div class="container">
    <h1>Edit Ad</h1>
    <form action="/ads/edit-ad" method="post">

        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" value="${ad.title}" required>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input id="price" name="price" class="form-control" type="number" value="${ad.price}" required>
        </div>
        <div class="form-group">
            <label for="city">City</label>
            <input id="city" name="city" class="form-control" type="text" value="${ad.city}" required>
        </div>
        <div class="form-group">
            <label for="state">State</label>
            <input id="state" name="state" class="form-control" type="text"value="${ad.state}" required>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text">${ad.description}</textarea>
        </div>
        <input type="hidden" name="id" value="${ad.id}">
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>

<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
