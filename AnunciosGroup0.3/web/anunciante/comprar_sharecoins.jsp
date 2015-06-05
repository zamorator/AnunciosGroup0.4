<%-- 
    Document   : comprar_sharecoins
    Created on : 04-06-2015, 08:17:10 PM
    Author     : zamorator <zamorator@gmail.com>
--%>

<%@page import="cl.inacap.model.Anunciante"%>
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
        <title>Anunciante</title>
        <% Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");%>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp" %> 

        <ul class="nav nav-pills nav-justified menu_anunciante" role="group">
            <li role="presentation" class="active"><a href="mis_anuncios.jsp">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="#">Ayuda</a></li>
        </ul>

        <div id="contenido" class="submenu"> 
            <div id="submenu" class="links_submenu">
                <ul class="nav nav-tabs nav-justified">
                    <li role="submenu"><a href="mis_anuncios.jsp">Mis Anuncios</a></li>
                    <li role="submenu" class="active"><a href="#">Agregar Anuncio</a></li>
                </ul>
            </div>
            <div id="agregar_anuncio" class="contenido">
                <ul class="nav nav-wizard">

                    <li class='active'>Paso 1</li>

                    <li>Paso 2</li>

                    <li>Paso 3</li>

                </ul>

                <h1>workflow de compra</h1>
                <a href="comprar_sharecoins_paso2.jsp" class="btn btn-primary">Siguiente</a>
            </div>
        </div>

        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
