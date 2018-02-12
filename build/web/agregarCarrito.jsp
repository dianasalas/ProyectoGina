<%-- 
    Document   : agregarCarrito
    Created on : 15/12/2016, 05:09:10 AM
    Author     : diana
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="pClases.Productos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>

        <%
            HttpSession sesion = request.getSession();
            //ArrayList carro = (ArrayList)(sesion.getAttribute("carrito"));
            int id = Integer.parseInt(request.getParameter("id"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));

            Map<Integer, Integer> carro = (TreeMap) (sesion.getAttribute("carrito"));
            if(cantidad == 0){
                carro.remove(id);
                out.println("delete");
            } else if (carro.containsKey(id)) {
                carro.replace(id, carro.get(id) + cantidad);
            } else {
                carro.put(id, cantidad);
            }
            sesion.setAttribute("carrito", carro);
            
            //int productos = 0;
            /*Iterator it = carro.keySet().iterator();
            while (it.hasNext()) {
                Integer key = (int)(it.next());
                productos+= carro.get(key);
            }
            out.println(productos);
            */
        %>    

