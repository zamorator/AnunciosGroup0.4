<%-- 
    Document   : Admin_inicio
    Created on : 30-mar-2015, 19:00:17
    Author     : macbookair
--%>

<%@page import="cl.inacap.dao.administrador.AdministradorDAO"%>
<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/main.js"></script>
        <link rel="stylesheet" href="../css/cabecera_anunciante.css">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/modern-business.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        
        <title>Inicio Administrador</title>
    </head>
    
    <%
            ArrayList<Anuncio> anunciospendientes= null;
            
            
            try{
            anunciospendientes = new ArrayList<Anuncio>();
            
            AdministradorDAO anunciosDAO = new AdministradorDAO();
            anunciospendientes = anunciosDAO.buscaranuncioadministrador();
            
            System.out.println(anunciospendientes);
            } catch(Exception e){
                e.printStackTrace();
            }
        %>
    
    <body>
        <%@include file="../base_ag/_menu_administrador.jsp" %>    
    
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation" class="active"><a href="../administrador/admin_anuncios.jsp">Anuncios</a></li>
            <li role="presentation"><a href="../administrador/admin_empresas.jsp">Empresas</a></li>
            <li role="presentation"><a href="../administrador/admin_perfil.jsp">Perfil</a></li>
        </ul>
        
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Anuncios</a></li>
                
                
            </ul>
            
                    <div class="col-md-12" id="">
                       <!--ANUNCIO 1 --> 
                       <% int id_modal2=0; %>
                        <% for (Anuncio b : anunciospendientes) {%>
                        <div class="col-sm-6 col-md-4">
                        <div class="thumbnail" id="anuncios">
                            <img class="img-responsive" id="img_anuncios" src="../img/anuncios/<%= b.getImagen_anuncio() %>" >
                            <div class="caption">
                              <h3><%= b.getNombre_anuncio() %></h3>
                              
                             <!--VENTANA MODAL INICIO -->
                             <form method="POST" action="$(pageContext.request.context)/"
                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#<%= id_modal2%>">Detalle</button>
                                <div class="modal fade" id="<%=id_modal2 %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <input type="hidden" id="in_codigo_anuncio" value="<%= b.getCodigo_anuncio() %>" >
                                    <div class="modal-content">
                                         <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                             <h4 class="modal-title" id="myModalLabel"> <h3><%= b.getNombre_anuncio() %></h3></h4>
                                        </div>
                                        <div class="modal-body">
                                            <img class="img-responsive" src="../img/anuncios/<%= b.getImagen_anuncio() %>" >
                                            <p>Esta es una pequeña descripcion del anuncio.</p>
                     
                                           
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-success" data-dismiss="modal" type="submit">Aceptar</button>
                                            <button type="button" class="btn btn-danger">Rechazar</button>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            <!--VENTANA MODAL FIN -->
                              
                              
                            </div>
                        </div>
                        </div>
                        <%id_modal2++;}%>    
                    </div> 
            
        </div>
 
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
