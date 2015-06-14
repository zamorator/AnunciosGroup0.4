<%-- 
    Document   : perfil
    Created on : 18-05-2015, 06:31:44 PM
    Author     : zamorator <zamorator@gmail.com>
--%>

<%@page import="cl.inacap.model.GiroDetalle"%>
<%@page import="cl.inacap.dao.giro.GiroDetalleDAO"%>
<%@page import="cl.inacap.dao.anunciante.AnuncianteGiroDAO"%>
<%@page import="cl.inacap.model.AnuncianteGiro"%>
<%@page import="cl.inacap.model.Giro"%>
<%@page import="cl.inacap.dao.giro.GiroDAO"%>
<%@page import="cl.inacap.dao.giro.GiroCabeceraDAO"%>
<%@page import="cl.inacap.model.GiroCabecera"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.inacap.model.Region"%>
<%@page import="cl.inacap.model.Provincia"%>
<%@page import="cl.inacap.dao.anunciante.RegionDAO"%>
<%@page import="cl.inacap.dao.anunciante.ProvinciaDAO"%>
<%@page import="cl.inacap.model.Comuna"%>
<%@page import="cl.inacap.dao.anunciante.ComunaDAO"%>
<%@page import="cl.inacap.model.Anunciante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/jquery-min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#selectRegion').change(function () {
                    $.get('../TraerProvincias', {idregion: $(this).val()}, function (responseJson) {
                        var $select = $('#selectProvincia');
                        $select.find('option').remove();
                        $('<option>').val("").text("Seleccione Provincia").appendTo($select);
                        $.each(responseJson, function (key, value) {
                            $('<option>').val(key).text(value).appendTo($select);
                        });
                    });
                });
                $('#selectProvincia').change(function () {
                    $.get('../TraerComunas', {idprovincia: $(this).val()}, function (responseJson) {
                        var $select = $('#selectComuna');
                        $select.find('option').remove();
                        $('<option>').val("").text("Seleccione Comuna").appendTo($select);
                        $.each(responseJson, function (key, value) {
                            $('<option>').val(key).text(value).appendTo($select);
                        });
                    });
                });
                $('#selectGiroCabecera').change(function () {
                    $.get('../TraerGiroDetalle', {idGiroCabecera: $(this).val()}, function (responseJson) {
                        var $select = $('#selectGiroDetalle');
                        $select.find('option').remove();
                        $('<option>').val("").text("Seleccione Detalle Giro").appendTo($select);
                        $.each(responseJson, function (key, value) {
                            $('<option>').val(key).text(value).appendTo($select);
                        });
                    });
                });
                $('#selectGiroDetalle').change(function () {
                    $.get('../TraerGiro', {idGiroDetalle: $(this).val()}, function (responseJson) {
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
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Anunciante</title>
        <%
            Anunciante anunciante;
            anunciante = (Anunciante) session.getAttribute("anunciante");
            Giro giro = (Giro) session.getAttribute("giro");
            
            ComunaDAO comunaDao = new ComunaDAO();
            Comuna comuna = comunaDao.BuscaComuna(anunciante.getId_comuna());
            ProvinciaDAO provinciaDao = new ProvinciaDAO();
            Provincia provincia = provinciaDao.BuscaProvincia(comuna.getId_provincia());
            RegionDAO regionDao = new RegionDAO();
            Region region = regionDao.BuscarRegion(provincia.getRegion_id());
            
            AnuncianteGiroDAO agDao = new AnuncianteGiroDAO();
            AnuncianteGiro ag = agDao.buscaAnuncianteGiro(anunciante.getNombre_u_anunciante());
            GiroDAO giroDao = new GiroDAO();
            
            GiroDetalleDAO gdDao = new GiroDetalleDAO();
            GiroDetalle giroDetalle = gdDao.buscaGiroDetalle(giro.getId_giro_detalle());
            GiroCabeceraDAO gcDao = new GiroCabeceraDAO();
            GiroCabecera giroCabecera = gcDao.buscaGiroCabecera(giroDetalle.getId_giro_cabecera());
            

            ArrayList<Region> regiones = regionDao.BuscarRegiones();
            ArrayList<Provincia> provincias = provinciaDao.BuscarProvincias(region.getRegion_id());
            ArrayList<Comuna> comunas = comunaDao.BuscarComunas(provincia.getId_provincia());
            
            ArrayList<GiroCabecera> giroCabeceras = gcDao.listCabeceraGiro();
            ArrayList<GiroDetalle> giroDetalles = gdDao.listGiroDetalleByGiroCabecera(giroCabecera.getGiro_cabecera());
            ArrayList<Giro> giros = giroDao.listGiroByGiroDetalle(giroDetalle.getId_giro_detalle());
        %>
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
                    <h2>Mi Perfil</h2>
                    <div id="direccionAnunciante" class="panel panel-default margen"> 
                        <div class="panel-heading">
                            <h3 class="panel-title">Datos personales</h3>
                        </div>
                        <div class="form-group margen">
                            <label for="InputNombreAnunciante">Nombre Usuario Anunciante</label>
                            <input type="text" class="form-control" name="InputNombreUAnunciante" id="NombreUAnunciante" value="<%= anunciante.getNombre_u_anunciante()%>" readonly="">
                        </div>
                        <div class="form-group margen">
                            <label for="InputNombreAnunciante">Nombre Empresa</label>
                            <input type="text" class="form-control" name="InputNombreAnunciante" id="NombreAnunciante" value="<%= anunciante.getNombre_anunciante() %>" required="">
                        </div>
                        <div class="form-group margen">
                            <label for="InputEmailAnunciante">Email de contacto empresa</label>
                            <input type="email" class="form-control" name="InputEmailAnunciante" id="EmailAnunciante" value="<%= anunciante.getEmail_anunciante() %>" required="">
                        </div>
                    </div>
                    <div id="giroAnunciante" class="panel panel-default margen">
                        <div class="panel-heading">
                            <h3 class="panel-title">Giro</h3>
                        </div>
                        <div class="form-group margen">
                            <label for="selectGiroCabecera">Cabecera Giro</label>
                            <select class="form-control" name="selectGiroCabecera" id="selectGiroCabecera" >
                                <% for (GiroCabecera gr : giroCabeceras) {%>
                                    <% if( gr.getGiro_cabecera() == giroCabecera.getGiro_cabecera() ) {%>
                                        <option selected="" value="<%= gr.getGiro_cabecera()%>"><%= gr.getNombre_giro_cabecera()%></option>
                                    <% }else{ %>
                                        <option value="<%= gr.getGiro_cabecera()%>"><%= gr.getNombre_giro_cabecera()%></option>
                                    <% }%>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group margen">
                            <label for="selectGiroDetalle">Detalle Giro</label>
                            <select class="form-control"  name="selectGiroDetalle" id="selectGiroDetalle"> 
                                <option value="" selected="selected">Seleccione Detalle Giro</option>
                                <% for(GiroDetalle gd : giroDetalles) {%>
                                    <% if(gd.getId_giro_detalle() == giroDetalle.getId_giro_detalle()) {%>
                                        <option selected="" value="<%= gd.getId_giro_detalle()  %>"><%= gd.getNombre_giro_detalle()  %></option>
                                    <%} else { %>    
                                        <option value="<%= gd.getId_giro_detalle()  %>"><%= gd.getNombre_giro_detalle()  %></option>
                                    <% }%>    
                                <% }%>    
                            </select>                    
                        </div>
                        <div class="form-group margen">
                            <label for="selectGiro">Giro</label>
                            <select class="form-control"  name="selectGiro" id="selectGiro" required=""> 
                                <option value="" selected="selected">Seleccione Giro</option>
                                <% for(Giro g : giros) {%>
                                    <%if(g.getCodigo_giro() == giro.getCodigo_giro()) {%>
                                        <option selected="" value="<%= g.getCodigo_giro()  %>"><%= g.getDetalle()  %></option>
                                    <%}else{%>
                                        <option value="<%= g.getCodigo_giro()  %>"><%= g.getDetalle()  %></option> 
                                    <% }%> 
                                <% }%> 
                            </select>                    
                        </div>
                    </div>  
                    <div id="direccionAnunciante" class="panel panel-default margen"> 
                        <div class="panel-heading">
                            <h3 class="panel-title">Direcci&oacute;n Anunciante</h3>
                        </div>
                        <div class="form-group margen">
                            <label for="InputDireccionAnunciante">Direcc&oacute;n Anunciante</label>
                            <input type="text" class="form-control" name="InputDireccionAnunciante" id="DireccionAnunciante" value="<%= anunciante.getDireccion_anunciante()%>">

                            <label for="selectRegion">Región</label>
                            <select class="form-control" name="selectRegion" id="selectRegion" >
                                <% for (Region r : regiones) {%>
                                <%if (r.getRegion_id() == region.getRegion_id()) {%>
                                <option selected="selected" value="<%= r.getRegion_id()%>"><%= r.getNombre_region()%></option>
                                <%} else {%>
                                <option value="<%= r.getRegion_id()%>"><%= r.getNombre_region()%></option>
                                <% }%>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group margen">
                            <label for="SelectProvincia">Provincia</label>
                            <select class="form-control"  name="selectProvincia" id="selectProvincia"> 
                                <% for (Provincia p : provincias) {%>
                                <% if (p.getId_provincia() == provincia.getId_provincia()) {%>
                                <option value="<%=p.getId_provincia()%>" selected="selected"><%=p.getNombre_provincia()%></option>
                                <%} else {%>    
                                <option value="<%=p.getId_provincia()%>"><%=p.getNombre_provincia()%></option>
                                <%}%>
                                <%}%>    
                            </select>                    
                        </div>
                        <div class="form-group margen">
                            <label for="selectComuna">Comuna</label>
                            <select class="form-control"  name="selectComuna" id="selectComuna"  required="" >
                                <% for (Comuna c : comunas) {%>
                                <% if (c.getId_comuna() == comuna.getId_comuna()) {%>
                                <option selected="selected" value="<%= c.getId_comuna()%>"><%= c.getNombre_comuna()%></option>
                                <%} else {%>
                                <option value="<%= c.getId_comuna()%>"><%= c.getNombre_comuna()%></option>
                                <% }%>
                                <% }%>
                            </select>                    
                        </div>
                    </div>
                    <div id="direccionAnunciante" class="panel panel-default margen"> 
                        <div class="panel-heading">
                            <h3 class="panel-title">Seguridad</h3>
                        </div>
                        <div class="form-group margen">
                            <label for="InputPasswordAnunciante">Clave</label>
                            <input type="text" class="form-control" name="InputPasswordAnunciante" id="PasswordAnunciante" value="<%= anunciante.getPassword_anunciante()%>" >
                        </div>
                    </div>
                        <button class="btn btn-primary" type="submit">Actualizar</button>
                </div>
            </form>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
