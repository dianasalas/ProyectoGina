<%-- 
    Document   : 6_login
    Created on : Nov 30, 2016, 7:24:05 AM
    Author     : Diana Salas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        
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
    <body onload="recaptcha()">
        <script>
            var captcha;
            function validar(){
                if(ingreso.captcha.value !== captcha){
                    alert("Los captcha no coincide, reintente");
                    recaptcha();
                    return false;
                }
                return true;
            }
            
            function recaptcha(){
                var captchas = ["W6 8HP", "just example", "qGphJD", "smwm"];
                captcha = captchas[Math.floor(Math.random()*3)];
                document.getElementById("captcha").src = "images/" + captcha + ".jpg";
            }
        </script>
        <%
            String usuario = "";
            String pass = "";

            Cookie[] todosLosCookies = request.getCookies();
            if (todosLosCookies != null) {
                for (int i = 0; i < todosLosCookies.length; i++) {
                    Cookie unCookie = todosLosCookies[i];
                    if (unCookie.getName().equals("cookieUser")) {
                        usuario = unCookie.getValue();
                    }
                    if (unCookie.getName().equals("cookiePass")) {
                        pass = unCookie.getValue();
                    }
                }//fin for
            }
        %>
         <div class="container-fluid text-center" style="margin-top:17%; margin-bottom: 50px;">    
           <div class="row content">
             <div class="col-sm-2 sidenav">
               <!--<p><a href="#">Link</a></p>
               <p><a href="#">Link</a></p>
               <p><a href="#">Link</a></p>-->
             </div>
             <div class="col-sm-8 text-left" > 
                 
                 <h1>Entra al sitio</h1><br><br>
                 
                
                    <form class="form-horizontal" name="ingreso" method="POST" action="checkLogin.jsp" target="holi">
                        <div class="form-group">
                        <label class="control-label col-sm-3" >.</label>
                        <div class="col-sm-6">
                            <%if(request.getParameter("error")!= null){
                                out.println(request.getParameter("error"));
                                }
                            %>
                        </div>
                      </div> 
                        
                        
                        
                      <div class="form-group">
                        <label class="control-label col-sm-3" for="email">Email:</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="email" name="correo" placeholder="Escribe tu email" value="<%=usuario%>" required="required">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-3" for="pwd">Password:</label>
                        <div class="col-sm-6">          
                            <input type="password" class="form-control" name="passwd" id="pwd" placeholder="Escribe tu contraseña" value="<%=pass%>" required="required">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-3" for="pwd">.</label>
                        <div class="col-sm-6">          
                            <img id="captcha" style="width: 250px; height: 100px">
                        </div>
                      </div>
                        <div class="form-group">
                        <label class="control-label col-sm-3" for="captcha">Captcha:</label>
                        <div class="col-sm-6">          
                            <input type="text" class="form-control" name="captcha" id="captcha" placeholder="Escribe el captcha que corresponde" required="required">
                        </div>
                      </div>
                        
                        
                      <div class="form-group">        
                        <div class="col-sm-offset-3 col-sm-6">
                          <div class="checkbox">
                              <label><input type="checkbox" id="rememberme" name="recordar" value="si"> Recuérdame</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">        
                        <div class="col-sm-offset-5 col-sm-4">
                            <button type="submit" class="btn pull-right"  onclick="return validar()">Entrar</button><br><br>
                        </div>
                      </div>
                        
                    </form>
                 
                 <div class="col-sm-offset-4 col-sm-5"> 
                        
                        <p>Olvide mi contraseña ó mi cuenta esta bloqueada <a href="recuperarContra.jsp" target="holi">AQUÍ</a></p>
                        <p>¿No tiene una cuenta? <a href="formulario.jsp" target="holi">Crea una.</a></p>
                        
                       </div>  
               
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
