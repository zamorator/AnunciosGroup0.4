<%-- 
    Document   : difusor_puntos
    Created on : 05-jun-2015, 21:41:44
    Author     : macbookair
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
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Mis Puntos</title>
    </head>
    <body>
       <%@include file="../base_ag/_menu_difusor.jsp" %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"><a href="difusor_inicio.jsp">Inicio</a></li>
            <li role="presentation" class="active"><a href="#">Perfil</a></li>
            <li role="presentation"><a href="#">Canjear</a></li>
        </ul>
       <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation"><a href="difusor_perfil.jsp">Mis Datos</a></li>
                <li role="presentation" class="active"><a href="#">Puntos</a></li>
            </ul>
        </div>
       <%@include file="../base_ag/_pie_pagina.jsp" %>   
    </body>
</html>
