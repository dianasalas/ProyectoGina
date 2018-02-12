<%-- 
    Document   : update
    Created on : 14/12/2016, 07:18:18 PM
    Author     : Jose
--%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mysql.MySqlConexion"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String id, nombre, categorias, categoriar, descripcion,imagenc, imageng, existencia, precio;
        byte[] imagenicoc = null;
         byte[] imagenicog = null;
        
         id = (String) request.getParameter("id");
         nombre = (String) request.getParameter("nombre");
         categorias = (String) request.getParameter("categorias");
         categoriar = (String) request.getParameter("categoriar");
         descripcion = (String) request.getParameter("descripcion");
         existencia = (String) request.getParameter("existencia");
         precio = (String) request.getParameter("precio");
        
         
          
          
            String sql = "update productos set nombre='"+nombre+"', categoriaSexo='"+categorias+"', categoriaRopa='"+categoriar+"', descripcion='"+descripcion+"', existencia='"+existencia+"', precio='"+precio+"' where idProducto='"+id+"';";
                    
            objConn.Actualizar(sql);
         objConn.closeRsStmt();
         
       
       
       %>
    </body>
</html>
