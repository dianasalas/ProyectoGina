<%-- 
    Document   : 3_contacto
    Created on : Nov 30, 2016, 3:13:18 AM
    Author     : Diana Salas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contacto</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
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
            
            
            
               
            <center>   <h1>Contactanos! 📠 </h1></center><br><br>
                
           
            
            <div class="col-md-2"></div>
            
            <div class="col-md-2">
                <p>Síguenos más de cerca.</p>
                <p><span class="glyphicon glyphicon-map-marker"></span> Aguascalientes, MX</p>
                <p><span class="glyphicon glyphicon-phone"></span> Télefono: +52 1 449 115 9564</p>
                <p><span class="glyphicon glyphicon-envelope"></span> Email: Store.Kleidung@gmail.com</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="https://www.facebook.com/store.kleidung/" target="blank" class="w3-hover-white w3-hover-text-indigo w3-show-inline-block"><i class="fa fa-facebook-official"></i></a>&nbsp;&nbsp;&nbsp;
                <a href="https://www.instagram.com/kleidung_store/" target="blank" class="w3-hover-white w3-hover-text-purple w3-show-inline-block"><i class="fa fa-instagram"></i></a>&nbsp;&nbsp;&nbsp;
                <a href="https://www.twitter.com/kleidung_store" target="blank" class="w3-hover-white w3-hover-text-light-blue w3-show-inline-block"><i class="fa fa-twitter"></i></a>
                
               
            </div>
        <div class="col-md-8">
            <div id="formulario">
            <div class="row">
              
                <form action="mandaCorreo.jsp" method="post" id="formdata">
                    <div class="col-sm-4 form-group">
                      <input class="form-control" id="name" name="usuario" placeholder="Nombre" type="text" required>
                    </div>
                    <div class="col-sm-4 form-group">
                      <input class="form-control" id="email" name="correo" placeholder="Email" type="email" required>
                    </div>

                  </div>
                    <div class="row">
                        <div class="col-md-8">
                            <p><textarea class="form-control" id="comments" name="mensaje" placeholder="Comentario" rows="5" required></textarea><p>

                        </div>
                    </div>

                  <br>
                  <div class="row">
                    <div class="col-md-8 form-group">
                        <p><button class="btn pull-right" type="submit" id="botonenviar">Enviar</button></p>
                    </div>
                  </div>
                </form>
                <%
                    if(request.getParameter("mensaje")!=null){
                        %>
                        <%=request.getParameter("mensaje")%>
                        <%
                    }
                %>
        </div>
              
  </div>
           
    </body>
</html>
