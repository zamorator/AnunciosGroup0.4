<%-- 
    Document   : inicio
    Created on : 28-03-2015, 9:42:25
    Author     : dzamoraf
--%>

<%@page import="cl.inacap.dao.anunciante.AnuncioDAO"%>
<%@page import="java.util.List"%>
<%@page import="cl.inacap.model.Anuncio"%>
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
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Anunciante</title>
        <%
            Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
            AnuncioDAO anuncioDao = new AnuncioDAO();
            List<Anuncio> anuncios = anuncioDao.BuscarAnunciosPorAnunciante(anunciante);
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
            <div id="submenu" class="links_submenu">
                <ul class="nav nav-tabs nav-justified">
                    <li role="submenu" class="active"><a href="#">Mis Anuncios</a></li>
                    <li role="submenu"><a href="agregar_anuncio.jsp">Agregar Anuncio</a></li>
                </ul>
            </div>
            <div id="mis_anuncios" class="contenido">
                <form action="${pageContext.request.contextPath}/CompraShareCoins" method="POST">
                    <div class="col-md-12">
                        <!--ANUNCIO 1 --> 
                        <% for (Anuncio a : anuncios) {%>
                        <div class="col-sm-6 col-md-4">
                            <div class="thumbnail" id="anuncios">
                                <% if (a.getEstado_anuncio().equals("F")) { %>
                                <p class="text-warning">Deshabilitado</p>
                                <% } else { %>
                                <p class="text-info">Habilitado</p>
                                <% }%>
                                <img class="img-responsive" src="../img/anuncios/<%= a.getImagen_anuncio()%>" >
                                <div class="caption">
                                    <h3><%= a.getNombre_anuncio()%></h3>

                                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#<%= a.getCodigo_anuncio()%>">Detalle</button>


                                    <!--VENTANA MODAL INICIO -->
                                    <div class="modal fade" id="<%=a.getCodigo_anuncio()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="myModalLabel"> <h3><%= a.getNombre_anuncio()%></h3></h4>
                                                </div>
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
                        <%}%>    
                    </div>
                </form>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
