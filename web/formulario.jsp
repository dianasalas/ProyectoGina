<%-- 
    Document   : formulario
    Created on : Nov 30, 2016, 8:26:16 AM
    Author     : Diana Salas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
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
        
        
        <script type="text/javascript">
            function miFuncion(){
                if(formulario.contra.value === formulario.contra1.value){
                    if(formulario.email.value === formulario.email2.value){
                        return true;
                    } else{
                        alert("El email no coincide, verifique");
                        return false;
                    }
                } else{
                    alert("La contraseña no coincide, verifique");
                    return false;
                }
            }
        </script>

        
        
        <div class="container-fluid text-center" style="margin-top:17%; margin-bottom: 50px;">    
           <div class="row content">
             <div class="col-sm-2 sidenav">
             </div>
             <div class="col-sm-8 text-left" > 
                 
                 <h1>Crear una cuenta</h1><br><br>
                 
                 
                 
                 
                 <form class="form-horizontal" name="formulario" method="POST" action="accionRegistro.jsp" target="holi">
                      <div class="form-group">
                        <label class="control-label col-sm-3" for="nombre">Nombre:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="nombre" name="nombre"  placeholder="Escribe tu nombre" required="required">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-3" for="apellido">Apellido:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="apellido"  name="apellido"  placeholder="Escribe tu apellido" required="required">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Email:</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Escribe tu email" required="required">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-3" for="email2">Confirme email:</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="email2" name="email2" placeholder="Confirma tu email" required="required">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-3" for="contra">Password:</label>
                        <div class="col-sm-6">          
                            <input type="password" class="form-control" id="contra"  name="contra" placeholder="Escribe tu contraseña" required="required">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-3" for="contra2">Repite password:</label>
                        <div class="col-sm-6">          
                            <input type="password" class="form-control" id="contra2" name="contra2" placeholder="Escribe nuevamente tu contraseña" required="required">
                        </div>
                      </div>
                        
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="pregunta">Selecciona pregunta clave:</label>
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
                          <div class="col-sm-3">
                          <input type="checkbox" class="form-control" id="checa" name="checa" required="required">
                          </div>
                          <label class="control-label col-sm-3" for="checa">Acepto terminos y condiciones</label>
                        
                      </div>
                        
                      <div class="form-group">        
                        <div class="col-sm-offset-5 col-sm-4">
                            <button type="submit" class="btn pull-right" onclick="return miFuncion()">Crear</button><br><br>
                        </div>
                      </div>
                        
                    </form>
               
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
