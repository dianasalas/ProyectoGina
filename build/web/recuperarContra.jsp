<%-- 
    Document   : recuperarContra
    Created on : 1/12/2016, 03:22:12 AM
    Author     : Luis Quezada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar Contraseña</title>
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
        
        <div class="container-fluid text-center" style="margin-top:17%; margin-bottom: 50px;">    
           <div class="row content">
             <div class="col-sm-2 sidenav">
             </div>
             <div class="col-sm-8 text-left" > 
                 
                 <h1>Recupera tu contraseña</h1><br><br>
                 
                 
                 
                 
                    <form class="form-horizontal" method="POST" name="recCon" action="accionRecupera.jsp" target="holi">
                      
                      <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Email:</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="email" name="correo" placeholder="Escribe tu email" required="required">
                        </div>
                      </div>
                      
                        
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="pregunta">Pregunta clave:</label>
                            <div class="col-sm-6">
                            <select class="form-control" name="pregunta" id="pregunta">
                              <option value="mascota">¿Cuál fue el nombre de tu primer mascota?</option>
                              <option value="anios">¿Cuántos años tenías cuando se te cayó tu primer diente?</option>
                              <option value="amigo">¿Cuál es el nombre de tu mejor amigo/a?</option>
                              <option value="lugar">¿Cuál es tu lugar favorito para vacacionar?</option>
                            </select>
                            </div>
                        </div>
                        
                     <div class="form-group">
                        <label class="control-label col-sm-3" for="respuesta">Respuesta:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="respuesta" name="respuesta" placeholder="Escribe tu respuesta a pregunta clave" required="required">
                        </div>
                      </div>
                      
                        
                      <div class="form-group">        
                        <div class="col-sm-offset-5 col-sm-4">
                            <button type="submit" class="btn pull-right" name="Enviar">Enviar</button><br><br>
                        </div>
                      </div>
                        
                    </form>
                 
                 <h3><a href="6_login.jsp" target="holi">Regresar</a></h3>
               
             </div>
             <div class="col-sm-2 sidenav">
               <div class="well">
                 <p>Anuncios</p>
               </div>
               <div class="well">
                 <p>Anuncios</p>
               </div>
             </div>
           </div>
         </div>
    </body>
</html>
