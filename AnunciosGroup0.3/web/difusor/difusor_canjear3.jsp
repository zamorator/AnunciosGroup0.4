<%-- 
    Document   : difusor_canjear3
    Created on : 22-jun-2015, 22:40:31
    Author     : macbookair
--%>

<%@page import="cl.inacap.model.Cupon"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
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
    </head>
            <%
                HttpSession session_actual2 = request.getSession(true);
                Anuncio anuncio = (Anuncio) session_actual2.getAttribute("anuncio");
                HttpSession session_actual3 = request.getSession(true);
                Cupon cupon = (Cupon) session_actual3.getAttribute("cupon");
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
                            <li>Paso 2</li>
                            <li class='active'>Paso 3</li>
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
                            
                        </div>
                        <div class="col-md-5">
                            <p>Para terminar de generar tu cúpon, presiona finalizar y este quedara disponibles en tu perfil.</p>
                        </div>
                    </div>
                    <hr>    
                    <form method="POST" action="${pageContext.request.contextPath}/GeneraCupon2">
                        <input type="hidden" name="cupon_codigo_anuncio" value="<%= cupon.getCodigo_anuncio() %>">  
                        <input type="hidden" name="cupon_nombre_difusor" value="<%= cupon.getNombre_u_difusor() %>">  
                        <input type="hidden" name="cupon_descuento" value="<%= cupon.getDescuento_obtenido() %>">  
                        <input type="hidden" name="cupon_valor_final" value="<%= cupon.getValor_final_producto() %>">    
                        <button type="submit" class="btn btn-primary" value="Finalizar">Finalizar</button>
                    </form>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %> 
        
    </body>
</html>
