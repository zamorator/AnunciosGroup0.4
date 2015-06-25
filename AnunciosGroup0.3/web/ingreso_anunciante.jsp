<%-- 
    Document   : ingreso_anunciante
    Created on : 01-05-2015, 10:56:02
    Author     : zamorator
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
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/Estilos_ag.css">
        <title>Ingreso Anunciante</title>
    </head>
    <body>
         <%@include file="base_ag/_menu_general.jsp" %>
        <div class="contenido">

            <div class="contenido" id="ingreso">
            <% if (request.getParameter("message") != null) {%>
            <div class="alert alert-danger" role="alert">${param.message}</div>
            <% }%>
            <ul class="nav nav-tabs">
                <li role="presentation" ><a href="inicio.jsp">Home</a></li>
            </ul>
            <form action="${pageContext.request.contextPath}/LoginAnunciante" method="POST" >
                <div class="form-group">
                    <label for="InputNombreUAnunciante">Nombre Anunciante</label>
                    <input type="text" class="form-control" name="InputNombreUAnunciante" id="NombreUAnunciante" placeholder="Ingrese Nombre Anunciante" required="">
                </div>
                <div class="form-group">
                    <label for="InputPassword">Contraseña</label>
                    <input type="password" class="form-control" name="InputPassword" id="Password" placeholder="Ingrese Contraseña" required="">
                </div>
                <button class="btn btn-primary" type="submit" >Ingreso</button>
                <a href="inicio_anunciante.jsp" class="btn btn-primary">Volver</a>
            </form>
            </div>
        </div>
        <%@include file="base_ag/_pie_pagina.jsp" %>
    </body>
</html>
