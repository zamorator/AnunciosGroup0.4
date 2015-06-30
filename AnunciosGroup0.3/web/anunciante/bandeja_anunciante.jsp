<%-- 
    Document   : bandeja_anunciante
    Created on : 18-05-2015, 06:44:23 PM
    Author     : zamorator <zamorator@gmail.com>
--%>

<%@page import="cl.inacap.model.Mensaje"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.inacap.dao.anunciante.MensajeDAO"%>
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
            MensajeDAO mensajeDao = new MensajeDAO();
            List<Mensaje> mensajes = mensajeDao.buscarMensajesAnunciante(anunciante);
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp" %> 

        <ul class="nav nav-pills nav-justified menu_anunciante" role="group"style="padding-top: 10%;">
            <li role="presentation"><a href="mis_anuncios.jsp">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation" class="active"><a href="#">Ayuda</a></li>
        </ul>

        <div id="mis_anuncios" class="contenido">
            <div id="panel">
                <div id="submenu" class="links_submenu">
                    <ul class="nav nav-tabs ">
                        <li role="submenu"><a href="enviar_mensaje.jsp">Enviar Mensaje</a></li>
                        <li role="submenu" class="active"><a href="#">Bandeja</a></li>
                    </ul>
                </div>
                <h1>Bandeja Anunciante</h1>

                <%if(mensajes.size() == 0){ %>
                <h3>No tiene mensajes en su bandeja.</h3>
                <%} else { %>
                
                <% for(Mensaje m : mensajes) {%>
                <ul class="list-group">
                    <li class="list-group-item">
                        <span class="badge"><%= m.getEstado() %>  </span>
                        De: <%= m.getDe() %> | Asunto: <%= m.getAsunto() %>
                    </li>
                    <li class="list-group-item">
                        <%= m.getMensaje() %>
                    </li>
                </ul>
                <% }%>
                <%}%>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
