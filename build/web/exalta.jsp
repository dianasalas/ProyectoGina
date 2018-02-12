<%-- 
    Document   : exalta
    Created on : 30/11/2016, 09:42:58 PM
    Author     : Jose
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mysql.MySqlConexion"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
        String nombre, categorias, categoriar, descripcion,imagenc, imageng, existencia, precio;
        byte[] imagenicoc = null;
         byte[] imagenicog = null;
        
         nombre = (String) request.getParameter("nombre");
         categorias = (String) request.getParameter("categorias");
         categoriar = (String) request.getParameter("categoriar");
         descripcion = (String) request.getParameter("descripcion");
         existencia = (String) request.getParameter("existencia");
         precio = (String) request.getParameter("precio");
         imagenc = (String) request.getParameter("imagenc");
         imageng = (String) request.getParameter("imageng");
         
         if(!imagenc.isEmpty()){
             String path = "C:\\Users\\Jose\\Desktop\\";
            path += imagenc;
            File ruta = new File(path);
            try {
                imagenicoc = new byte[(int) ruta.length()];
                InputStream input = new FileInputStream(ruta);
                input.read(imagenicoc);
 
            } catch (Exception ex) {
            }
         }else{
             imagenc = "";
         }
         if(!imageng.isEmpty()){
             String path = "C:\\Users\\Jose\\Desktop\\";
            path += imageng;
            File ruta = new File(path);
            try {
                imagenicog = new byte[(int) ruta.length()];
                InputStream input = new FileInputStream(ruta);
                input.read(imagenicog);
 
            } catch (Exception ex) {
            }
         }else{
             imageng = "";
         }
          
            MySqlConexion conec = new MySqlConexion();
            String sql = "INSERT INTO productos (idProducto,nombre,categoriaSexo,categoriaRopa,descripcion,existencia,precio,imagench, imageng)\n"
                    + "VALUES (NULL,?,?,?,?,?,?,?,?);";
            PreparedStatement ps = null;
            try {
                ps = conec.getConn().prepareStatement(sql);
                ps.setString(1, nombre);
                ps.setString(2, categorias);
                ps.setString(3, categoriar);
                ps.setString(4, descripcion);
                ps.setInt(5, Integer.parseInt(existencia));
                ps.setDouble(6, Double.parseDouble(precio));
                ps.setBytes(7, imagenicoc);
                ps.setBytes(8, imagenicog);
                ps.executeUpdate();
            } catch (SQLException ex) {
                System.out.println("A " + ex.getMessage());
            } catch (Exception ex) {
                System.out.println("B " + ex.getMessage());
            } finally {
                try {
                    ps.close();                    
                } catch (Exception ex) {
                }
            }
         
       
       
       %>
        <jsp:forward page="Alta.jsp"/>
    </body>
</html>
