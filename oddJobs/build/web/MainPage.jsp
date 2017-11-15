<%-- 
    Document   : MainPage
    Created on : Feb 3, 2017, 10:27:44 PM
    Author     : elizabeth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Odd Jobs</title>
        <c:import url="Imports.html"/>
        <link rel="stylesheet" href="Styles/custom.css">
    </head>
    
    <body>
        <c:import url="Header.jsp"/>
        
        <div class="jumbotron text-center">
            <h1>Odd Jobs</h1>
            <p>Post Jobs Or Find Work !</p>
            <form class="form-inline" action="Search" method="post">
                <input type="hidden" name="action" value="search">
                <div class="input-group">
                    <input type="text" class="form-control" name ="search" size="50" placeholder="Search">
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-danger">Search</button>
                    </div>
                </div>
            </form>
        </div>
        
        <c:import url="Footer.html"/>
    </body>
</html>

