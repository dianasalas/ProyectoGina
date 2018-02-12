<%-- 
    Document   : tabla11
    Created on : 30/11/2016, 11:44:59 PM
    Author     : diana
--%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<jsp:setProperty name="objCuenta" property="*"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>GRAFICAS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="http://code.highcharts.com/highcharts.js"></script>
        <script src="http://code.highcharts.com/modules/exporting.js"></script>
        
        
    </head>
    <body>
        
        <div id="container">
            
            <script>
                    $(function ($) {
                        var h=10;
                    $('#container').highcharts({
                        title: {
                            text: 'V E N T A S',
                            x: -20 //center
                        },
                        subtitle: {
                            text: 'grafica de ventas',
                            x: -20
                        },
                        xAxis: {
                            categories: ['1', '2', '3', '4', '5', '6',
                                        '7', '8', '9', '10', '11', '12',
                                        '13', '14', '15', '16', '17', '18',
                                        '19', '20', '21', '22', '23', '24']
                        },
                        yAxis: {
                            title: {
                                text: 'V E N T A S  $'
                            },
                            plotLines: [{
                                value: 0,
                                width: 1,
                                color: '#808080'
                            }]
                        },
                        tooltip: {
                            //valueSuffix: '%'
                        },
                        legend: {
                            layout: 'vertical',
                            align: 'right',
                            verticalAlign: 'middle',
                            borderWidth: 0
                        },
                        series: [{
                            
                            name: 'Monto $',
                            color: 'purple',
                            data: (function() {
                                // generate an array of random data
                                <%
                                //String data = [];
                                    try{
                                        String consulta="select * from ventas;";
                                        objConn.Consultar(consulta);
                                    }catch(Exception e){
                                        out.println("error"+e);
                                    }
                                    int n=0;
                                    if(objConn.rs!=null){
                                        try{
                                            ;//objConn.rs.first();//primero
                                            objConn.rs.last();//ultimo
                                            n=objConn.rs.getRow();//total de registros
                                            objConn.rs.first();
                                        }catch(Exception e){
                                            out.println("error  "+e);
                                        }
                                    }
                                    //objConn.rs.last();
                                    objConn.rs.first();
                                    
                                    ArrayList total=new ArrayList();
                                    for(int j=0;j<n;j++){
                                        total.add(objConn.rs.getString("monto"));
                                        objConn.rs.next();
                                    }
                                    //} 
                                %>
                                return <%=total%>;
                            })()
                        }],
                        plotOptions:{line:{dataLabels:{enabled:true}}}
                    });
                });
            </script>
            
        </div>
        
        
    </body>
</html>

