<%-- 
    Document   : inicio_anunciante
    Created on : 11-jun-2015, 23:18:55
    Author     : macbookair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/full-width-pics.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/Estilos_ag.css">
        <title>Inicio Anunciante</title>
    </head>
    <body>
     <%@include file="base_ag/_menu_general.jsp" %>  
    <!-- Full Width Image Header with Logo -->
    <!-- Image backgrounds are set within the full-width-pics.css file. -->
    <header class="image-bg-fluid-height">
        
    </header>

    <!-- Content Section -->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="section-heading">AnunciosGroup para empresas</h1>
                    <p class="lead section-lead">Si eres una empresa que busca captar una mayor cantidad de clientes, esta es la solucion.</p>
                    <p class="section-paragraph"><b>AnunciosGroup </b> mediante la integración de los consumidores de la publicidad misma, crea un canal para realizar una publicidad masificada a un bajo costo y con resultados concretos, no dudes en probar <b>AnunciosGroup </b> no te arrepentirás.</p>
                    <p class="section-paragraph">Si ya poses cuenta en AnunciosGroup <a href="ingreso_anunciante.jsp">accede desde aquí</a></p>
                    <p class="section-paragraph">Si eres una pequeña o mediana empresa y te interesa generar publicidad de tus productos o servicios <a href="registro_anunciante.jsp">Solicita un registro desde aquí</a> </a></p>
                </div>
            </div>
        </div>
    </section>

    <!-- Fixed Height Image Aside -->
    <!-- Image backgrounds are set within the full-width-pics.css file. -->
    <aside class="image-bg-fixed-height"></aside>
    <%@include file="base_ag/_pie_pagina.jsp" %>    
    </body>
</html>
