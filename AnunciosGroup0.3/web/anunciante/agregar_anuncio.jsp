<%-- 
    Document   : agregar_anuncio
    Created on : 11-04-2015, 12:21:24
    Author     : dzamoraf
--%>

<%@page import="cl.inacap.model.Anunciante"%>
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
        <title>Anunciante</title>
        <%
            Anunciante anunciante;
            HttpSession session_actual = request.getSession();
            anunciante = (Anunciante) session.getAttribute("anunciante");
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp" %> 

        <ul class="nav nav-pills nav-justified menu_anunciante" role="group">
            <li role="presentation" class="active"><a href="#">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="enviar_mensaje.jsp">Ayuda</a></li>
        </ul>

        <div id="contenido" class="submenu"> 
            <div id="submenu" class="links_submenu">
                <ul class="nav nav-tabs nav-justified">
                    <li role="submenu"><a href="mis_anuncios.jsp">Mis Anuncios</a></li>
                    <li role="submenu" class="active"><a href="#">Agregar Anuncio</a></li>
                </ul>
            </div>
            <div id="agregar_anuncio" class="contenido">
                <form method="POST" action="${pageContext.request.contextPath}/AgregarAnuncio">
                    <div class="form-group">
                        <label for="InputNombreAnuncio">Nombre Anuncio</label>
                        <input type="text" class="form-control" name="InputNombreAnuncio" id="InputNombreAnuncio" placeholder="Ingrese Nombre Anuncio">
                    </div>
                    <div class="form-group">
                        <label for="InputDescripcionAnuncio">Descripci&oacute;n Anuncio</label>
                        <input type="text" class="form-control" name="InputDescripcionAnuncio" id="InputDescripcionAnuncio" placeholder="Ingrese Descripci&oacute;n del Anuncio">
                    </div>
                    <button type="submit" class="btn btn-default">Agregar</button>
                </form>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
