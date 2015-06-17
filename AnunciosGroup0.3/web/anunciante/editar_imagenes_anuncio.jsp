<%-- 
    Document   : editar_imagenes_anuncio
    Created on : 16-06-2015, 12:14:31 PM
    Author     : zamorator <zamorator@gmail.com>
--%>

<%@page import="cl.inacap.model.Giro"%>
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
        <title>Anunciante</title>
        <%
            Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
            Giro giro = (Giro) session.getAttribute("giro");
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp"%> 
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group">
            <li role="presentation" class="active"><a href="#">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="enviar_mensaje.jsp">Ayuda</a></li>
        </ul>
        <div class="submenu">  
            <div id="submenu" class="links_submenu">
                <ul class="nav nav-tabs nav-justified">
                    <li role="submenu"><a href="mis_anuncios.jsp">Mis Anuncios</a></li>
                    <li role="submenu"><a href="agregar_anuncio.jsp">Agregar Anuncio</a></li>
                    <li role="submenu" class="active"><a href="#">Editar Anuncio</a></li>
                </ul>
            </div>

            <div class="contenido" >

            </div>

        </div>


        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</body>
</html>
