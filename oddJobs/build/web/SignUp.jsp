<%-- 
    Document   : SignUp
    Created on : Feb 3, 2017, 10:41:32 PM
    Author     : elizabeth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
        <c:import url="Imports.html"/>
        <link rel="stylesheet" href="Styles/customSignUp.css">
    </head>
    
    <body>
        <c:import url="Header.jsp"/>
        <div class="jumbotron">
            <h1>Sign Up</h1>
            <div class="container-fluid">
                <form  action="signup" method="post">
                    <input type="hidden" name="action" value="signup">
                    
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label for="firstName">First Name:</label>
                            <input type="text" class="form-control" name="firstName">
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label for="lastName">Last Name:</label>
                            <input type="text" class="form-control" name="lastName">
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label for="email">Email Address:</label>
                            <input type="email" class="form-control" name="email">
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label for="pwd">Password:</label>
                            <input type="password" class="form-control" name="pwd">
                        </div>
                    </div>
                        <button type="submit" class="btn btn-default">Sign Up!</button>
                </form>
            </div>
        </div>
        <c:import url="Footer.html"/>
    </body>
</html>