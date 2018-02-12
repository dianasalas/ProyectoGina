<%-- 
    Document   : mandaCorreo
    Created on : 15/12/2016, 07:26:52 AM
    Author     : luis
--%>

<%@page import="pClases.Correo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String usuario = request.getParameter("usuario");
            String correo = request.getParameter("correo");
            String mensaje = request.getParameter("mensaje");
            mensaje+= "\n\n" + usuario + "\n" + correo;
            Correo cuack = new Correo("store.kleidung@gmail.com", "Comentarios de " + usuario, mensaje);
            cuack.Enviar();
        %>
        <jsp:forward page="3_contacto.jsp">
            <jsp:param name="mensaje" value="Sus comentarios han sido mandados"/>
        </jsp:forward>
    </body>
</html>
