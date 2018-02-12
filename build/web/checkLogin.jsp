<%-- 
    Document   : checkLogin
    Created on : 1/12/2016, 04:42:24 AM
    Author     : Luis Quezada
--%>

<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entrando</title>
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
        <jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
        <%
            String correo = request.getParameter("correo");
            String pass = request.getParameter("passwd");
            String contra = DigestUtils.md5Hex(pass);
            String consulta = "select * from cuentas where email='" + correo + "';";
            String nombre = "";
            String apellido = "";
            
            objConn.Consultar(consulta);
            if(!objConn.rs.wasNull()){
                if(objConn.rs.getRow() == 0){
                    objConn.rs.close();
                    %>
                    <jsp:forward page="6_login.jsp">
                        <jsp:param name="error" value="El usuario y/o contraseña no son válidos. <br>Vuelva a intentarlo."/>
                    </jsp:forward>
                    <%
                } else{
                    int intentos = objConn.rs.getInt(8);
                    nombre = objConn.rs.getString(2);
                    apellido = objConn.rs.getString(3);
                    consulta = "select * from cuentas where email='" + correo +"' && contra='" + contra + "';";
                    objConn.Consultar(consulta);
                    if(objConn.rs.getRow() == 0){
                        intentos++;
                        consulta = "update cuentas set intentos=" + intentos +
                                " where email='" + correo + "'";
                        objConn.Actualizar(consulta);
                        objConn.closeRsStmt();
                        %>
                        <jsp:forward page="6_login.jsp">
                            <jsp:param name="error" value="El usuario y/o contraseña no son válidos. <br>Vuelva a intentarlo."/>
                        </jsp:forward>
                        <%
                    } else{
                        if(intentos > 2){
                            %>
                            <jsp:forward page="6_login.jsp">
                                <jsp:param name="error" value="Cuenta bloqueada.<br>Recupere su contraseña."/>
                            </jsp:forward>
                
                            <%
                        } else{
                            if ((request.getParameter("recordar") != null) && (request.getParameter("recordar").equals("si"))) {
                                //out.println("entra");
                                    Cookie cookieUsuario = new Cookie("cookieUser", correo);
                                    cookieUsuario.setPath("/");
                                    cookieUsuario.setMaxAge(60 * 60 * 24);
                                    response.addCookie(cookieUsuario);
                                    Cookie cookiePass = new Cookie("cookiePass", pass);
                                    cookieUsuario.setPath("/");
                                    cookieUsuario.setMaxAge(60 * 60 * 24);
                                    response.addCookie(cookiePass);
                                }
                                
                                HttpSession sesion = request.getSession();
                                sesion.setAttribute("usuario", nombre);
                                sesion.setAttribute("apellido", apellido); 
                                sesion.setAttribute("cuenta", correo); //user.getCuenta()
                                if(correo.equals("admin@chido.com")){
                                    %>
                                    <div class="container-fluid text-center" style="margin-top:17%; margin-bottom: 50px;">                            
                                    <center>
                                    <h1>Bienvenido Administrador</h1>
                                    <h3><a href="espacioAdmin.jsp" target="blank">Administrar los productos</a></h3>
                                    
                                     
                                    </center>
                                    </div>
                                    <%
                                }else {
                            %>
                            <div class="container-fluid text-center" style="margin-top:17%; margin-bottom: 50px;">                            
                            <center>
                                <h1>Sesion iniciada</h1>
                                <h3><a href="index.jsp" target="_top">Volver a inicio</a></h3>
                            </center>
                            </div>
                            <%   
                            }
                        }
                    }
                }
            }
        %>
    </body>
</html>
