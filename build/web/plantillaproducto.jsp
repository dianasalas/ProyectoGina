<%-- 
    Document   : plantillaproducto
    Created on : 15/12/2016, 12:27:01 AM
    Author     : Jose
--%>

<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>

<%@page session="true" %>
<!DOCTYPE html>
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

        <script type="text/javascript" src="jquery/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="jquery/jquery.mlens-1.6.min.js"></script>
        <style>
            #contenido {
                position: relative;
                width: 350px;
                height: 350px;
                margin: 20px auto;
                border: 12px solid #fff;
                border-radius: 10px;
                box-shadow: 1px 1px 5px rgba(50,50,50 0.5);
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#imagen").mlens({
                    imgSrc: $("#botella").attr("data-big"), // path of the hi-res version of the image
                    lensShape: "square", // shape of the lens (circle/square)
                    lensSize: ["40%", "40%"], // lens dimensions (in px or in % with respect to image dimensions)
                    // can be different for X and Y dimension
                    borderSize: 4, // size of the lens border (in px)
                    borderColor: "#fff", // color of the lens border (#hex)
                    borderRadius: 0, // border radius (optional, only if the shape is square)
                    imgOverlay: $("#botella").attr("data-overlay"), // path of the overlay image (optional)
                    overlayAdapt: true // true if the overlay image has to adapt to the lens size (true/false)
                });
            });
        </script>
        <script>
            var ajax;

            function funcionCallback() {
                if (ajax.readyState === 4) {
                    console.log("YEIII");
                    if (ajax.status === 200) {
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
                var cantidad = document.getElementById("cantidad").value;
                ajax.open("GET", "agregarCarrito.jsp?id=" + carro + "&cantidad=" + Math.floor(cantidad));
                ajax.send(null);
            }
        </script>

    </head>
    <body>
            <%
                HttpSession sesion = request.getSession();
                Map<Integer, Integer> carro = (TreeMap) (sesion.getAttribute("carrito"));
            %>
            <div id="contenido" class="container-fluid" style="margin-top:17%; margin-bottom:0px"> 
                <center>
                <%String consulta;
                    int id = Integer.parseInt(request.getParameter("id"));
                    consulta = "select * from productos where idProducto=" + id + ";";
                    objConn.Consultar(consulta);
                    if (objConn.rs.getRow() != 0) {
                        byte[] imagen = objConn.rs.getBytes(8);
                        byte[] imageng = objConn.rs.getBytes(9);
                        String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imagen);
                        String b65 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageng);
                %>
                
                <img id="imagen" src="data:image/jpg;base64, <%=b64%>" alt="botella con zoom" data-big="data:image/jpg;base64, <%=b65%>" data-overlay=""  />
                <p>Nombre: <%=objConn.rs.getString(2)%><br>
                Descripcion: <%=objConn.rs.getString(5)%><br>
                Precio: <%=objConn.rs.getString(7)%><br>
                Cantidad <input type="number" id="cantidad" min="1" step="1" value="1" max="<%=objConn.rs.getInt(6) %>"></p>
                <%
                    if (sesion.getAttribute("usuario") == null) {
                %>
                <a href="6_login.jsp" target="holi"><button class="btn btn-default">Comprar</button></a>
                <%
                } else {
                %>
                <button onclick="agregarCarrito(<%=id%>)" class="btn btn-default">Agregar al carrito</button>
                <%
                    }
                }
                %>
                </center>
            </div>
        
    </body>
</html>
