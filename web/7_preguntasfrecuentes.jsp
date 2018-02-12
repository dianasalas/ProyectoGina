<%-- 
    Document   : 7_preguntasfrecuentes
    Created on : Dec 14, 2016, 9:45:22 AM
    Author     : Diana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Preguntas Frecuentes</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
        <!-- Bootstrap -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
        
          
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
        <script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script>
            
            $(document).ready(function(){ 
                $('.alternar-respuesta').on('click',function(e){
                    $(this).parent().next().toggle('slow');
                    e.preventDefault();
                });
                $('#alternar-todo').on('click',function(e){
                    $('.respuesta').toggle('slow');
                    e.preventDefault();
                });
            });  
             
             function mostrar(id) {
                obj = document.getElementById(id);
                obj.style.visibility = (obj.style.visibility == 'hidden') ? 'visible' : 'hidden';
              }
        </script>
        
        <link rel="stylesheet" href="estilos/mine.css" type="text/css">
        
        
        
    </head>
    <body>
  
        <div class="container-fluid" style="margin-top:17%; margin-bottom:0px">
            <center>   <h1>Preguntas Frecuentes <span class="glyphicon glyphicon glyphicon-search"></span></h1></center><br><br>
            
            
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8" style="background-color:lavenderblush;">
                    
                    <h3>¿Cual es el proceso de compra online?<a href="#" class="alternar-respuesta"> › </a></h3>
                    <p class="respuesta" style="display:none"> 
                        Para realizar una compra en nuestra tienda Online debes seleccionar los productos que te interesen y añadirlos al carrito de la compra mediante el botón “Añadir al carrito”. <br>
                                Dando clic en el carrito de compras se muestran los productos que tenemos, pudiendo finalizar la compra o continuar comprando. Una vez seleccionados los artículos que buscas, pulsamos el botón “Finalizar compra” y así iniciará el proceso de compra de los productos que hayas incorporado hasta este momento al Carrito.<br><br>

                                Los pasos siguientes serán:<br> 
                                <span style="margin-left:25px;">1 • “Mi carrito”: Listado detallado de los productos que se han añadido al carrito. Para validar la compra pulsar en “finalizar pedido”. 
                            <br><span style="margin-left:25px;">2 • “Datos personales”: Es necesario estar registrado para comprar en nuestra tienda, además tendrás que introducir tus datos para efectuar el pago y poder enviarte el pedido cada vez que quieras realizar una compra. 
                            <br><span style="margin-left:25px;">3 • “Envío y pago”: En este paso tendrás que introducir los datos necesarios para realizar el pago de tu compra. 
                            <br><span style="margin-left:25px;">4 • “Resumen”: Se mostrará el resumen de todos los artículos comprados, sus datos y los datos de pago para aceptar la compra o modificar en caso que haya un error.
                            <br><span style="margin-left:25px;">5 • “Confirmación”: Aparecerá una ventana dónde se confirmará que el pedido se ha realizado correctamente, y también recibirá un correo electrónico de confirmación.
                    </p>
                    
                    <h3>¿Que sistemas de pago puedo utilizar?<a href="#" class="alternar-respuesta"> › </a></h3>
                    <p class="respuesta" style="display:none"> 
                        Puedes elegir entre varios métodos de pago: <br><br>

                        <span style="margin-left:25px;">• TARJETA DE DÉBITO O CRÉDITO</span> <br>
                        Visa, Visa Electron, MasterCard y American Express. Para el pago con tarjetas de débito o American Express, el cargo se realizará en tiempo real.

                        <span style="margin-left:25px;">• PAYPAL </span> <br>
                        Para comprar con PayPal, selecciona este método de pago y haz clic en 'Confirmar pago'. A continuación, serás redirigido a la página de PayPal para proceder al pago.
                        
                        <span style="margin-left:25px;">• MERCADO LIBRE </span> <br>
                        Para comprar con Mercado Libre, selecciona este método de pago y haz clic en 'Confirmar pago'. A continuación, serás redirigido a la página de Mercado Libre para proceder al pago.
                      
                    </p>
                    
                    <h3>¿Cuanto tardara en llegar mi pedido?<a href="#" class="alternar-respuesta"> › </a></h3>
                    <p class="respuesta" style="display:none"> 
                        Todo dependerá del tipo de envío que hallas seleccionado. Aquí la explicación. <br>
                        <br><span style="margin-left:25px;">    a) Envío gratis. Es el plazo máximo fijado para las entregas y es de 30 días hábiles, establecido por defecto en la Ley. </span>
                        <br><span style="margin-left:25px;">    b) Envío "Cute". 15-20 días laborables, desde la fecha de pago del pedido. Este tipo de envio tiene un costo $70.00 </span>
                        <br><span style="margin-left:25px;">    c) Envío "Premium". 5-8 días laborables desde la fecha de pago del pedido. Este envio tiene un costo $150.00</span>
                        <br><span style="margin-left:25px;">    d) Envío "Golden". 1-2 días, desde la fecha de confirmación de pago del pedido. Este tipo de envio tiene un costo $250.00</span>

                    </p>
                    
                    <h3>¿Es segura la tienda Kleidung?<a href="#" class="alternar-respuesta"> › </a></h3>
                    <p class="respuesta" style="display:none"> 
                        Todas las transacciones realizadas en www.kledidungstore.com son 100% seguras. 
                        <br><br>Todas las operaciones que implican la transmisión de datos personales o bancarios se realizan utilizando un servidor  basado en la tecnología de seguridad estándar SSL
                        (Secure Socked Layer). Toda la información que nos transmitas viaja cifrada a través de la red. Así mismo los datos de tu tarjeta de crédito no quedan registrados en ninguna base 
                        de datos sino que van directamente al TPV (Terminal Punto de Venta) de el banco operador.
                    </p>
                    
                    <h3>¿Puedo cancelar o modificar mi pedido?<a href="#" class="alternar-respuesta"> › </a></h3>
                    <p class="respuesta" style="display:none"> 
                        Actualmente, no es posible cancelar o modificar tu pedido ya que preparamos tu compra en cuanto nos confirmas el pedido en la web.
                    </p>    
                    
                    <h3>Tengo un cupon promocional o descuento, ¿ccmo lo uso en una compra online?<a href="#" class="alternar-respuesta"> › </a></h3>
                    <p class="respuesta" style="display:none"> 
                        Cuando llegues al resumen de tu compra*, haz clic en 'Aplicar cupón'.<br>
                        <span style="font-size:10px;">*Únicamente podrás utilizar un cupón por compra.</span>
                    </p> 
                    
                    <h3>No encuentro mi talla o el color que me gusta. ¿Que hago?<a href="#" class="alternar-respuesta"> › </a></h3>
                    <p class="respuesta" style="display:none"> 
                        Puedes mandar un correo a nuestra página, en la sección de <a href="3_contacto.jsp" target="section">Contacto</a> con el nombre del artículo y el color/talla que necesitas, enseguida
                        recibirás un correo de Kleidung Store para hacer búsqueda de tu artículo en nuestros almacenes. De igual manera, cuando esté este disponible, te avisaremos antes y ya decidirás si haces la compra o no. 
                        Que se realizará como una compra normal, en la página web.
                    </p>
                    
                    <h3>Olvide mi contraseña ¿que procede?<a href="#" class="alternar-respuesta"> › </a></h3>
                    <p class="respuesta" style="display:none"> 
                        En la sección de <a href="6_login.jsp" target="section">Login</a> encontrará un opción llamada "Olvide mi contraseña y/o mi cuenta esta bloqueda", dar CLIC y seguir
                        los pasos que se muestran en el formulario. 
                    </p>
                    
                    <h3>Olvide mi contraseña ¿que procede?<a href="#" class="alternar-respuesta"> › </a></h3>
                    <p class="respuesta" style="display:none"> 
                        En la sección de <a href="6_login.jsp" target="section">Login</a> encontrará un opción llamada "Olvide mi contraseña y/o mi cuenta esta bloqueda", dar CLIC y seguir
                        los pasos que se muestran en el formulario. 
                    </p>
                    
                    
                    <h3><a href="#" id="alternar-todo">Ver/Ocultar  todo </a></h3>

                    <!-- Trigger the modal with a button
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">¿Cuál es el proceso de compra online?</button>
                     -->
                    <!-- Modal 
                    <div class="modal fade" id="myModal" role="dialog">
                      <div class="modal-dialog" id="modalMargen">

                         Modal content
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h3 class="modal-title">proceso de compras online</h3>
                          </div>
                          <div class="modal-body">
                            <p></p>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                          </div>
                        </div>

                      </div>
                    </div>-->


                </div>
                <div class="col-sm-2"></div>
            </div>           
        </div>
    </body>
</html>
