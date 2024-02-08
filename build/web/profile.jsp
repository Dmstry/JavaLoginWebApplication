<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="ua.edu.znu.lab.bean.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <jsp:useBean id="loginBean" class="ua.edu.znu.lab.bean.LoginBean">
        <jsp:setProperty name="loginBean" property="*" />
    </jsp:useBean>
    <body>
        <h1>Welcome <c:out value="${sessionScope.userName}" />!</h1>
        <p>You are successfully logged in</p>
        <h3>Hello I'm a profile page!!!</h3>
    </body>
</html>
