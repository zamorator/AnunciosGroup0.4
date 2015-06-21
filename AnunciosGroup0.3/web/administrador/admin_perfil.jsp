<%-- 
    Document   : admin_perfil
    Created on : 08-jun-2015, 20:10:28
    Author     : Javoru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="../js/main.js"></script>
        <link rel="stylesheet" href="../css/cabecera_anunciante.css">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/modern-business.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <title>Perfil</title>
    </head>
    <body>
         <%@include file="../base_ag/_menu_administrador.jsp" %>    
    
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation" ><a href="../administrador/Admin_inicio.jsp">Anuncios</a></li>
            <li role="presentation" ><a href="../administrador/admin_empresas.jsp">Empresas</a></li>
            <li role="presentation" class="active" ><a href="#">Perfil</a></li>
        </ul>
        
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Mi Perfil</a></li>

                
                
            </ul>
        </div>
         <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
