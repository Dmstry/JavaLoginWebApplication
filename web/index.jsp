<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <%
        String errMsg = null;
        if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null) { 
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
        if ("user".equalsIgnoreCase(userName) && "user".equalsIgnoreCase(password)) {
            out.println("Welcome admin !");
            return;
            } else {
                errMsg = "Invalid user id or password. Please try again";
            }
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
