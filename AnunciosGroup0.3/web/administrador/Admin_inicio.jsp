<%-- 
    Document   : Admin_inicio
    Created on : 30-mar-2015, 19:00:17
    Author     : macbookair
--%>

<%@page import="cl.inacap.model.Administrador"%>
<%@page import="cl.inacap.dao.administrador.AdministradorDAO"%>
<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/jquery-min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <script type ="text/javascript" src="../js/paginacion.js"></script>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Inicio Administrador</title>
    </head>

    <%
        Administrador administrador = (Administrador) session.getAttribute("administrador");

        ArrayList<Anuncio> anunciospendientes = null;

        try {
            anunciospendientes = new ArrayList<Anuncio>();

            AdministradorDAO anunciosDAO = new AdministradorDAO();
            anunciospendientes = anunciosDAO.buscaranuncioadministrador();

            System.out.println(anunciospendientes);
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <body>
        <%@include file="../base_ag/_menu_administrador.jsp" %>    

        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"class="active" ><a href="../administrador/Admin_inicio.jsp">Anuncios</a></li>
            <li role="presentation" ><a href="admin_empresas.jsp">Empresas</a></li>
            <li role="presentation"><a href="../administrador/admin_perfil.jsp">Perfil</a></li>
        </ul>
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Anuncios</a></li>
                <li role="presentation"><a href="admin_sharecoins.jsp">ShareCoins</a></li>

            </ul>

            <div class="col-md-12" id="">
                <!--ANUNCIO 1 --> 
                <% int id_modal2 = 0; %>
                <% for (Anuncio b : anunciospendientes) {%>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail" id="anuncios">

                        <% if (b.getNombre_anuncio().length() <= 23) {%>

                        <h4><%= b.getNombre_anuncio()%></h4>

                        <%} else {%>

                        <h4><%= b.getNombre_anuncio().substring(0, 23)%> ...</h4>

                        <%}%>
                        <img class="img-responsive img-thumbnail" id="img_anuncios" src="${pageContext.request.contextPath}/images/anunciante/<%= b.getImagen_anuncio()%>" >
                        <div class="caption">

                            <ul class="list-group">
                                <% if (b.getNombre_u_anunciante().length() <= 23) {%>
                                    <li class="list-group-item">
                                        <h5><%=b.getNombre_u_anunciante()%></h5>
                                    </li>
                                <%} else {%>
                                    <li class="list-group-item">
                                         <h5><%= b.getNombre_u_anunciante().substring(0, 23)%> ...</h5>
                                    </li>
                                <%}%>
                                <li class="list-group-item">
                                    <h5>Codigo anuncio: #<%=b.getCodigo_anuncio()%></h5>
                                </li>
                            </ul>

                            
                            
                            <!--VENTANA MODAL INICIO -->
                            <form action="${pageContext.request.contextPath}/ActualizarAnuncio" method="POST" >
                                <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#<%= id_modal2%>">Detalle</button>
                                <div class="modal fade" id="<%=id_modal2%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <input type="hidden" name="in_codigo_anuncio" value="<%= b.getCodigo_anuncio()%>" >
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel"> <h3><%= b.getNombre_anuncio()%></h3></h4>
                                            </div>
                                            <div class="modal-body">
                                                <img class="img-responsive img-thumbnail" id="img_anuncios" src="${pageContext.request.contextPath}/images/anunciante/<%= b.getImagen_anuncio()%>" >
                                                <p></p>
                                                <p> </p>
                                                <p></p>
                                                <p></p>
                                                <p></p>
                                                <ul class="list-group">
                                                    <li class="list-group-item">
                                                        <%= b.getDescripcion_anuncio()%>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="badge"><%= b.getEstado_anuncio()%></span>
                                                        Estado
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="badge">
                                                            <%= b.getCantidad_cupones()%>
                                                        </span>
                                                        Cantidad cupones
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="badge">
                                                            <%= b.getPorcentaje_descuento()%>%
                                                        </span>
                                                        Porcentaje Descuento 
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="badge">$<%= b.getValor_real()%></span>
                                                        Valor Anuncio
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="badge"><%= b.getSharecoin_pendientes()%></span>
                                                        ShareCoins pendientes:
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span class="badge"><%= b.getSharecoin_listos()%></span>
                                                        ShareCoins habilitados:
                                                    </li>
                                                </ul>      

                                            </div>
                                            <div class="modal-footer">
                                                <button  class="btn btn-success"  type="submit" name="aceptar">Aceptar</button>
                                                <button type="submit" class="btn btn-danger" name="rechazar">Rechazar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--VENTANA MODAL FIN -->
                            </form>

                        </div>
                    </div>
                </div>
                <%id_modal2++;
                    }%>    
            </div> 

        </div>

        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
