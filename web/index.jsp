<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <c:set var="errMsg" value="${null}"/>
    <c:set var="displayForm" value="${true}"/>
    <c:if test="${\"POST\".equalsIgnoreCase(pageContext.request.method) && pageContext.request.getParameter(\"submit\") != null}">
        <jsp:useBean id="loginBean" class="ua.edu.znu.lab.bean.LoginBean">
            <jsp:setProperty name="loginBean" property="*"/>
        </jsp:useBean>
        <c:choose>
            <c:when test="${!loginBean.isValidUser()}">
                <c:set var="errMsg" value="Invalid user id or password.
                       Please try again"/>
            </c:when>
            <c:otherwise>
                <h2><c:out value="Welcome ${loginBean.userName} !"/></h2>
                <c:out value="You are successfully logged in"/>
                <c:set var="displayForm" value="${false}"/>
            </c:otherwise>
        </c:choose>
    </c:if>
    <c:if test="${displayForm}">
        <body>
            <h2>Login:</h2>
            <c:if test="${errMsg != null}">
                <span style="color: red;">
                    <c:out value="${errMsg}"></c:out>
                    </span>
            </c:if>
            <form method="post">
                User Name: <input type="text" name="userName"><br>
                Password: <input type="password" name="password"><br>
                <button type="submit" name="submit">Submit</button>
                <button type="reset">Reset</button>
            </form>
        </body>
    </c:if>
</html>
