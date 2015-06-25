<%-- 
    Document   : registro_anunciante
    Created on : 01-05-2015, 11:27:12
    Author     : zamorator
--%>

<%@page import="cl.inacap.dao.giro.GiroCabeceraDAO"%>
<%@page import="cl.inacap.model.GiroCabecera"%>
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
        <script src="js/jquery-min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#selectRegion').change(function () {
                    $.get('TraerProvincias', {idregion: $(this).val()}, function (responseJson) {
                        var $select = $('#selectProvincia');
                        $select.find('option').remove();
                        $('<option>').val("").text("Seleccione Provincia").appendTo($select);
                        $.each(responseJson, function (key, value) {
                            $('<option>').val(key).text(value).appendTo($select);
                        });
                    });
                });
                $('#selectProvincia').change(function () {
                    $.get('TraerComunas', {idprovincia: $(this).val()}, function (responseJson) {
                        var $select = $('#selectComuna');
                        $select.find('option').remove();
                        $('<option>').val("").text("Seleccione Comuna").appendTo($select);
                        $.each(responseJson, function (key, value) {
                            $('<option>').val(key).text(value).appendTo($select);
                        });
                    });
                });
                $('#selectGiroCabecera').change(function () {
                    $.get('TraerGiroDetalle', {idGiroCabecera: $(this).val()}, function (responseJson) {
                        var $select = $('#selectGiroDetalle');
                        $select.find('option').remove();
                        $('<option>').val("").text("Seleccione Detalle Giro").appendTo($select);
                        $.each(responseJson, function (key, value) {
                            $('<option>').val(key).text(value).appendTo($select);
                        });
                    });
                });
                $('#selectGiroDetalle').change(function () {
                    $.get('TraerGiro', {idGiroDetalle: $(this).val()}, function (responseJson) {
                        var $select = $('#selectGiro');
                        $select.find('option').remove();
                        $('<option>').val("").text("Seleccione Giro").appendTo($select);
                        $.each(responseJson, function (key, value) {
                            $('<option>').val(key).text(value).appendTo($select);
                        });
                    });
                });
                
            });
        </script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/Estilos_ag.css">
        <title>Registro Anunciante</title>
    </head>
    <body>
     <%@include file="base_ag/_menu_general.jsp" %>
        <%
            RegionDAO regionesDao = new RegionDAO();
            ArrayList<Region> regiones = regionesDao.BuscarRegiones();
            GiroCabeceraDAO giroCabeceraDao = new GiroCabeceraDAO();
            ArrayList<GiroCabecera> giro_cabeceras = giroCabeceraDao.listCabeceraGiro();
        %>
        <div class="contenido" id="registro" style="padding-top: 10%;" >
            <ul class="nav nav-tabs">
                <li role="presentation" ><a href="inicio.jsp">Home</a></li>
            </ul>
            <% if (request.getParameter("message") != null) {%>
            <div class="alert alert-danger" role="alert">${param.message}</div>
            <% }%>
            <% if (request.getParameter("susses") != null) {%>
            <div class="alert alert-success" role="" >${param.susses}</div>
            <% }%>
            <div class="panel panel-primary ajustado">

                <div class="panel-heading">
                    <h3 class="panel-title">Registro Nuevo Anunciante</h3>
                </div>
                <form method="POST" action="${pageContext.request.contextPath}/RegistroAnunciante">
                    <div id="datosPersonalesAnunciante" class="panel panel-default margen" >
                        <div class="panel-heading">
                            <h3 class="panel-title">Datos Personales</h3>
                        </div>
                        <div class="form-group margen">
                            <label for="InputNombreUAnunciante">Nombre Usuario Anunciante</label>
                            <input type="text" class="form-control" name="InputNombreUAnunciante" id="NombreUAnunciante" placeholder="Ingrese Nombre Anunciante" required="">
                        </div>
                        <div class="form-group margen">
                            <label for="InputNombreAnunciante">Nombre Empresa</label>
                            <input type="text" class="form-control" name="InputNombreAnunciante" id="NombreAnunciante" placeholder="Ingrese Nombre de su Empresa" required="">
                        </div>
                        <div class="form-group margen">
                            <label for="InputEmailAnunciante">Email de contacto empresa</label>
                            <input type="email" class="form-control" name="InputEmailAnunciante" id="EmailAnunciante" placeholder="Ingrese Email de su Empresa" required="">
                        </div>
                    </div>
                    <div id="giroAnunciante" class="panel panel-default margen">
                        <div class="panel-heading">
                            <h3 class="panel-title">Giro</h3>
                        </div>
                        <div class="form-group margen">
                            <label for="selectGiroCabecera">Cabecera Giro</label>
                            <select class="form-control" name="selectGiroCabecera" id="selectGiroCabecera" >
                                <option value="" selected="selected" >Seleccione Cabecera Giro</option>
                                <% for (GiroCabecera gr : giro_cabeceras) {%>
                                    <option value="<%= gr.getGiro_cabecera() %>"><%= gr.getNombre_giro_cabecera() %></option>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group margen">
                            <label for="selectGiroDetalle">Detalle Giro</label>
                            <select class="form-control"  name="selectGiroDetalle" id="selectGiroDetalle"> 
                                <option value="" selected="selected">Seleccione Detalle Giro</option>
                            </select>                    
                        </div>
                        <div class="form-group margen">
                            <label for="selectGiro">Giro</label>
                            <select class="form-control"  name="selectGiro" id="selectGiro"> 
                                <option value="" selected="selected">Seleccione Giro</option>
                            </select>                    
                        </div>
                    </div>
                    <div id="direccionAnunciante" class="panel panel-default margen"> 
                        <div class="panel-heading">
                            <h3 class="panel-title">Direcci&oacute;n Anunciante</h3>
                        </div>
                        <div class="form-group margen">
                            <label for="InputDireccionAnunciante">Direccion</label>
                            <input type="text" class="form-control" name="InputDireccionAnunciante" id="DireccionAnunciante" placeholder="Ingrese Dirección" required="">
                        </div>
                        <div class="form-group margen">
                            <label for="InputRegion">Región</label>
                            <select class="form-control" name="selectRegion" id="selectRegion" >
                                <option value="" selected="selected" >Seleccione Region</option>
                                <% for (Region r : regiones) {%>
                                <option value="<%= r.getRegion_id()%>"><%= r.getNombre_region()%></option>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group margen">
                            <label for="InputProvincia">Provincia</label>
                            <select class="form-control"  name="selectProvincia" id="selectProvincia"> 
                                <option value="" selected="selected">Seleccione Provincia</option>
                            </select>                    
                        </div>
                        <div class="form-group margen">
                            <label for="InputComuna">Comuna</label>
                            <select class="form-control"  name="selectComuna" id="selectComuna"  required="" >
                                <option value="" selected="selected">Seleccione Comuna</option>
                            </select>                    
                        </div>
                    </div>
                    <div id="claveAnunciante" class="panel panel-default margen">
                        <div class="panel-heading">
                            <h3 class="panel-title">Clave Anunciante</h3>
                        </div>
                        <div class="form-group margen">
                            <label for="InputPassword">Contraseña</label>
                            <input type="password" class="form-control" name="InputPassword" id="password" placeholder="Ingrese Contraseña" required="">
                        </div>
                        <div class="form-group margen">
                            <label for="InputPassword">Repita Contraseña</label>
                            <input type="password" class="form-control" name="InputPassword2" id="password2" placeholder="Ingrese Contraseña" required="">
                        </div>
                        <button class="btn btn-default" type="submit" >Registro</button>
                        <a href="ingreso_anunciante.jsp" class="btn btn-default">Volver</a>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="base_ag/_pie_pagina.jsp" %>
    </body>
</html>
