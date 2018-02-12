<%-- 
    Document   : pedidos
    Created on : 14/12/2016, 12:11:00 AM
    Author     : diana resendiz
--%>

<%@page import="java.util.Map"%>
<%@page import="mysql.MySqlConexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.swing.JOptionPane"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! 
    String Usuario= "";
    String Contraseña= "";
    String Mensaje= "";
    String Para= "";
    String Asunto = ""; 
    String equis = "";
    String pais = "";
    int gastos = 0;
    int impuestos = 0;
    String correo= "";
%>
<html>
    <head>
        <title>Pedidos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        
        
        <script type="text/javascript">
            function gastos(){
                var gasto=0;
                var pais = document.getElementById("pais").value;
                if(pais=="Mexico"){
                    gasto=0;
                }
                if(pais=="USA"){
                    gasto=300;
                }
                if(pais=="Colombia"){
                    gasto=500;
                }
                var g = document.getElementById("gastos").innerHTML="";
                var g = document.getElementById("gastos");
                var p = document.createElement("p");
                p.innerHTML = "Gastos de envio ("+pais+"): $"+gasto;
                g.appendChild(p);
                
                //alert(pais+" "+gasto);
            }
            
            function pedido(){
                
                /*var nombre = document.getElementById("nombre").value;
                var email = document.getElementById("email").value;
                var direccion = document.getElementById("direccion").value;
                var ciudad = document.getElementById("ciudad").value;
                var pais = document.getElementById("pais").value;
                var cp = document.getElementById("cp").value;
                var telefono = document.getElementById("telefono").value;
                
                var mensaje = nombre+email+direccion+ciudad+pais+cp+telefono;
                alert(" ---- "+mensaje);*/
                    
                <% 
                    
                    HttpSession sesion  = request.getSession();
                    TreeMap car = (TreeMap)sesion.getAttribute("carrito");
                    
                    equis+=car.size()+"----------";
                    
                    
                    correo = ""+request.getParameter("email");
                    
                    equis += "<div class='container-fluid text-center' style='margin-top:17%; margin-bottom:0px'><center><font color=red><h1>Nota de Compra</h1></font></center>";
                   
                    equis +="<table width='100%'>"
                            + "<tr>"
                            + "<td colspan='3'>"+"<p>"+ "<b>Nombre:</b> " + request.getParameter("nombre")+ "</td>"
                            + "</tr> "
                            + "<tr>"
                            + "<td colspan='3'>"+"<p>"+ "<b>E-mail:</b> " + request.getParameter("email")+ "</td>"
                            + "</tr> "
                            + "<tr>"
                            + "<td width='25%'>"+"<p>"+ "<b>Direccion:</b> " + request.getParameter("direccion")+"</td>"
                            + "<td width='25%'>"+"<p>"+ "<b>Ciudad:</b> " + request.getParameter("ciudad")+"</td>"
                            + "<td width='25%'>"+"<p>"+ "<b>Pais:</b> " + request.getParameter("pais")+"</td>"
                            + "<td width='25%'>"+"<p>"+ "<b>Codigo Postal:</b> " + request.getParameter("cp")+"</td>"
                            + "</tr> "
                            + "<tr>"
                            + "<td>"+"<p>"+ "<b>Telefono:</b> " + request.getParameter("telefono")+"</td>"
                            + "</tr> ";
                                                
                    
                    
                    equis+="<tr>";
                    pais = "";
                    pais = request.getParameter("pais");
                    try{
                    if(pais.equals("Mexico")){
                        equis+="<td><p>"+"<b>Impuesto:</b> 5% </td>";
                        equis+="<td><p>"+"<b>Gastos de envio (Mexico):</b> $0 </td>";
                        gastos = 0;
                        impuestos = 5;
                    }
                    if(pais.equals("USA")){
                        equis+="<td><p>"+"<b>Impuesto:</b> 10% </td>";
                        equis+="<td><p>"+"<b>Gastos de envio (USA):</b> $300 </td>";
                        gastos = 300;
                        impuestos = 10;
                    }
                    if(pais.equals("Colombia")){
                        equis+="<td><p>"+"<b>Impuesto: 15% </td>";
                        equis+="<td><p>"+"<b>Gastos de envio (Colombia):</b> $500 </td>";
                        gastos = 500;
                        impuestos = 15;
                    }
                    }catch(Exception e){
                        
                    }
                    equis +="</tr>"+
                            "</table></div>";
                    equis+="<br>Usted a Comprado:<br>";
                    int p = 0;
                    String nom = "";
                    int to =0;
                    Map <Integer, Integer> treeMap = (TreeMap)session.getAttribute("carrito");
                    Iterator it = treeMap.keySet().iterator();
                    MySqlConexion objConn = new MySqlConexion();
                    while (it.hasNext()) {
                        Integer key = (int)(it.next());
                        String consulta = "select * from productos where idProducto=" + key + ";";
                        
                        objConn.Consultar(consulta);
                        if(objConn.rs.getRow() != 0){
                            nom=objConn.rs.getString(2);//nombre del producto
                            treeMap.get(key);//cantidad
                            objConn.rs.getDouble(7);//precio unitario
                            p=(int)(objConn.rs.getDouble(7)*(int)treeMap.get(key)); 
                            equis+="<br>"+nom+" - $"+p;
                            to+=p;
//subtotal (productos*cantidad)
                        }
                    }
                    //updates de existencias
                    it = treeMap.keySet().iterator();
                    while (it.hasNext()) {
                        Integer key = (int)(it.next());
                        String consulta = "select * from productos where idProducto=" + key + ";";
                        objConn.Consultar(consulta);
                        consulta = "update productos set existencia=" + (treeMap.get(key)-objConn.rs.getInt(6)) 
                                + " where idProducto=" + key + ";" ;
                    }
                    treeMap.clear();
                    equis+="<br><br>Total: $" + to;
                    Usuario = "store.kleidung@gmail.com";
                    Contraseña = new String ("holahola123");
                    //Para = "diiana.rsdz@gmail.com";
                    Para = correo;
                    Asunto = "Pedido";
                    Mensaje = equis;
                    
                    
                    Properties props = new Properties();
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.starttls.enable", "true");
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.port", "587");
                   
                    
                    Session sessiones = Session.getInstance(props,
                        new javax.mail.Authenticator() {
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(Usuario,Contraseña);
                            }
                        });
                     
                    try {
                        Message message = new MimeMessage(sessiones);
                        message.setFrom(new InternetAddress(Usuario));
                        message.setRecipients(Message.RecipientType.TO,
                                InternetAddress.parse(Para));
                        message.setSubject(Asunto);
                        //message.setText(Mensaje);
                        message.setContent(Mensaje, "text/html");

                        Transport.send(message);

                    } catch (MessagingException e) {
                        //throw new RuntimeException(e);
                    }
                %>
                        
                alert("Enviado... ");
                
            }
        </script>
        
        
        
    </head>
    <body>   
        <div class="container-fluid text-center" style="margin-top:17%; margin-bottom:0px">    
        <center><h1>¿Donde quieres que se envie tu pedido?</h1></center>
        
        <form name="form">
            <center>
            <br>Nombre completo
            <br><input type="text" id="nombre" name="nombre" value="" /><br>
            <br>Direccion de e-mail (valoramos su privacidad)
            <br><input type="text" id="email" name="email" value="" /><br>
            <br>Direccion
            <br><input type="text" id="direccion" name="direccion" value="" />
            <br>Ciudad
            <br><input type="text" id="ciudad" name="ciudad" value="" /><br>
            <br>Pais
            <br><select id="pais" name="pais" onChange="gastos()">
                <option>Mexico</option>
                <option>USA</option>
                <option>Colombia</option>
            </select><br>
            <br>Codigo Postal.
            <br><input type="text" id="cp" name="cp" value="" /><br>
            <br>Numero telefonico
            <br><input type="text" id="telefono" name="telefono" value="" /><br>
            
            <div id="gastos">
                <p>Gastos de envio (Mexico): $ 0
            </div><br>
            
            <br><br>
            <input type="submit" value="Enviar dato" onclick="pedido()"></center>
            <!--input type="submit" value="enviar" name="enviar" onclick="email()"/>-->
        </form>
           
        </div>
    </body>
</html>
