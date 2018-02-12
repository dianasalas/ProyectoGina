<%-- 
    Document   : accionRegistro
    Created on : 1/12/2016, 12:52:38 AM
    Author     : Luis Quezada
--%>

<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta</title>
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
        <jsp:useBean id="UserBean" class="pClases.UserBean"/>
        <jsp:setProperty name="UserBean" property="*"/>
        <jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
        
        
        <div class="container-fluid" style="margin-top:17%; margin-bottom:0px"> 
           
            
        <%
            //xxedsxsexsedsxexesxEncriptado cryp = new Encriptado();
            String nombre = UserBean.getNombre();
            String apellido = UserBean.getApellido();
            String email = UserBean.getEmail();
            //byte[] contra = cryp.Encriptar(UserBean.getContra());
            String contraCryp = DigestUtils.md5Hex(UserBean.getContra());
            String pregunta = UserBean.getPregunta();
            String respuesta = UserBean.getRespuesta();

            String consulta = "insert into cuentas (nombre,apellido,email,contra,pregunta,respuesta,intentos) "
                    + "values ('" + nombre + "','"+ apellido +"','" + email + "','" + contraCryp + "','" + pregunta + "','" + respuesta +
                    "',0);";
            int exito = objConn.Actualizar(consulta);
            objConn.closeRsStmt();
            if(exito == 1062){
                %>
                    <center>   
                        <h1>Correo ya registrado, intente con otro :(</h1><br><br>
                        <h3><a href="6_login.jsp" target="holi">Reintente</a></h3>
                     </center>
                <%
            } else{
                %>
                    <center>
                        <h1>¡Registro exitoso!</h1>
                        <h3><a href="6_login.jsp" target="holi">Ingrese ahora</a></h3>
                    </center>
                <%
            }
            %>
        </div>
    </body>
</html>
