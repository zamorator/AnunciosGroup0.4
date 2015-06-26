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
        <script src="../js/jquery.fileupload.js"></script>
        <script src="../js/jquery.iframe-transport.js"></script>
        <script src="../js/vendor/jquery.ui.widget.js"></script>
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
            session.setAttribute("id_anuncio", request.getParameter("anuncio_id"));
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp"%> 
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group"style="padding-top: 10%;">
            <li role="presentation" class="active"><a href="#">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="enviar_mensaje.jsp">Ayuda</a></li>
        </ul>
        <div id="panel">
            <% if (request.getParameter("mensaje") != null) {%>
            <div class="label label-success" role="alert">${param.mensaje}</div>
            <% }%>
            <div id="submenu" class="links_submenu">
                <ul class="nav nav-tabs ">
                    <li role="submenu"><a href="mis_anuncios.jsp">Mis Anuncios</a></li>
                    <li role="submenu"><a href="agregar_anuncio.jsp">Agregar Anuncio</a></li>
                    <li role="submenu" class="active"><a href="#">Editar Anuncio</a></li>
                </ul>
            </div>

            <div class="contenido" >

                <form action="${pageContext.request.contextPath}/EditarImagenesAnuncio" method="post" enctype="multipart/form-data"> 

                    <input type="file" name="file" required=""/> 
                    <br>
                    <input class="btn btn-primary" type="submit" value="Subir archivo" /> 
                </form> 
            </div>
        </div>


        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</body>
</html>
