<%--
  Created by IntelliJ IDEA.
  User: Zackry
  Date: 8/30/18
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test Api</title>
</head>
<body>

    <h2 class="test"></h2>

    <button type="button" onclick="document.getElementById('imagetest').src=resultObj[0].cover.url">Try it</button>
    <img id="imagetest" src="">


<script>

    var resultObj = ${result}
    console.log(resultObj);
    document.getElementsByClassName("test").innerHTML = resultObj[0].id


</script>
</body>
</html>
