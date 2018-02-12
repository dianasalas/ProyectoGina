<%-- 
    Document   : 8_cerrarSesion
    Created on : 14/12/2016, 08:14:36 PM
    Author     : luis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page session="true" %>
<%
    HttpSession sesionOK = request.getSession();
    request.getSession(false);
    sesionOK.invalidate();
%>
<jsp:forward page="index.jsp"/>
