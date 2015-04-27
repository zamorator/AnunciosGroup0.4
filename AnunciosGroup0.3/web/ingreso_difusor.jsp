<%-- 
    Document   : ingreso_difusor
    Created on : 27-04-2015, 15:07:08
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
        <title>Ingreso Difusor</title>
    </head>
    <body>
        <div class="contenido">
            <% if (request.getParameter("message") != null) {%>
            <div class="alert alert-danger" role="alert">${param.message}</div>
            <% }%>
            <form action="${pageContext.request.contextPath}/LoginDifusor" method="POST" >
                <div class="form-group">
                    <label for="InputNombreDifusor">Nombre Difusor</label>
                    <input type="text" class="form-control" name="InputNombreDifusor" id="NombreDifusor" placeholder="Ingrese Nombre Difusor" required="">
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
