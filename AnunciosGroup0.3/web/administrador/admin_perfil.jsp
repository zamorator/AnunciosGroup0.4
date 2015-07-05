<%-- 
    Document   : admin_perfil
    Created on : 08-jun-2015, 20:10:28
    Author     : Javoru
--%>

<%@page import="cl.inacap.dao.giro.GiroDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.inacap.model.Giro"%>
<%@page import="cl.inacap.model.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="../js/jquery-min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <script type ="text/javascript" src="../js/paginacion.js"></script>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Perfil</title>
    </head>
    <%
        Administrador administrador = (Administrador) session.getAttribute("administrador");
        GiroDAO giroDao = new GiroDAO();
        ArrayList<Giro> giros = giroDao.listaGirosRubroHeI();
    %>
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

            <div class="contenido">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <td>Habilitado</td>
                            <td>Giro</td>
                        </tr>
                    </thead>
                    <% for (Giro g : giros) {%>
                    <tr>
                        <td><input type="checkbox" checked="" /> </td>
                        <td><%= g.getDetalle()%></td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
