<%@ page import="static com.codeup.adlister.controllers.RegisterServlet.error" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <style>
        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
        }

        /* Style the submit button */
        input[type=submit] {
            background-color: #4CAF50;
            color: white;
        }

        /* Style the container for inputs */
        .container {
            background-color: #f1f1f1;
            padding: 20px;
        }

        /* The message box is shown when the user clicks on the password field */
        #message {
            display:none;
            background: #f1f1f1;
            color: #000;
            position: relative;
            padding: 20px;
            margin-top: 10px;
        }

        #message p {
            padding: 10px 35px;
            font-size: 18px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />
<div class="container">
    <h1>Please fill in your information.</h1>
    <form action="/edit-profile" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <%=error%>
            <input id="username" name="username" class="form-control" type="text" value="${sessionScope.user.username}" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" name="email" type="email" pattern="[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="Please enter a proper email address format:  Example@example.com" value="${sessionScope.user.email}" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm Password</label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password" title="Must match password." required>
        </div>
        <input id="submit-btn" type="submit" class="btn btn-block btn-primary">
        <input id="id" type="hidden" name="id" value="${sessionScope.user.id}">
    </form>
</div>


<jsp:include page="/WEB-INF/partials/footer.jsp" />
<script>
    window.onload = function() {


        var name = sessionStorage.getItem("username");
        var email = sessionStorage.getItem("email");
        var password = sessionStorage.getItem("password");
        if (name !== null) {
            $('#name').val(name);
            $('#email').val(email);
            $('#password').val(password);
        }
    };

    window.onbeforeunload = function() {
        sessionStorage.setItem("name", $('#name').val());
        sessionStorage.setItem("email", $('#email').val());
        sessionStorage.setItem("password", $('#password').val());
    };


    var password = document.getElementById("password")
        , confirm_password = document.getElementById("confirm_password");

    function validatePassword(){
        if(password.value != confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Don't Match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;

</script>
</body>
</html>