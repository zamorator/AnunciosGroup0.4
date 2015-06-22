<%-- 
    Document   : difusor_canjear2
    Created on : 21-jun-2015, 22:46:41
    Author     : macbookair
--%>

<%@page import="cl.inacap.model.Anuncio"%>
<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

                            <li>Paso 1</li>

                            <li class='active'>Paso 2</li>

                            <li>Paso 3</li>

                        </ul>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-7">
                            <a href="#">
                                <img class="img-responsive" src="../img/anuncios/<%= anuncio.getImagen_anuncio()%>" width="500px" alt="">
                            </a>
                        </div>
                        <div class="col-md-5">
                            <h3><%= anuncio.getNombre_anuncio()%></h3>
                            <h4><%= anuncio.getNombre_u_anunciante()%></h4>
                            <p><%= anuncio.getDescripcion_anuncio()%></p>
                        </div>
                        <div class="col-md-5">
                            <h3>Maximo descuento: <%= anuncio.getPorcentaje_descuento() %> %</h3>
                            <h4>Puntos a utilizar:</h4> <input type="number"  min="0" max="<%= puntos %>" onkeypress="return solonumeros(event);" class="form-control" name="InputPuntos" required="">

                            <h4>Descuento obtenido:</h4>
                        </div>
                    </div>
                    <hr>
                    <a href="difusor_canjear2.jsp" id="boton" class="btn btn-primary" >Siguiente</a>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %> 
    </body>
</html>
