<%-- 
    Document   : inicio
    Created on : 28-03-2015, 9:42:25
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
            <ul class="nav nav-tabs nav-justified">
                <li role="submenu" class="active"><a href="#">Mis Anuncios</a></li>
                <li role="submenu"><a href="agregar_anuncio.jsp">Agregar Anuncio</a></li>
            </ul>
        </div>


        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
