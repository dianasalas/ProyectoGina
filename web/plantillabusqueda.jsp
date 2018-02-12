
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%-- 
    Document   : exmostrar
    Created on : 1/12/2016, 01:29:58 AM
    Author     : Diana Resendiz
--%>
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

<%@page session="true" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
        
        <link rel="stylesheet" href="estilos/mine.css" type="text/css">
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        
        
        <%
                    HttpSession sesion = request.getSession();
                    Map <Integer, Integer> carro = (TreeMap)(sesion.getAttribute("carrito"));
        %>
        <script>
            var ajax;

            function funcionCallback() {
                if (ajax.readyState === 4) {
                    console.log("YEIII");
                    if (ajax.status === 200) {
                        console.log(ajax.responseText);
                        application.getElementById("carro").innerHTML = ajax.responseText;
                    }
                }
            }

            function agregarCarrito(carro) {
                if (window.XMLHttpRequest)
                    ajax = new XMLHttpRequest();
                else
                    ajax = new ActiveXObject("Microsoft.XMLHTTP");

                ajax.onreadystatechange = funcionCallback;
                ajax.open("GET", "agregarCarrito.jsp?id=" + carro + "&cantidad=1");
                ajax.send(null);
            }
        </script>
    </head>
    <body>
        <div id="contenido" class="container-fluid" style="margin-top:17%; margin-bottom:0px">
        <%! 
            int x=0;
        %>
        <%!
        /*public void agregar(HttpSession sesion){        
            ArrayList carro = (ArrayList)(sesion.getAttribute("carrito"));
            x=carro.size();
            carro.add(9);
            sesion.setAttribute("carrito", carro);
        }*/
        %>
        <center>
            <h1>Mostrar productos</h1><br>
       
        <% ArrayList <Productos> lista = new ArrayList();%>
        
        <%
          //Puede llegar cats (categoria sexo) o catp (Categoria producto)
          String cate, consulta;
         cate = (request.getParameter("cat")).trim();
         
         if(cate.contains("mujer")||cate.contains("hombre")){
               consulta = "select * from tienda.productos where categoriaSexo='"+cate+"';";
         }else{
               consulta = "select * from tienda.productos where categoriaRopa='"+cate+"';";
         }
         
         
         
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
            String idProducto, nombre, categorias, descripcion, existencia, precio, categoriar;
            for(i=0;i<n;i++){
                
                    try{
                        idProducto=objConn.rs.getString(1);
                        //out.println(idUsuario+ "<br>");
                        nombre=objConn.rs.getString(2);
                        //out.println(nombre+ "<br>");
                        categorias =objConn.rs.getString(3);
                        categoriar =objConn.rs.getString(4);
                        //out.println(correo+ "<br>");
                        descripcion =objConn.rs.getString(5);
                        //out.println(cuenta+ "<br>");
                        existencia =objConn.rs.getString(6);
                        //out.println(password+ "<br>");
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
        
        <table style="padding: 4px; font-family: "Unica One";>
            <% 
                int cont=0;
                for (i=0; i<lista.size(); i++){
                    if (cont ==4 || cont==8 || cont==16 || cont == 20 || cont==24 ||cont == 28){%>
                    <tr>
                   <% }
                   byte[] imagen = lista.get(i).getImagen();
                    b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imagen);
                    %>
                     
                        <td>
                           <%
                           if( b64.isEmpty() ){
                               
                         %>
                         <p>
                          <img src="./imagenes/noDisponible.jpg " alt="Imagen no disponible " width="100" height="100" />  
                            <%  }else{ %>
                         <p><a href="plantillaproducto.jsp?id=<%=lista.get(i).getIdProducto()%>">
                            <img src="data:image/jpg;base64, <%=b64%>" alt="Imagen " width="100" height="100" /><br>  
                                Nombre: <%=lista.get(i).getNombre()%><br>
                            Precio: <%=lista.get(i).getPrecio()%><br>
                            Descripcion: <%=lista.get(i).getDescripcion()%><br>
                            Id: <%= lista.get(i).getIdProducto()%><br> 
                            </a></p>
                            <%
                                if(sesion.getAttribute("usuario") == null){
                                    %>
                                    <a href="6_login.jsp" target="holi"><button>Comprar</button></a><br><br>
                                    <%
                                } else{
                                %>
                                <input type="submit" class="btn active" onclick="agregarCarrito(<%=lista.get(i).getIdProducto()%>)" value="Agregar al carrito"><br><br>
                            <!--<input type="submit" value="::::Agregar al carrito">-->
                            
                          <% }      
                           %>
                           
                        </td>
                        <% cont++;%>
                    <%
                }
            }
            
            %>
            </tr>
        </table>    
        </center>

        </div>

    </body>
</html>