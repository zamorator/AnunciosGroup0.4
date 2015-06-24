<%-- 
    Document   : inicio
    Created on : 28-03-2015, 9:42:25
    Author     : dzamoraf
--%>

<%@page import="cl.inacap.model.ValorAnuncio"%>
<%@page import="cl.inacap.model.Giro"%>
<%@page import="cl.inacap.dao.anunciante.AnuncioDAO"%>
<%@page import="java.util.List"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.inacap.model.Anunciante"%>
<%@page import="cl.inacap.utils.UploadFileUtils"%>
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
            AnuncioDAO anuncioDao = new AnuncioDAO();
            List<Anuncio> anuncios = anuncioDao.BuscarAnunciosPorAnunciante(anunciante);
            for(Anuncio a : anuncios){
                ValorAnuncio valor_anuncio =  anuncioDao.buscarValorAnuncioPorAnuncio(a.getCodigo_anuncio());
                a.setValor_real(valor_anuncio.getValor_real());
                a.setCantidadCompartirRealizados(anuncioDao.buscaCantidadCompartir(a));
                a.setCantidadCuponesCanjeados(anuncioDao.buscaCantidadCuponesCanjeados(a));
            }
            
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp"%>  
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group">
            <li role="presentation" class="active"><a href="#">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="enviar_mensaje.jsp">Ayuda</a></li>
        </ul>
        <div class="submenu">
            <% if (request.getParameter("message") != null) {%>
            <div class="label label-success" role="alert">${param.message}</div>
            <% }%>
            <ul class="nav nav-tabs nav-justified">
                <li role="submenu" class="active"><a href="#">Mis Anuncios</a></li>
                <li role="submenu"><a href="agregar_anuncio.jsp">Agregar Anuncio</a></li>
                <li role="submenu"><a href="#">Editar Anuncio</a></li>
            </ul>
            <div id="mis_anuncios" class="contenido">

                <div class="col-md-12">
                    <!--ANUNCIO 1 --> 
                    <% for (Anuncio a : anuncios) {%>
                    <form action="${pageContext.request.contextPath}/CompraShareCoins" method="POST">
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail" id="anuncios">
                                <% if (a.getEstado_anuncio().equals("F")) { %>
                                <p class="text-warning">Deshabilitado</p>
                                <% } else { %>
                                <p class="text-info">Habilitado</p>
                                <% }%>
                                <img class="img-responsive" id="img_anuncios" src="${pageContext.request.contextPath}/images/anunciante/<%= a.getImagen_anuncio()%>" >
                                <div class="caption">
                                    <h3><%= a.getNombre_anuncio()%></h3>

                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#<%= a.getCodigo_anuncio()%>">Detalle</button>
                                    <a class="btn btn-primary" href="editar_anuncio.jsp?anuncio_id=<%=a.getCodigo_anuncio()%>"> Editar </a>
                                    <a class="btn btn-primary" href="editar_imagenes_anuncio.jsp?anuncio_id=<%=a.getCodigo_anuncio()%>"> Editar Im&aacute;genes Anuncio </a>
                                    <!--VENTANA MODAL INICIO -->
                                    <div class="modal fade" id="<%=a.getCodigo_anuncio()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="myModalLabel"> <h3><%= a.getNombre_anuncio()%></h3></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <img class="img-responsive" src="${pageContext.request.contextPath}/images/anunciante/<%= a.getImagen_anuncio()%>" >
                                                    <p>Descripci&oacute;n: <%= a.getDescripcion_anuncio() %></p>
                                                    <p>Estado: <%= a.getEstado_anuncio() %></p>
                                                    <p>Cantidad cupones: <%= a.getCantidad_cupones() %></p>
                                                    <p>Cupones canjeados: <%= a.getCantidadCuponesCanjeados() %> </p>
                                                    <p>Compartir realizados: <%= a.getCantidadCompartirRealizados() %></p>
                                                    <p>Porcentaje Descuento: <%= a.getPorcentaje_descuento() %>%</p>
                                                    <p>Valor Anuncio: $<%= a.getValor_real() %></p>

                                                </div>
                                                <input type="hidden" name="codigoanuncio" value="<%= a.getCodigo_anuncio()%>">
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Eliminar</button>
                                                    <button type="submit" class="btn btn-primary" >Comprar ShareCoins</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--VENTANA MODAL FIN -->
                                </div>
                            </div>
                        </div>
                    </form>
                    <%}%>    
                </div>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
