<%-- 
    Document   : Alta
    Created on : 29/11/2016, 07:57:23 PM
    Author     : Jose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de producto</title>
    </head>
    <body>
        <h1>Alta de producto</h1>
        <form action="exalta.jsp" method="post">
            <pre>
            Nombre: <input type="text" name="nombre" value="" />

            Categoria por sexo: <input type="text" name="categorias" value="" />

            Categoria por ropa: <input type="text" name="categoriar" value="" />

            Descripcion: <input type="text" name="descripcion" value="" />

            Existencia:<input type="number" name="existencia" value="" />

            Precio:<input type="text"  name="precio"  />

            Nombre de la imagen chica (Debe estar en Escritorio): <input type="file" name="imagenc" required accept="image/*">
            
            Nombre de la imagen grande (Debe estar en Escritorio): <input type="file" name="imageng" required accept="image/*">

            <input type="submit" value="enviar" />


            </pre>
        </form>
    </body>
</html>
