<%-- 
    Document   : agregar_anuncio
    Created on : 11-04-2015, 12:21:24
    Author     : dzamoraf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <title>Anunciante</title>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp" %>  
        <div id="contenido"> 
            <div id="submenu">
                <ul class="nav nav-tabs nav-justified">
                    <li role="submenu"><a href="inicio.jsp">Mis Anuncios</a></li>
                    <li role="submenu" class="active"><a href="#">Agregar Anuncio</a></li>
                </ul>
            </div>
            <div id="agregar_anuncio">

            </div>
        </div>


        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
