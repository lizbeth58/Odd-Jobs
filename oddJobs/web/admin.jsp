<%-- 
    Document   : admin
    Created on : Feb 22, 2017, 6:47:10 PM
    Author     : elizabeth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="Imports.html"/>
        <title>Admin</title>
    </head>
    
    <body>
         <c:import url="Header.jsp"/>
         <div class="jumbotron">
             <table class="table">
                 <tr>
                     <th>first name</th>
                     <th>last name</th>
                     <th>email</th>
                     <th>role</th>
                 </tr>
                 <c:forEach var="user" items="${requestScope.users}">
                     <tr>
                         <td>${user.firstName}</td>
                         <td>${user.lastName}</td>
                         <td>${user.email}</td>
                         <td>${user.role}</td>
                     </tr>
                 </c:forEach>
             </table>
             
         </div>
         
         <c:import url="Footer.html"/>
    </body>
</html>
