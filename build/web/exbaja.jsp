<%-- 
    Document   : exbaja
    Created on : 1/12/2016, 01:02:46 AM
    Author     : Jose
--%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             
         String nombre;
         nombre = (request.getParameter("articulo")).trim();
         
         
         
         String query = "delete from productos where nombre='"+nombre+"';";
         //out.println("*"+cuenta+"*<br>");
         //out.println("*"+password+"*<br>");
         //out.println("*"+modifica+"*<br>");
         objConn.Actualizar(query);
         objConn.closeRsStmt();
         %>
          
         <jsp:forward page="Bajas.jsp"/>
         
         
         
         
    </body>
</html>
