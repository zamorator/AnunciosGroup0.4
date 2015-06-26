<%-- 
    Document   : ingreso_administrador
    Created on : 01-jun-2015, 21:17:35
    Author     : Javoru
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
        <title>Ingreso Administrador</title>
    </head>
    <body>
         <%@include file="base_ag/_menu_general.jsp" %>
        
                <div class="contenido" id="ingreso">
            <ul class="nav nav-tabs">
                <li role="presentation" ><a href="inicio.jsp">Home</a></li>
            </ul>
            <% if (request.getParameter("message") != null) {%>
            <div class="alert alert-danger" role="alert">${param.message}</div>
            <% }%>
            <form action="${pageContext.request.contextPath}/LoginAdministrador" method="POST" >
                <div id="ingreso_datos">
                    <div class="form-group">
                        <label for="InputNombreUAdministrado">Administrador</label>
                        <input type="text" class="form-control" name="InputNombreUAdministrado" id="NombreAdministrador" placeholder="Ingrese Nombre Administrador" required="">
                    </div>
                    <div class="form-group">
                        <label for="InputPassword">Contraseña</label>
                        <input type="password" class="form-control" name="InputPassword" id="Password" placeholder="Ingrese Contraseña" required="">
                    </div>
                    <button class="btn btn-default" type="submit" >Ingreso</button>
                </div>
            </form>
        </div>
        <%@include file="base_ag/_pie_pagina.jsp" %>
        
    </body>
</html>
