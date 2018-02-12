<%-- 
    Document   : Bajas
    Created on : 1/12/2016, 12:55:45 AM
    Author     : Jose
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="pClases.Productos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         
    </head>
    <body>
           
        <b>Elminar Producto</b><p>
       
       <% ArrayList <Productos> lista = new ArrayList();%>

        <%
        String consulta="select * from productos;";
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
                        lista.add(new Productos(Integer.parseInt(idProducto),nombre, categorias, categoriar, descripcion, Integer.parseInt(existencia), Double.parseDouble(precio), bi ));
                        objConn.rs.next();
                    }catch(Exception e){ }
            }
         }
        objConn.closeRsStmt();
        %>
        <form action="exbaja.jsp" method="post">
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
                          <% }   %>
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
                           
                         <td> Dar de baja? <input type="radio" name="articulo" value="<%=lista.get(i).getNombre()%>"> 
                        </td>
                    </tr>
                    <%
                }
            
            %>
        </table>    

          
            <input type="submit" value="enviar"><br>
        </form>
       
    </body>
</html>
