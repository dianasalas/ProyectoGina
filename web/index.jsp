<%-- 
    Document   : 1_inicio
    Created on : Nov 30, 2016, 3:03:22 AM
    Author     : Diana Salas
--%>

<%@page import="mysql.MySqlConexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="pClases.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>KLEIDUNG</title>
        <link rel="icon" type="image/png" href="images/logo2.png" />
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" type="text/css"/>

        <link rel="stylesheet" href="estilos/mine.css" type="text/css">

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>

    </head>

    <body>
        <% //ArrayList carrito = new ArrayList<Productos>(3);
            //ArrayList carrito = new ArrayList(3);
            Map<Integer, Integer> treeMap;
            //TreeMap carro = (TreeMap)(sesion.getAttribute("carrito"));
            if (request.getSession().getAttribute("carrito") == null) {
                treeMap = new TreeMap<>();
                session.setAttribute("carrito", treeMap);
            } else {
                treeMap = (TreeMap) (session.getAttribute("carrito"));
            }
        %>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="jumbotron">
                <img src="images/logo.png" alt="KLEIDUNG" title="KLEIDUNG" style="height: 100%; margin-top: 0px;">
            </div>
            <div class="container-fluid">

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#"><img src="images/logo1.png" height="25"></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">

                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="2_nosotros.jsp" target="holi">Nosotros </a></li>
                        <li><a href="3_contacto.jsp" target="holi">Contacto</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Mujer <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="plantillabusqueda.jsp?cat=vestido" target="holi">Vestidos</a></li>
                                <li><a href="plantillabusqueda.jsp?cat=jeans" target="holi">Pantalones</a></li>
                                <li><a href="plantillabusqueda.jsp?cat=blusa" target="holi">Blusas</a></li>
                                <li><a href="plantillabusqueda.jsp?cat=mujer" target="holi">Ver todo</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Hombre <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="plantillabusqueda.jsp?cat=camisa" target="holi">Camisas</a></li>
                                <li><a href="plantillabusqueda.jsp?cat=pantalon" target="holi">Pantalones</a></li>
                                <li><a href="plantillabusqueda.jsp?cat=playera" target="holi">Playeras</a></li>
                                <li><a href="plantillabusqueda.jsp?cat=hombre" target="holi">Ver todo</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <% if (request.getSession().getAttribute("usuario") != null) {
                                String nombre = (String) request.getSession().getAttribute("usuario");
                        %>

                        <li> <a href=# target="holi" onfocus="location.reload()"><span class="glyphicon glyphicon-user"></span> <%=nombre%></a></li>
                            <%
                                }
                            %>
                        <li><a href="7_preguntasfrecuentes.jsp" target="holi"><span class="glyphicon glyphicon-comment"></span> Preguntas Frecuentes</a></li>

                        <% if (request.getSession().getAttribute("usuario") == null) {
                        %>
                        <li> <a href="6_login.jsp" target="holi"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                            <%
                            } else {
                            %>
                        <li> <a href="8_cerrarSesion.jsp" target="holi" onclick="location.reload()"><span class="glyphicon glyphicon-log-out"></span> Cerrar sesión</a></li>

                        <%
                            }
                        %>
                        <li>
                            <a href="#"><span class="glyphicon glyphicon-shopping-cart" data-toggle="modal" data-target="#myModal"></span> <span class="badge" id="carro">0</span></a></li>

                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog" id="modalMargen">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3 class="modal-title"><span class="glyphicon glyphicon-shopping-cart" data-toggle="modal" data-target="#myModal"></span> Carrito de Compras</h3>
                        </div>
                        <div class="modal-body">

                            <p>Productos</p>
                            <!-- aqui pones los articulos dianis lol   <3 -->
                            
                            <%
                                Iterator it = treeMap.keySet().iterator();
                                while (it.hasNext()) {
                                    Integer key = (int)(it.next());
                                    String consulta = "select * from productos where idProducto=" + key + ";";
                                    MySqlConexion objConn = new MySqlConexion();
                                    objConn.Consultar(consulta);
                                    if(objConn.rs.getRow() != 0){
                                    %>
                                    <span id="<%=key + "id"%>">
                                    <%=objConn.rs.getString(2)%>----<%=treeMap.get(key)%>----<%=objConn.rs.getDouble(7)*treeMap.get(key)%>
                                    <input type="number" min="0" max="<%=objConn.rs.getInt(6)%>" value="<%=treeMap.get(key)%>">
                                    &nbsp;<button onclick="eliminarDelCarrito(<%=key%>)">Eliminar del carrito</button><br> </span>
                                        <%--<%="Clave: " + key + " -> Valor: " + treeMap.get(key)%>--%>
                                    <%
                                    }
                                }
                            %>
                            
                            <% if (request.getSession().getAttribute("usuario") == null) { %>
                            <p><button disabled="true" type="button" class="btn active" value="Comprar" onclick ="parent.holi.location = '6_login.jsp'" target="holi">Comprar</button></p>
                            <%
                            } else {
                            %><p><button unabled="true" type="button" class="btn active" value="Comprar" onclick ="parent.holi.location = 'pedidos.jsp'" target="holi">Comprar</button></p>
                            <%
                              }%>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>   
            <iframe src="bienvenido.html" marginwidth="0" marginheight="0" name="holi" border="0" frameborder="0" width="100%" height="900">Tu Navegador no soporta esta característica</iframe>

        </div>
        <footer class="container-fluid text-center">
            <p> México <span class="glyphicon glyphicon-copyright-mark"></span> 2016 KLEIDUNG, Inc. Todos los derechos reservados, ISC 5ºA</p>
        </footer>
        <script>
            var ajax;
            var carro;

            function funcionCallback() {
                if (ajax.readyState === 4) {
                    console.log("YEIII");
                    if (ajax.status === 200) {
                        console.log(ajax.responseText);
                        if(ajax.responseText.equals === "delete" ){
                            document.getElementById(carro + "id").innerHTML = "";
                        }
                    }
                }
            }

            function eliminarDelCarrito(carro) {
                if (window.XMLHttpRequest)
                    ajax = new XMLHttpRequest();
                else
                    ajax = new ActiveXObject("Microsoft.XMLHTTP");

                ajax.onreadystatechange = funcionCallback;
                ajax.open("GET", "agregarCarrito.jsp?id=" + carro + "&cantidad=0");
                ajax.send(null);
            }
        </script>
    </body>
</html>
