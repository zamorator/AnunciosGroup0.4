<%-- 
    Document   : difusor_canjear
    Created on : 25-may-2015, 20:13:11
    Author     : macbookair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/jquery-min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <script type ="text/javascript" src="../js/paginacion.js"></script>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Canjear</title>
    </head>
    <body>
        <%@include file="../base_ag/_menu_difusor.jsp" %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"><a href="difusor_inicio.jsp">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation" class="active"><a href="#">Canjear</a></li>
        </ul>
        
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Todos</a></li>
                <li role="presentation"><a href="difusor_favorito.jsp">Mis Anuncios</a></li>
            </ul>
        
            <div id="agregar_anuncio" class="contenido">
                    <div class="workflow" >
                        <ul class="nav nav-wizard">

                            <li class='active'>Paso 1</li>

                            <li>Paso 2</li>

                            <li>Paso 3</li>

                        </ul>
                    </div>
                    <div class="contenido_interior" >
                        <h3>

                        </h3>
                        <div class="contenedorImagen">

                        </div>
                        <div class="detalle" >

                        </div>
                        <div class="puntos" >

                            <input type="radio" name="group1" value="10"> 10.000<br>
                            <input type="radio" name="group1" value="15" checked> 15.000<br>
                            <input type="radio" name="group1" value="20"> 20.000
                        </div>
                    </div>
                    <a href="comprar_sharecoins_paso2.jsp" class="btn btn-primary">Siguiente</a>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %> 
    </body>
</html>
