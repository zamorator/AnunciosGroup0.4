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
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/Estilos_ag.css">
        <title>Ingreso Anunciante</title>
    </head>
    <body>
        <div class="contenido">
            <% if (request.getParameter("message") != null) {%>
            <div class="alert alert-danger" role="alert">${param.message}</div>
            <% }%>
            <form action="${pageContext.request.contextPath}/LoginAnunciante" method="POST" >
                <div class="form-group">
                    <label for="InputNombreUAnunciante">Nombre Anunciante</label>
                    <input type="text" class="form-control" name="InputNombreUAnunciante" id="NombreUAnunciante" placeholder="Ingrese Nombre Anunciante" required="">
                </div>
                <div class="form-group">
                    <label for="InputPassword">Contraseña</label>
                    <input type="text" class="form-control" name="InputPassword" id="Password" placeholder="Ingrese Contraseña" required="">
                </div>
                <button class="btn btn-default" type="submit" >Ingreso</button>
            </form>
        </div>
        <%@include file="base_ag/_pie_pagina.jsp" %>
    </body>
</html>
