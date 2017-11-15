<%-- 
    Document   : Header
    Created on : Feb 3, 2017, 10:31:16 PM
    Author     : elizabeth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <nav class="nav navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/oddJobs">OddJobs</a> 
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                        <c:when test="${sessionScope.user == null}"><li><a href="/oddJobs/SignUp.jsp">Sign up!</a></li> <li><a href="/oddJobs/Login.jsp"><span class="glyphicon glyphicon-log-in"></span> Log In </a></li></c:when>                         
                        <c:otherwise><li><a href="Login?action=profile"><span class="glyphicon glyphicon-user"></span> ${sessionScope.user.email} </a></li> <li><a href="Login?action=Logout"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>  </c:otherwise> 
                    </c:choose>
                </ul>
            </div>
        </nav>
