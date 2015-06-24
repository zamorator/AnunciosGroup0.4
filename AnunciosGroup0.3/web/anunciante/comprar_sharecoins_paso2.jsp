<%-- 
    Document   : comprar_sharcoins_paso2
    Created on : 04-06-2015, 09:02:36 PM
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
        <link rel="stylesheet" href="../css/bootstrap-nav-wizard.css">
        <title>Anunciante</title>
        <% Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
            System.out.println(anunciante);

            Giro giro = (Giro) session.getAttribute("giro");
            System.out.println(giro);
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp" %> 

        <ul class="nav nav-pills nav-justified menu_anunciante" role="group">
            <li role="presentation" class="active"><a href="mis_anuncios.jsp">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="#">Ayuda</a></li>
        </ul>

        <div id="contenido" class="submenu"> 
            <form method="post" action="${pageContext.request.contextPath}/ComprarShareCoinsPaso3"  >
                <div id="submenu" class="links_submenu">
                    <ul class="nav nav-tabs nav-justified">
                        <li role="submenu" class="active"><a href="mis_anuncios.jsp">Mis Anuncios</a></li>
                        <li role="submenu"><a href="#">Agregar Anuncio</a></li>
                        <li role="submenu"><a href="#">Editar Anuncio</a></li>
                    </ul>
                </div>
                <div id="agregar_anuncio" class="contenido">
                    <ul class="nav nav-wizard">

                        <li>Paso 1</li>

                        <li class='active'>Paso 2</li>

                        <li>Paso 3</li>

                    </ul>

                    <h1>workflow de compra 2</h1>
                    <img src="../img/webpay.jpg" alt="400px" width="500px" >
                    <button type="submit" class="btn btn-primary">Siguiente</button>
                    <a href="comprar_sharecoins.jsp" class="btn btn-primary">Volver</a>
                </div>
            </form>
        </div>

        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
