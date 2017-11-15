<%-- 
    Document   : thanks
    Created on : Jan 29, 2017, 11:39:01 PM
    Author     : elizabeth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <c:import url="Imports.html"/>
        <title>Sign Up</title>
    </head>
    
    <body>
        <c:import url="Header.jsp"/>
        <div class="jumbotron">
            <h1>Thank You For Signing Up !</h1>
            <h2>Hello ${requestScope.user.firstName} !</h2>
            <p>An email will be sent to ${requestScope.user.email} for confirmation</p>
            <p>If your confirmation email hasn't arrived <a href="#">Click Here</a> to resend</p>
        </div>
        <c:import url="Footer.html"/>
    </body>
</html>
