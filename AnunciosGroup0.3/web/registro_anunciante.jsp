<%-- 
    Document   : registro_anunciante
    Created on : 01-05-2015, 11:27:12
    Author     : zamorator
--%>

<%@page import="cl.inacap.model.Provincia"%>
<%@page import="cl.inacap.model.Comuna"%>
<%@page import="cl.inacap.dao.anunciante.RegionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.inacap.model.Region"%>
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
        <title>Registro Anunciante</title>
    </head>
    <body>
        <script>

        </script>
        <%
            RegionDAO regionesDao = new RegionDAO();
            ArrayList<Region> regiones = regionesDao.BuscarRegiones();
            ArrayList<Comuna> comunas = new ArrayList<Comuna>();
        %>
        <div class="contenido">
            <% if (request.getParameter("message") != null) {%>
            <div class="alert alert-danger" role="alert">${param.message}</div>
            <% }%>
            <form method="POST" action="${pageContext.request.contextPath}/RegistroAnunciante">
                <div class="form-group">
                    <label for="InputNombreUAnunciante">Nombre Usuario Anunciante</label>
                    <input type="text" class="form-control" name="InputNombreUAnunciante" id="NombreUAnunciante" placeholder="Ingrese Nombre Anunciante" required="">
                </div>
                <div class="form-group">
                    <label for="InputNombreAnunciante">Nombre Empresa</label>
                    <input type="text" class="form-control" name="InputNombreAnunciante" id="NombreAnunciante" placeholder="Ingrese Nombre de su Empresa" required="">
                </div>
                <div class="form-group">
                    <label for="InputDireccionAnunciante">Direccion</label>
                    <input type="text" class="form-control" name="InputDireccionAnunciante" id="DireccionAnunciante" placeholder="Ingrese Dirección" required="">
                </div>
                <div class="form-group">
                    <label for="InputRegion">Región</label>
                    <select class="form-control" onchange="this.form.submit()" name="select-one" id="select-one" >
                        <% for (Region r : regiones) {%>
                        <option value="<%= r.getRegion_id()%>"><%= r.getNombre_region()%></option>
                        <% }%>
                    </select>
                </div>
                <div class="form-group">
                    <label for="InputComuna">Provincia</label>
                    <select class="form-control"  name="selectComuna" id="select-two" >
                        <% for (Provincia p: provincia) { %>
                        <option value="<%= p.get_Id_ %>"><%= c.getNombre_comuna()%>"></option>
                        <% }%>
                    </select>                    
                </div>
                <div class="form-group">
                    <label for="InputComuna">Comuna</label>
                    <select class="form-control"  name="selectComuna" id="select-two" >
                        <% for (Comuna c: comunas) { %>
                        <option value="<%= c.getId_comuna() %>"><%= c.getNombre_comuna()%>"></option>
                        <% }%>
                    </select>                    
                </div>
                <div class="form-group">
                    <label for="InputPassword">Contraseña</label>
                    <input type="password" class="form-control" name="InputPassword" id="password" placeholder="Ingrese Contraseña" required="">
                </div>
                <div class="form-group">
                    <label for="InputPassword">Repita Contraseña</label>
                    <input type="password" class="form-control" name="InputPassword2" id="password2" placeholder="Ingrese Contraseña" required="">
                </div>
                <button class="btn btn-default" type="submit" >Registro</button>
            </form>
        </div>
        <%@include file="base_ag/_pie_pagina.jsp" %>
    </body>
</html>
