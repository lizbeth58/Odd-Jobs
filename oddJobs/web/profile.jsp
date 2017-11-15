<%-- 
    Document   : profile
    Created on : Feb 24, 2017, 2:55:16 PM
    Author     : elizabeth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="Imports.html"/>
        <title>${sessionScope.user.firstName} ${sessionScope.user.lastName}</title>
    </head>
    <body>
        <c:import url="Header.jsp"/>
        <div class="jumbotron">
            <h1>Profile</h1>
            <div class="container-fluid">
                <form  action="update" method="post">
                    <input type="hidden" name="action" value="update" >
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label for="firstName">First Name:</label>
                            <input type="text" class="form-control" name="firstName" value="${sessionScope.user.firstName}">
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label for="lastName">Last Name:</label>
                            <input type="text" class="form-control" name="lastName" value="${sessionScope.user.lastName}">
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label for="email">Email Address:</label>
                            <input type="email" class="form-control" name="email" value="${sessionScope.user.email}">
                        </div>
                    </div>
                    
                    <div class="row">
                        <a href="#">Change Password</a>
                    </div>
                    <button type="submit" class="btn btn-default">Update</button>
                </form>
                        
                <form action="update" method="post">
                    <input type="hidden" name="action" value="delete">
                    <button style="padding-top: 5px" type="submit" class="btn btn-danger">Delete Account</button>
                </form>
                <h1>POSTS</h1>
                 <table class="table">
                    <c:forEach var="entry" items="${requestScope.entries}">
                        <tr>
                            <div class="panel panel-default">
                                <div class="panel-heading"><h4>${entry.username}, ${entry.location}</h4> <c:if test="${sessionScope.user.email == entry.username}"><a href="Search?action=delete&content=${entry.content}"><button class="btn btn-danger">Delete</button></a></c:if>   </div>
                                <div class="panel-body">${entry.content} <br><br>
                                    contact Info: <br><br>
                                    name:     ${entry.name} <br>
                                    phone:    ${entry.phone} <br>
                                    email:    <c:choose><c:when test="${sessionScope.user != null}"> <a href="Reply?action=reply&to=${entry.username}">${entry.username}</a> <br> </c:when>
                                              <c:otherwise>${entry.username} <br </c:otherwise>
                                              </c:choose> 
                                    location: ${entry.location} 
                                </div>
                            </div>
                        </tr>
                    </c:forEach>
            </div>
        </div>
        <c:import url="Footer.html"/>
    </body>
</html>
