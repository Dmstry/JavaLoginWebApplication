<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <%String errMsg = null; %>
    <%if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null) { %>
    <jsp:useBean id="loginBean" class="ua.edu.znu.lab.bean.LoginBean">
        <jsp:setProperty name="loginBean" property="*"/>
    </jsp:useBean>
    <%
        if (loginBean.isValidUser()) {
            out.println("<h2>Welcome admin !</h2>");
            out.println("You are successfully logged in");
            return;
        } else {
            errMsg = "Invalid user id or password. Please try again";
        }
    %>
    <%
    }
    %>
    <body>
        <h2>Login:</h2>
        <%if (errMsg != null) { %>
        <span style="color: red;"><%out.print(errMsg); %></span>
        <%} %>
        <form method="post">
            User Name: <input type="text" name="userName"><br>
            Password: <input type="password" name="password"><br>
            <button type="submit" name="submit">Submit</button>
            <button type="reset">Reset</button>
        </form>
    </body>
</html>
