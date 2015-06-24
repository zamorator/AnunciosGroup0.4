<%-- 
    Document   : editar_anuncio
    Created on : 14-06-2015, 09:48:55 AM
    Author     : zamorator <zamorator@gmail.com>
--%>

<%@page import="cl.inacap.model.ValorAnuncio"%>
<%@page import="cl.inacap.dao.anunciante.AnuncioDAO"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page import="cl.inacap.dao.segmentos.SegmentoEdadDAO"%>
<%@page import="cl.inacap.model.SegmentoEdad"%>
<%@page import="cl.inacap.model.SegmentoSexo"%>
<%@page import="cl.inacap.dao.segmentos.SegmentoSexoDAO"%>
<%@page import="cl.inacap.model.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="cl.inacap.dao.categoria.CategoriaDAO"%>
<%@page import="cl.inacap.model.Giro"%>
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
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Anunciante</title>

        <%
            Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
            Giro giro = (Giro) session.getAttribute("giro");
            CategoriaDAO categoriaDao = new CategoriaDAO();
            List<Categoria> categorias = categoriaDao.BuscarCategorias();
            SegmentoSexoDAO segmentosexoDao = new SegmentoSexoDAO();
            List<SegmentoSexo> segmentoSexos = segmentosexoDao.BuscarSegmentoSexo();
            SegmentoEdadDAO segmentoedadDao = new SegmentoEdadDAO();
            List<SegmentoEdad> segmentoEdades = segmentoedadDao.BuscarSegmentoEdades();

            AnuncioDAO anuncioDAO = new AnuncioDAO();
            Anuncio anuncio = new Anuncio();
            anuncio = anuncioDAO.buscarAnuncioPorId(Integer.parseInt(request.getParameter("anuncio_id")));
            ValorAnuncio valorAnuncio = anuncioDAO.buscarValorAnuncioPorAnuncio(anuncio.getCodigo_anuncio());
        %>
    </head>

    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp"%> 
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group"style="padding-top: 10%;">
            <li role="presentation" class="active"><a href="#">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="enviar_mensaje.jsp">Ayuda</a></li>
        </ul>
        <div id="panel">  
            
                <ul class="nav nav-tabs ">
                    <li role="submenu"><a href="mis_anuncios.jsp">Mis Anuncios</a></li>
                    <li role="submenu"><a href="agregar_anuncio.jsp">Agregar Anuncio</a></li>
                    <li role="submenu" class="active"><a href="#">Editar Anuncio</a></li>
                </ul>
          

            <div class="contenido" >
                <form method="POST" action="${pageContext.request.contextPath}/EditarAnuncio">
                    <div id="direccionAnunciante" class="panel panel-default margen"> 
                        <div class="panel-heading">
                            <h3 class="panel-title">Información Anuncio</h3>
                        </div>
                        <div class="form-group margen">
                            <input type="text" value="<%= anuncio.getCodigo_anuncio()%>" hidden="" name="InputCodigoAnuncio">
                            <label for="InputNombreAnuncio">Nombre Anuncio</label>
                            <input required="" type="text" class="form-control" name="InputNombreAnuncio" id="InputNombreAnuncio" value="<%= anuncio.getNombre_anuncio()%>">
                        </div>
                        <div class="form-group margen">
                            <label for="InputDescripcionAnuncio">Descripci&oacute;n Anuncio</label>
                            <textarea required="" class="form-control"  name="InputDescripcionAnuncio" id="InputDescripcionAnuncio" ><%= anuncio.getDescripcion_anuncio()%></textarea>
                        </div>
                        <div class="form-group margen" >
                            <label for="selectCategoria">Categor&iacute;a Anuncio</label>
                            <select required="" class="form-control" name="selectCategoria" id="selectCategoria" >
                                <option value="" selected="selected" >Seleccione categoria</option>
                                <% for (Categoria c : categorias) {%>
                                <% if (c.getId_categoria() == anuncio.getId_categoria()) {%>
                                <option selected="" value="<%= c.getId_categoria()%>"><%= c.getNombre_categoria()%></option>
                                <% } else {%>
                                <option value="<%= c.getId_categoria()%>"><%= c.getNombre_categoria()%></option>
                                <% }%>
                                <% }%>
                            </select>
                        </div>

                    </div>
                    <div id="direccionAnunciante" class="panel panel-default margen"> 
                        <div class="panel-heading">
                            <h3 class="panel-title">Preferencias Anuncio</h3>
                        </div>
                        <div class="form-group margen" >
                            <select required="" class="form-control" name="selectSegmentoSexo" id="selectSegmentoSexo" >
                                <option value="" selected="selected" >Seleccione sexo</option>
                                <% for (SegmentoSexo ss : segmentoSexos) {%>
                                <% if (ss.getId_segmento_sexo() == anuncio.getId_segmento_sexo()) {%>
                                <option selected="" value="<%= ss.getId_segmento_sexo()%>"><%= ss.getSegmento_sexo()%></option>
                                <%} else {%>
                                <option value="<%= ss.getId_segmento_sexo()%>"><%= ss.getSegmento_sexo()%></option>
                                <% }%>
                                <% }%>
                            </select>
                        </div>
                        <div class="form-group margen" >
                            <select required="" class="form-control" name="selectSegmentoEdad" id="selectSegmentoEdad" >
                                <option value="" selected="selected" >Seleccione segmento edad</option>
                                <% for (SegmentoEdad se : segmentoEdades) {%>
                                <% if (se.getId_segmento_edad() == anuncio.getId_segmento_edad()) {%>
                                <option selected="" value="<%= se.getId_segmento_edad()%>"><%= se.getSegmento_edad()%></option>
                                <% } else {%>
                                <option value="<%= se.getId_segmento_edad()%>"><%= se.getSegmento_edad()%></option>
                                <% }%>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div id="direccionAnunciante" class="panel panel-default margen"> 
                        <div class="panel-heading">
                            <h3 class="panel-title">Publicidad del Anuncio</h3>
                        </div> 
                        <div class="form-group margen">
                            <label for="InputCantidadCupones">Cantidad de cupones</label> 
                            <input type="number" name="InputCantidadCupones" required="" id="CantidadCupones" value="<%= anuncio.getCantidad_cupones()%>">
                        </div>
                        <label for="InputPorcentajeDescuento">Porcentaje de Descuento</label> 
                        <div style="margin-left: 3%;" class=" form-group radio" >
                            <% for (int i = 2; i <= 15; i++) { %>
                            <% if (i * 5 == anuncio.getPorcentaje_descuento()) {%>
                            <input  checked="" type="radio" name="porcentajeDescueto" value="<%= i * 5%>"> <%=i * 5%>%<br>
                            <%} else {%>
                            <input type="radio" name="porcentajeDescueto" value="<%= i * 5%>"> <%=i * 5%>%<br>
                            <%} %>
                            <%}%>
                        </div>
                        <div style="margin-left: 3%;"class="form-group">
                            <label for="InputValor">Valor Anuncio</label> 
                            <input type="number" name="InputValorReal" required="" value="<%= valorAnuncio.getValor_real() %>">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                </form>
            </div>

        </div>


        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
