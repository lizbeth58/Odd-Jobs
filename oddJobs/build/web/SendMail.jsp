<%-- 
    Document   : SendMail
    Created on : Mar 5, 2017, 7:24:10 PM
    Author     : elizabeth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="Imports.html"/>
        <title>Contact</title>
    </head>
    <body>
        <c:import url="Header.jsp"/>
        <div class="jumbotron">
            <h1>Send Email</h1>
            <c:if test="${requestScope.sent == true}"> <h1>Message Sent!</h1></c:if>
            <form class="form-horizontal" action="Reply" method="post">
                <input type="hidden" name="action" value="send">
                
                <label class="control-label">TO:</label>
                <input type="text" class="form-control" name="to" value="${requestScope.to}" required>
                
                <label class="control-label">FROM:</label>
                <input type="text" class="form-control" name="from" value="${sessionScope.user.email}" required>
                
                <div class="form-group">
                    <label for="text" style="padding-left:15px">Text: </label>
                    <textarea class="form-control" rows="5" id="text" name="content" required></textarea>
                </div>
                <button type="submit" class="btn btn-default">Send!</button>
            </form>       
        </div>
        <c:import url="Footer.html"/>
    </body>
</html>
