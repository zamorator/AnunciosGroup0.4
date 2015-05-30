<%-- 
    Document   : agregar_anuncio
    Created on : 11-04-2015, 12:21:24
    Author     : dzamoraf
--%>

<%@page import="cl.inacap.model.SegmentoEdad"%>
<%@page import="cl.inacap.dao.segmentos.SegmentoEdadDAO"%>
<%@page import="cl.inacap.model.SegmentoSexo"%>
<%@page import="cl.inacap.dao.segmentos.SegmentoSexoDAO"%>
<%@page import="cl.inacap.dao.categoria.CategoriaDAO"%>
<%@page import="cl.inacap.model.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.inacap.model.Anunciante"%>
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
        <%
            Anunciante anunciante;
            HttpSession session_actual = request.getSession();
            anunciante = (Anunciante) session.getAttribute("anunciante");
            CategoriaDAO categoriaDao = new CategoriaDAO();
            List<Categoria> categorias = categoriaDao.BuscarCategorias();
            SegmentoSexoDAO segmentosexoDao = new SegmentoSexoDAO();
            List<SegmentoSexo> segmentoSexos = segmentosexoDao.BuscarSegmentoSexo();
            SegmentoEdadDAO segmentoedadDao = new SegmentoEdadDAO();
            List<SegmentoEdad> segmentoEdades = segmentoedadDao.BuscarSegmentoEdades();
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp" %> 

        <ul class="nav nav-pills nav-justified menu_anunciante" role="group">
            <li role="presentation" class="active"><a href="#">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="enviar_mensaje.jsp">Ayuda</a></li>
        </ul>

        <div id="contenido" class="submenu"> 
            <div id="submenu" class="links_submenu">
                <ul class="nav nav-tabs nav-justified">
                    <li role="submenu"><a href="mis_anuncios.jsp">Mis Anuncios</a></li>
                    <li role="submenu" class="active"><a href="#">Agregar Anuncio</a></li>
                </ul>
            </div>
            <div id="agregar_anuncio" class="contenido">
                <form method="POST" action="${pageContext.request.contextPath}/AgregarAnuncio">
                    <div class="form-group">
                        <label for="InputNombreAnuncio">Nombre Anuncio</label>
                        <input type="text" class="form-control" name="InputNombreAnuncio" id="InputNombreAnuncio" placeholder="Ingrese Nombre Anuncio">
                    </div>
                    <div class="form-group">
                        <label for="InputDescripcionAnuncio">Descripci&oacute;n Anuncio</label>
                        <input type="text" class="form-control" name="InputDescripcionAnuncio" id="InputDescripcionAnuncio" placeholder="Ingrese Descripci&oacute;n del Anuncio">
                    </div>
                    <div class="form-group" >
                        <select class="form-control" name="selectCategoria" id="selectCategoria" >
                            <option value="" selected="selected" >Seleccione categoria</option>
                            <% for (Categoria c : categorias) {%>
                            <option value="<%= c.getId_categoria()%>"><%= c.getNombre_categoria()%></option>
                            <% }%>
                        </select>
                    </div>
                    <div class="form-group" >
                        <select class="form-control" name="selectSegmentoSexo" id="selectSegmentoSexo" >
                            <option value="" selected="selected" >Seleccione sexo</option>
                            <% for (SegmentoSexo ss : segmentoSexos) {%>
                            <option value="<%= ss.getId_segmento_sexo()%>"><%= ss.getSegmento_sexo()%></option>
                            <% }%>
                        </select>
                    </div>
                    <div class="form-group" >
                        <select class="form-control" name="selectSegmentoEdad" id="selectSegmentoEdad" >
                            <option value="" selected="selected" >Seleccione segmento edad</option>
                            <% for (SegmentoEdad se : segmentoEdades) {%>
                            <option value="<%= se.getId_segmento_edad()%>"><%= se.getSegmento_edad()%></option>
                            <% }%>
                        </select>
                    </div>
                    cantidad cupones
                    porcentaje descuento

                    <button type="submit" class="btn btn-default">Agregar</button>
                </form>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
