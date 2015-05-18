<%-- 
    Document   : perfil
    Created on : 18-05-2015, 06:31:44 PM
    Author     : zamorator <zamorator@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Anunciante</title>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp" %>  
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group">
            <li role="presentation"><a href="mis_anuncios.jsp">Anuncios</a></li>
            <li role="presentation" class="active"><a href="#">Perfil</a></li>
            <li role="presentation"><a href="enviar_mensaje.jsp">Ayuda</a></li>
        </ul>
        <div id="mis_anuncios" class="contenido">
            <form method="POST" action="${pageContext.request.contextPath}/ActualizarAnunciante" >
                <div class="submenu">
                    <% if (request.getParameter("message") != null) {%>
                    <div class="label label-success" role="alert">${param.message}</div>
                    <% }%>
                    <h1>Perfil</h1>
                    <label for="InputNombreAnunciante">Nombre Usuario Anunciante</label>
                    <input type="text" class="form-control" name="InputNombreUAnunciante" id="NombreUAnunciante">
                    <label for="InputDireccionAnunciante">Direcc&oacute;n Anunciante</label>
                    <input type="text" class="form-control" name="InputDireccionAnunciante" id="DireccionAnunciante">
                    <label for="InputPasswordAnunciante">Clave</label>
                    <input type="text" class="form-control" name="InputPasswordAnunciante" id="PasswordAnunciante">
                    <label for="InputComunaAnunciante">Comuna</label>
                    <input type="text" class="form-control" name="InputComunaAnunciante" id="ComunaAnunciante">
                    <label for="InputGiroAnunciante">Giro</label>
                    <input type="text" class="form-control" name="InputGiroAnunciante" id="GiroAnunciante">
                </div>
                <button type="submit">Actualizar</button>
            </form>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
