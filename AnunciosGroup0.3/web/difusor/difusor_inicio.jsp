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
            DifusorAnunciosDAO anunciosDAO = new DifusorAnunciosDAO ();
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
                    <div class="col-sm-6 col-md-4">
                       <!--ANUNCIO 1 --> 
                       <% for (Anuncio a : anuncios) {%>
                      <div class="thumbnail" id="anuncios">
                          <img src="../img/anuncios/<%= a.getImagen_anuncio() %>" alt="...">
                        <div class="caption">
                            <h3><%= a.getNombre_anuncio() %></h3>
                          <p>Esta es una pequeña descripcion del anuncio.</p>
                          <p><a href="#" class="btn btn-primary" role="button">Detalle</a></p>
                        </div>
                      </div>
                        <%}%>
                    </div>
                    
                </div>
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>    
    </body>
</html>
