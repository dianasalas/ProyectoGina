<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pClases.Productos"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%Productos pro= new Productos();  %>
        
          <%
         String art;
         art = (request.getParameter("articulo")).trim();
              
        String consulta="select * from productos where nombre='"+art+"';";
         objConn.Consultar(consulta);
        int n=0;
        int i,j;
          byte [] bi;
          String b64 = "";
        if(objConn.rs!=null){
            try{
                objConn.rs.last();
                n=objConn.rs.getRow();
                objConn.rs.first();
            }catch(Exception e){}
            //String[][] datos=new String[n][4];
            //datos=new String[n][4];
            String idProducto, nombre, categorias, categoriar, descripcion, existencia, precio, imagen;
            for(i=0;i<n;i++){
                
                    try{
                        idProducto=objConn.rs.getString(1);
                        //out.println(idUsuario+ "<br>");
                        nombre=objConn.rs.getString(2);
                        //out.println(nombre+ "<br>");
                        categorias =objConn.rs.getString(3);
                        //out.println(correo+ "<br>");
                        categoriar =objConn.rs.getString(4);
                        //out.println(cuenta+ "<br>");
                        descripcion =objConn.rs.getString(5);
                        //out.println(password+ "<br>");
                       existencia =objConn.rs.getString(6);
                        precio =objConn.rs.getString(7);
                        //out.println(seguridad+ "<br>");
                       // imagen =objConn.rs.getString(7);
                        bi = objConn.rs.getBytes(8);
                        pro = new Productos(Integer.parseInt(idProducto),nombre, categorias, categoriar, descripcion, Integer.parseInt(existencia), Double.parseDouble(precio), bi );
                        objConn.rs.next();
                    }catch(Exception e){ }
                
                
            }
         }
         
        
        objConn.closeRsStmt();
        
        %>
         
           <form action="update.jsp" method="post">
            <pre>
               <input type="hidden" name="id" value="<%= pro.getIdProducto() %>">  

            Nombre: <input type="text" name="nombre"  value="<%= pro.getNombre() %>"/>

            Categoria por sexo: <input type="text" name="categorias" value="<%= pro.getCategorias() %>"/>

            Categoria por ropa: <input type="text" name="categoriar" value="<%= pro.getCategoriar() %>"/>

            Descripcion: <input type="text" name="descripcion" value="<%= pro.getDescripcion() %>"/>

            Existencia:<input type="text" name="existencia" value="<%= pro.getExistencia()   %>"/>

            Precio:<input type="text"  name="precio"  value="<%= pro.getPrecio() %>"/>



            <input type="submit" value="enviar" />


            </pre>
        </form>
       
         
    </body>
</html>
