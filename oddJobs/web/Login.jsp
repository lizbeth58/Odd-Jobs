<%-- 
    Document   : Login
    Created on : Feb 3, 2017, 10:49:01 PM
    Author     : elizabeth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Log In</title>
        <c:import url="Imports.html"/>
        <link rel="stylesheet" href="Styles/LoginCss.css">
    </head>
    <body>
        <c:import url="Header.jsp"/>
        <div class="jumbotron">
            <div class="container-fluid">
                <h1>Log In</h1>
                <form class="form-horizontal" action="Login" method="post">
                    <input type="hidden" name="action" value="login">
                    <div class="row">
                        <div class="form-group col-md-5">
                            <label class="control-label" for="email">Email:</label>
                            <input type="email" class="form-control" name="email" placeholder="Enter Email">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-5">
                            <label class="control-label" for="pwd">Password</label>
                            <input type="password" class="form-control" name="pwd" placeholder="Enter Password">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-default">Log In</button>
                </form>
                <p>Don't have an account? <a href='/oddJobs/SignUp.jsp'>Sign Up!</a></p>
            </div>
        </div>
        <c:import url="Footer.html"/>
    </body>
</html>
