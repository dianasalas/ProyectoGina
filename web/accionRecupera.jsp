<%-- 
    Document   : accionRecupera
    Created on : 1/12/2016, 03:31:38 AM
    Author     : Luis Quezada
--%>

<%@page import="pClases.Correo"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="pClases.GenPass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperacion</title>
        
        
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <link rel="stylesheet" href="estilos/mine.css" type="text/css">
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        
        
    </head>
    <body>
        <div class="container-fluid" style="margin-top:17%; margin-bottom:0px"> 
            <center>
            <h1>Recuperación </h1><br><br></center>
                <jsp:useBean id="objConn" class="mysql.MySqlConexion"/>

                <%
                    String correo = request.getParameter("correo");
                    String pregunta = request.getParameter("pregunta");
                    String respuesta = request.getParameter("respuesta");
                    String contra = new GenPass().getPass();
                    String contraCryp = DigestUtils.md5Hex(contra);
                    String consulta = "select * from cuentas where email='" + correo + "' && pregunta='" + pregunta
                            + "' && respuesta='" + respuesta + "';";
                    objConn.Consultar(consulta);
                    if (objConn.rs.getRow() != 0) {
                        consulta = "update cuentas set contra='" + contraCryp + "', intentos=0 "
                                + "where email='" + correo + "' && pregunta='" + pregunta
                                + "' && respuesta='" + respuesta + "';";
                        objConn.Actualizar(consulta);
                        objConn.closeRsStmt();
                        String mensaje = "Estimado usuario: \n\n Ha pedido la restauración de su contraseña."
                                + "\nSu nueva contraseña es: " + contra + "\n\n Que tenga un buen día.\n\nKleidung Store";
                        Correo nuevo = new Correo(correo, "Recuperación de contraseña", mensaje);
                        nuevo.Enviar();
                %>
                <center>
                    <h3>Contraseña recuperada</h3>
                    <a href="6_login.jsp" target="holi">Ingrese ahora</a></p>
                    
                </center>
                <%  } else {
                %>
                <center>
                <p>Usuario no encontrado o respuesta a la pregunta secreta incorrecta, pruebe otra vez</p>
                <a href="recuperarContra.jsp" target="holi">Volver</a></p>
                </center>
                <%
                    }
                    objConn.closeRsStmt();
                %>
        </div>
    </body>
</html>
