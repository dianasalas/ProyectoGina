
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
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
         <script type="text/javascript" src="jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="jquery.mlens-1.6.min.js"></script>
        
          <script type="text/javascript">
    $(document).ready(function(){
        $("#botella").mlens({
         imgSrc: $("#botella").attr("data-big"),   // path of the hi-res version of the image
         lensShape: "square",                // shape of the lens (circle/square)
         lensSize: ["50%","50%"],            // lens dimensions (in px or in % with respect to image dimensions)
		                                    // can be different for X and Y dimension
         borderSize: 4,                  // size of the lens border (in px)
       	 borderColor: "#fff",            // color of the lens border (#hex)
         borderRadius: 0,                // border radius (optional, only if the shape is square)
         imgOverlay: $("#botella").attr("data-overlay"), // path of the overlay image (optional)
         overlayAdapt: true // true if the overlay image has to adapt to the lens size (true/false)
        });
    });
</script>
        
    </head>
    <body>
        <center>
        <b>Escoje la categoria</b>
        
        
       
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
         
        <form action="exmostrar.jsp" method="post">

          Categorias: <select name="categoria">
                <%
               ArrayList <String> aux = new ArrayList();
               String current = lista.get(0).getCategoriar();
               boolean found = false;

               for ( i = 0; i < lista.size(); i++) {
                    //if (current == lista.get(i).getCategoria() && !found) {
                   if (lista.get(i).getCategoriar().equalsIgnoreCase(current) && !found) {
                        found = true;
                       
                    } else if (current != lista.get(i).getCategoriar()) {
                       aux.add(lista.get(i).getCategoriar());
                        current = lista.get(i).getCategoriar();
                        found = false;
                    }
                }
                
        
               for(i=0;i<aux.size();i++){
                      out.println("<option value=\""+aux.get(i).toString()+"\">"+aux.get(i).toString()+"");
                   }

                %>
                </select><br>
            <input type="submit" value="enviar"><br>
        </form>
        </center>



    </body>
</html>
