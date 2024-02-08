<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Login</title>
        <script>
            $(document).ready(function () {
                var isLocked = "<c:out value="${sessionScope.status}"/>" === "disabled";
                if (isLocked) {
                    $('.button__submit').prop('disabled', true);
                    $('#lockMsg').show(); // Показати повідомлення про блокування
                    $('#errMsg').hide(); // Сховати повідомлення про блокування
                    setTimeout(function () {
                        $('.button__submit').prop('disabled', false);
                        $('#lockMsg').hide(); // Сховати повідомлення про блокування
            <% session.removeAttribute("status"); %>
            <% session.removeAttribute("errMsg"); %> // Видалити повідомлення про помилку з сесії
                    }, 30000); // in milliseconds
                }
            });
        </script>
    </head>
    <body>
        <%
            if (session.getAttribute("errorEnter") == null) {
                session.setAttribute("errorEnter", 0);
            }
            Integer errorEnter = (Integer) session.getAttribute("errorEnter");
            String status = (String) session.getAttribute("status");
            if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit_btn") != null) {
                ua.edu.znu.lab.bean.LoginBean loginBean = new ua.edu.znu.lab.bean.LoginBean();
                loginBean.setUserName(request.getParameter("userName"));
                loginBean.setPassword(request.getParameter("password"));
                if (!loginBean.isValidUser()) {
                    errorEnter++;
                    session.setAttribute("errorEnter", errorEnter);
                    if (errorEnter >= 3) {
                        session.setAttribute("status", "disabled");
                        session.setAttribute("errorEnter", 0); // Reset the counter
                        response.setHeader("Refresh", "60"); // Refresh page after 60 seconds
                    }
                    request.setAttribute("errMsg", "Invalid user id or password. Please try again");
                } else {
                    session.setAttribute("errorEnter", 0); // Reset on success
                    session.removeAttribute("status"); // Remove lock on success
                    session.setAttribute("userName", loginBean.getUserName()); // Зберегти ім'я користувача в сесії
                    response.sendRedirect("profile.jsp"); // Redirect on success
                }
            }
        %>
        <h2>Login:</h2>
        <div id="lockMsg" style="color: red; display: none;">You entered the data incorrectly 3 times. Try again in 1 minute.</div>
        <c:if test="${not empty errMsg}">
            <span id="errMsg" style="color: red;">
                <c:out value="${errMsg}"/>
            </span>
        </c:if>
        <form method="post" id="form-submit">
            User Name: <input type="text" name="userName"><br>
            Password: <input type="password" name="password"><br>
            <button class="button__submit" type="submit" name="submit_btn" <%= status != null && status.equals("disabled") ? "disabled" : "" %>>Submit</button>
            <button type="reset">Reset</button>
        </form>
    </body>
</html>
