<%--
  Created by IntelliJ IDEA.
  User: stephenapolinar
  Date: 8/28/18
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.title}" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<h5>
    <c:out value="${ad.title}"/>
</h5>
<p>
    <c:out value="${ad.description}"/>
</p>

<p>
    <c:out value="post by: ${ad.username}"/><br>
    <c:out value="price: $${ad.price}"/><br>
    <c:out value="location: ${ad.city}, ${ad.state}"/><br>


</p>




</body>
</html>