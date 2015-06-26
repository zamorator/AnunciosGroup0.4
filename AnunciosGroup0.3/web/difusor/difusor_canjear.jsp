<%-- 
    Document   : difusor_canjear
    Created on : 25-may-2015, 20:13:11
    Author     : macbookair
--%>

<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/jquery-min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <link rel="stylesheet" href="../css/bootstrap-nav-wizard.css">
        <title>Canjear</title>
    </head>
         <%
            HttpSession session_actual2 = request.getSession(true);
            Anuncio anuncio = (Anuncio) session_actual2.getAttribute("anuncio");
            
         %>
    <body>
        <%@include file="../base_ag/_menu_difusor.jsp" %>
        <%
            DifusorAnunciosDAO difusoranunciosdao = new DifusorAnunciosDAO();
            int puntos = difusoranunciosdao.contartotalpuntos(difusor);
        %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"><a href="difusor_inicio.jsp">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation" class="active"><a href="#">Canjear</a></li>
        </ul>
        
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Canjear</a></li>
                
            </ul>
        
            <div id="agregar_anuncio" class="contenido">
                    <div class="workflow" >
                        <ul class="nav nav-wizard">

                            <li class='active'>Paso 1</li>

                            <li>Paso 2</li>

                            <li>Paso 3</li>

                        </ul>
                    </div>
                    <hr>
            <form method="POST" action="${pageContext.request.contextPath}/GenerarCupon">
                <input type="hidden" value="<%= difusor.getNombre_u_difusor() %>" name="nombre_difusor">
                    <div class="row">
                        <div class="col-md-7">
                            <a href="#">
                                <img class="img-responsive img-thumbnail"  src="${pageContext.request.contextPath}/images/anunciante/<%= anuncio.getImagen_anuncio()%>" style="width: 400px; height: 400px;" alt="">
                            </a>
                        </div>
                        <div class="col-md-5">
                            <h3> <%= anuncio.getNombre_anuncio()%></h3>
                            <h4><%= anuncio.getNombre_u_anunciante()%></h4>
                            <p><%= anuncio.getDescripcion_anuncio()%></p>
                            <input type="hidden" name="codigo_anuncio" value="<%= anuncio.getCodigo_anuncio() %>">
                            <hr>
                        </div>

                        <div class="col-md-5">
                        <div class="list-group" >
                            <a href="#" class="list-group-item active">
                              Maximo descuento: <%= anuncio.getPorcentaje_descuento() %> %
                              <input type="hidden" id ="max_descuento" value="<%= anuncio.getPorcentaje_descuento() %>">
                            </a>
                            <a href="#" class="list-group-item">Tu coins disponibles: <%= puntos %></a>
                            <a class="list-group-item">Coins a utilizar:<input type="number" id="descuento" name="puntos_utilizados" min="0" max="<%= puntos %>" onkeypress="return solonumeros(event);" value="0"> <input  onclick="Maxpuntos();" type="button" value="Calcular descuento"></a>
                            <input type="hidden" id="max_puntos" value="<%= puntos %>">
                            <a href="#" class="list-group-item">Valor real: $<%= anuncio.getValor_real() %></a>
                            <input type="hidden" id="valor_real"  value="<%= anuncio.getValor_real() %>">
                            <a href="#" class="list-group-item">Descuento obtenido:<span id="valor_descuento" name="descuento_obtenido"  disabled="true" > </span></a>
                            <input type="hidden" id="in_descuento_obtenido" name="in_descuento_obtenido" value="">
                            <a href="#" class="list-group-item">Valor final:<span id="valor_final" name="valor_final" disabled="true" > </span></a>
                            <input type="hidden" id="in_valor_final" name="in_valor_final" value="">
                        </div>
                            
                        </div>
                    </div>
                    <hr>
                    <button type="submit" id="boton_siguiente" class="btn btn-primary" disabled="true" >Siguiente</button>
            </form>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %> 
        
        
        
        
        
        
        
        <script>
               function solonumeros(e)
            {   
                Maxpuntos();
                var keynum = window.event ? window.event.keyCode : e.which;
                if ((keynum === 8) || (keynum === 46))
                return true;
                return /\d/.test(String.fromCharCode(keynum));
                
            }

            function ObtenerDescuento(){
                var valor_real = $('#valor_real').val();
                var descuento=  $('#descuento').val() * 40;
                var total = ((descuento * 100) / valor_real);
                var maximo_descuento = $('#max_descuento').val();
                var valor_final = valor_real -((valor_real * total)/100); 
                console.log("descuento" + descuento);
                console.log("valor_real" + valor_real);
                console.log("total" + total);
                console.log("maximo" + maximo_descuento);
                
                if(total <= maximo_descuento ){
                    total = String(total);
                    total = total.substring(0,3);
                    console.log(total);
                    $('#valor_descuento').text(total+"%");
                    $('#in_descuento_obtenido').val(total);
                    $('#valor_final').text("$" + valor_final);
                    $('#in_valor_final').val(valor_final);
                    if (descuento > 0){
                        $('#boton_siguiente').prop('disabled',false);
                    }else{
                        $('#boton_siguiente').prop('disabled',true); 
                    }
                        
                }else{
                    alert("La cantidad de puntos seleccionados excede al maximo de descuento permitido.");
                    $('#descuento').val("0");
                    $('#valor_descuento').text("0"+"%");
                };
            }
            
            function Maxpuntos(){
                var puntos=  $('#descuento').val();
                var max_puntos= $('#max_puntos').val();
                
                if(puntos > max_puntos){
                    alert("Los puntos seleccionados no pueden ser mayor a los puntos que se posen.");
                    $('#descuento').val("0");
                }else{
                    ObtenerDescuento();
                }
            }
            
        </script>
     
        

    </body>
</html>
