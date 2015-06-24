<%-- 
    Document   : agregar_anuncio
    Created on : 11-04-2015, 12:21:24
    Author     : dzamoraf
--%>

<%@page import="cl.inacap.model.Giro"%>
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
        <script src="../js/jquery-min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/vendor/jquery.ui.widget.js"></script>
        <script src="../js/jquery.iframe-transport.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <script>
            $(function () {
                $('#fileupload').fileupload({
                    dataType: 'json',
                    done: function (e, data) {
                        $.each(data.result.files, function (index, file) {
                            $('<p/>').text(file.name).appendTo(document.body);
                        });
                    }
                });
            });
        </script>
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
                    <li role="submenu"><a href="#">Editar Anuncio</a></li>
                </ul>
            </div>
            <div id="agregar_anuncio" class="contenido">
                <% if (request.getParameter("message") != null) {%>
                <div class="label label-success" role="alert">${param.message}</div>
                <% }%>
                <form method="POST" action="${pageContext.request.contextPath}/AgregarAnuncio">
                    <div class="form-group">
                        <label for="InputNombreAnuncio">Nombre Anuncio</label>
                        <input required="" type="text" class="form-control" name="InputNombreAnuncio" id="InputNombreAnuncio" placeholder="Ingrese Nombre Anuncio">
                    </div>
                    <div class="form-group">
                        <label for="InputDescripcionAnuncio">Descripci&oacute;n Anuncio</label>
                        <textarea required="" class="form-control"  name="InputDescripcionAnuncio" id="InputDescripcionAnuncio" placeholder="Ingrese Descripci&oacute;n del Anuncio" ></textarea>
                    </div>
                    <div class="form-group" >
                        <select required="" class="form-control" name="selectCategoria" id="selectCategoria" >
                            <option value="" selected="selected" >Seleccione categoria</option>
                            <% for (Categoria c : categorias) {%>
                            <option value="<%= c.getId_categoria()%>"><%= c.getNombre_categoria()%></option>
                            <% }%>
                        </select>
                    </div>
                    <div class="form-group" >
                        <select required="" class="form-control" name="selectSegmentoSexo" id="selectSegmentoSexo" >
                            <option value="" selected="selected" >Seleccione sexo</option>
                            <% for (SegmentoSexo ss : segmentoSexos) {%>
                            <option value="<%= ss.getId_segmento_sexo()%>"><%= ss.getSegmento_sexo()%></option>
                            <% }%>
                        </select>
                    </div>
                    <div class="form-group" >
                        <select required="" class="form-control" name="selectSegmentoEdad" id="selectSegmentoEdad" >
                            <option value="" selected="selected" >Seleccione segmento edad</option>
                            <% for (SegmentoEdad se : segmentoEdades) {%>
                            <option value="<%= se.getId_segmento_edad()%>"><%= se.getSegmento_edad()%></option>
                            <% }%>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="InputCantidadCupones">Cantidad de cupones</label> 
                        <input type="number" name="InputCantidadCupones" required="" id="CantidadCupones">
                    </div>
                    <label for="InputPorcentajeDescuento">Porcentaje de Descuento</label> 
                    <div class=" form-group radio" >
                        <input type="radio" name="porcentajeDescueto" value="10"> 10%<br>
                        <input type="radio" name="porcentajeDescueto" value="15"> 15%<br>
                        <input type="radio" name="porcentajeDescueto" value="20"> 20%<br>
                        <input type="radio" name="porcentajeDescueto" value="25"> 25%<br>
                        <input type="radio" name="porcentajeDescueto" value="30"> 30%<br>
                        <input type="radio" name="porcentajeDescueto" value="35"> 35%<br>
                        <input type="radio" name="porcentajeDescueto" value="40"> 40%<br>
                        <input type="radio" name="porcentajeDescueto" value="45"> 45%<br>
                        <input type="radio" name="porcentajeDescueto" value="50"> 50%<br>
                        <input type="radio" name="porcentajeDescueto" value="55"> 55%<br>
                        <input type="radio" name="porcentajeDescueto" value="60"> 60%<br>
                        <input type="radio" name="porcentajeDescueto" value="65"> 65%<br>
                        <input type="radio" name="porcentajeDescueto" value="70"> 70%<br>
                        <input type="radio" checked="" name="porcentajeDescueto" value="75"> 75%
                    </div>
                    
                    <div class="form-group">
                        <label for="InputValor">Valor Anuncio</label> 
                        <input type="number" name="InputValorReal" required="" >
                    </div>

                    <button type="submit" class="btn btn-default">Agregar</button>
                </form>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
