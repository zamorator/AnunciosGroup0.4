<%-- 
    Document   : registro_administrador
    Created on : 16-may-2015, 11:46:01
    Author     : Javoru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<script src="http://code.jquery.com/jquery-latest.js"></script>-->
        <script src="js/jquery-min.js"></script>
        <script src="js/main.js"></script>
        
        <script src="js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/Estilos_ag.css">
       
        <title>Registro Administrador</title>
    </head>
    <body>
        
        
        
        <div class="contenido" id="registro">
            <% if (request.getParameter("message") != null) {%>
            <div class="alert alert-danger" role="alert">${param.message}</div>
            <% }%>
            
        <form action="${pageContext.request.contextPath}/LoginAdministrador" method="POST">
            
            <!-- <input type="text" name="txtapellido">  -->
            <!-- <button type="submit">Enviar</button> -->
            <div class="contenido" id="registro_panel">
                            <div class="form-group">
                                <label for="InputNombreUAdministrador">Nombre Usuario Administrador</label>
                                <input type="text" class="form-control" name="InputNombreUAdministrador" id="NombreUAdministrador" placeholder="Ingrese Nombre Usuario" required="">
                            </div>
                            <div class="form-group">
                                <label for="InputNombres">Nombre Administrador</label>
                                <input type="text" class="form-control" name="InputNombre" id="Nombres" placeholder="Ingrese Nombres Admin" required="">
                            </div>
                            <div class="form-group">
                                <label for="InputApellidoPaterno">Apellido Paterno Admin</label>
                                <input type="text" class="form-control" name="InputApellidoPaterno" id="ApellidoPaterno" placeholder="Ingrese Apellido Paterno" required="">
                            </div>
                            <div class="form-group">
                                <label for="InputApellidoMaterno">Apellido Materno Admin</label>
                                <input type="text" class="form-control" name="InputApellidoMaterno" id="ApellidoMaterno" placeholder="Ingrese Apellido Materno" required="">
                            </div>
                            <div class="form-group">
                                <label for="InputEmail">E-mail</label>
                                <input type="email" class="form-control" name="InputEmail" id="Email" placeholder="Ingrese Correo Electrónico" required="">
                            </div>
                            <div class="form-group">
                                 <label for="InputPassword">Contraseña</label>
                                 <input type="password" class="form-control" name="InputPassword" id="password" placeholder="Ingrese Contraseña" required="">
                            </div>
                            <div class="form-group">
                                <label for="InputPassword">Repita Contraseña</label>
                                <input type="password" class="form-control" name="InputPassword2" id="password2" placeholder="Repita Contraseña" required="">
                            </div>
                
                <button class="btn btn-default" type="submit" >Registro</button>
                
                <%@include file="base_ag/_pie_pagina.jsp" %>
            
        </form>
    </body>
</html>
