<%@ page import="static com.codeup.adlister.controllers.CreateAdServlet.titleError" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="../partials/navbar.jsp" />
<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <%=titleError%>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group primary">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input id="price" name="price" class="form-control" type="text" required>
        </div>
        <div class="form-group">
            <label for="city">City</label>
            <input id="city" name="city" class="form-control" type="text" required>
        </div>
        <div class="form-group">
            <label for="state">State</label>
            <input id="state" name="state" class="form-control" type="text" required>
        </div>
        <div class="form-group">
            <label>Category</label><br>
            <div class="checkboxes">
                <input class="categorySelect" id="xbox" type="checkbox" name="cats_id" value="1">
                <label class="categoryLabel" id="xboxlabel" for="xbox">Xbox</label>
            </div>
            <div>
                <input class="categorySelect" id="playstation" type="checkbox" name="cats_id" value="2">
                <label class="categoryLabel" id="playstationlabel" for="playstation">Playstation</label>
            </div>
            <div>
                <input class="categorySelect" id="nintendo" type="checkbox" name="cats_id" value="3">
                <label class="categoryLabel" id="nintendolabel" for="nintendo">Nintendo</label>
            </div>
            <div>
                <input class="categorySelect" id="pc" type="checkbox" name="cats_id" value="4">
                <label class="categoryLabel" id="pclabel" for="pc">PC</label>
            </div>
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>

<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
