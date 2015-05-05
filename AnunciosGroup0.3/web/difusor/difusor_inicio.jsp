<%-- 
    Document   : difusor_inicio
    Created on : 28-abr-2015, 22:18:07
    Author     : macbookair
--%>


<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.inacap.model.Anuncio"%>
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
        <title>Difusor</title>
        
        <%
            ArrayList<Anuncio> anuncios= null;
            try{
            anuncios = new ArrayList<Anuncio>();
            DifusorAnunciosDAO anunciosDAO = new DifusorAnunciosDAO();
            anuncios = anunciosDAO.buscaranuncio();  
            System.out.println(anuncios);
            } catch(Exception e){
                e.printStackTrace();
            }
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_difusor.jsp" %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group">
            <li role="presentation" class="active"><a href="#">Inicio</a></li>
            <li role="presentation"><a href="#">Perfil</a></li>
            <li role="presentation"><a href="#">Canjear</a></li>
        </ul>
        <div id="panel_anuncios">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Todos</a></li>
                <li role="presentation"><a href="#">Mis Anuncios</a></li>
            </ul>
            
            <div class="contenido" id="contenido_panel_anuncios">
                
                <div class="row">
                    <!--<div class="col-sm-6 col-md-4">-->
                    <div class="col-md-12">
                       <!--ANUNCIO 1 --> 
                       <% int id_modal=0; %>
                        <% for (Anuncio a : anuncios) {%>
                        <div class="col-sm-6 col-md-4">
                        <div class="thumbnail" id="anuncios">
                            <img class="img-responsive" src="../img/anuncios/<%= a.getImagen_anuncio() %>" >
                            <div class="caption">
                              <h3><%= a.getNombre_anuncio() %></h3>
                              <p>Esta es una pequeña descripcion del anuncio.</p>
                             <!--VENTANA MODAL INICIO -->
                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#<%= id_modal%>">Detalle</button>
                                <div class="modal fade" id="<%=id_modal %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                    <div class="modal-content">
                                         <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                             <h4 class="modal-title" id="myModalLabel"> <h3><%= a.getNombre_anuncio() %></h3></h4>
                                        </div>
                                        <div class="modal-body">
                                            <img class="img-responsive" src="../img/anuncios/<%= a.getImagen_anuncio() %>" >
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Canejar</button>
                                            <button type="button" class="btn btn-primary">Publicar</button>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            <!--VENTANA MODAL FIN -->
                              
                              
                            </div>
                        </div>
                        </div>
                        <%id_modal++;}%>    
                    </div>
                </div>
                
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>    
    </body>
</html>
