<%-- 
    Document   : Search
    Created on : Jan 29, 2017, 2:59:03 AM
    Author     : elizabeth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>${requestScope.search}</title>
        <c:import url="Imports.html"/>
         <link rel="stylesheet" href="Styles/searchCss.css">
    </head>
    <body>
        <c:import url="Header.jsp"/>
        <div class="jumbotron">
            <form class="form-inline" action="Search" method="post">
                <input type="hidden" name="action" value="search">
                <label class="control-label" for="search">Search: </label>
                <input type="text" class="form-control" size="80" name="search" placeholder="Search">
            </form>
            <p>Search Results for "${requestScope.search}"</p>
            <c:choose><c:when test="${sessionScope.user != null}">
                <button data-toggle="collapse" data-target="#post">Create Post</button>
                <div class="collapse" id="post">
                    <form class="form-horizontal" action="Search" method="post">
                        <input type="hidden" name="action" value="entry">
                        <label class="control-label">Location: </label>
                        <input type="text" class="form-control" name="location" required>
                        <label class="control-label">Phone:</label>
                        <input type="text" class="form-control" name="phone" required>
                        <div class="form-group">
                            <label for="text" style="padding-left:15px">Text: </label>
                            <textarea class="form-control" rows="5" id="text" name="content" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-default">Post</button>
                    </form>               
                </div>
                </c:when>
            </c:choose>
            <table class="table">
                <c:forEach var="entry" items="${requestScope.entries}">
                    <tr>
                        <div class="panel panel-default">
                            <div class="panel-heading"><h4>${entry.username}, ${entry.location}</h4> <c:if test="${sessionScope.user.email == entry.username}"><a href="Search?action=delete&content=${entry.content}"><button class="btn btn-danger">Delete</button></a></c:if>   </div>
                            <div class="panel-body">${entry.content} <br><br>
                                contact Info: <br>
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
                
            </table>
        </div>
        <c:import url="Footer.html"/>
    </body>
</html>
