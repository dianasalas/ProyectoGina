
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pClases.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
             <center>
        <b>Mostrar Productos</b>
       
        <% ArrayList <Productos> lista = new ArrayList();%>
        
        
        <%
        String consulta="select * from productos;";
        objConn.Consultar(consulta);
        %>
        
        <%
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
                        lista.add(new Productos(Integer.parseInt(idProducto),nombre, categorias, categoriar, descripcion, Integer.parseInt(existencia), Double.parseDouble(precio), bi ));
                        objConn.rs.next();
                    }catch(Exception e){ }
                
                
            }
         }
         
        
        objConn.closeRsStmt();
        
        %>
        <%=lista.get(1).getNombre()   %>
        <table>
            
            <%
                   
                for (i=0; i<lista.size(); i++){
                    
                   byte[] imagen = lista.get(i).getImagen();
                    b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imagen);
                    
                    %>
                    <tr>
                        <td>
                           <%
                           if( b64.isEmpty() || imagen == null ){
                               
                         %>
                          <img src="./imagenes/noDisponible.jpg " alt="Imagen no disponible " width="100" height="100" />  
                            <%  }else{ %>
                               <img src="data:image/jpg;base64, <%=b64%>" alt="Imagen " width="100" height="100" />  
                          <% }
                           
                           %>
                           
                            
                        </td>
                        <td>
                            Nombre: <%=lista.get(i).getNombre()%>
                        </td>
                        <td>
                            Categoria por sexo <%=lista.get(i).getCategorias()%>
                        </td>
                        <td>
                            Categoria por ropa <%=lista.get(i).getCategoriar()%>
                        </td>
                        <td>
                            Descripcion: <%=lista.get(i).getDescripcion()%>
                        </td>
                        <td>
                            Existencias: <%=lista.get(i).getExistencia()%>
                        </td>
                        <td>
                            Precio: <%=lista.get(i).getPrecio()%>
                        </td>
                    </tr>
                    <%
                }
            %>
            
        </table>    
        </center>


    </body>
</html>
