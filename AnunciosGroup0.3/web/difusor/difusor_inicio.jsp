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
        <title>Difusor</title>
        
    </head>
    <body>
        <%@include file="../base_ag/_menu_difusor.jsp" %>
        <%
            ArrayList<Anuncio> anuncios= null;
            ArrayList<Anuncio> anunciossugeridos =null;
            String nombre_difusor = difusor.getNombre_u_difusor();
            try{
            anuncios = new ArrayList<Anuncio>();
            anunciossugeridos= new ArrayList<Anuncio>();
            
            DifusorAnunciosDAO anunciosDAO = new DifusorAnunciosDAO();
            anuncios = anunciosDAO.buscaranuncio(0,4,difusor.getNombre_u_difusor());  
            anunciossugeridos = anunciosDAO.buscaranunciosugerido(difusor);
            
            System.out.println(anuncios);
            } catch(Exception e){
                e.printStackTrace();
            }
        %>
        
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation" class="active"><a href="#">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="#">Canjear</a></li>
        </ul>
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Todos</a></li>
                <li role="presentation"><a href="difusor_favorito.jsp">Mis Anuncios</a></li>
            </ul>
            
            <div class="contenido" id="contenido_panel">
                
                <div class="row">
                    <!-- SUGERIDOS inicio -->

                 <div class="col-md-12" id="panel_sugeridos">
                       <!--ANUNCIO 1 --> 
                       <% int id_modal2=0; %>
                        <% for (Anuncio b : anunciossugeridos) {%>
                        <div class="col-sm-6 col-md-4">
                        <div class="thumbnail" id="anunciossugeridos">
                            <img class="img-responsive" src="../img/anuncios/<%= b.getImagen_anuncio() %>" >
                            <div class="caption">
                              <h4><%= b.getNombre_anuncio() %></h4>
                              
                             <!--VENTANA MODAL INICIO -->
                            <button type="button" class="btn btn-primary btn-lg"  data-toggle="modal" data-target="#<%= id_modal2%>">Detalle</button>
                                <div class="modal fade" id="<%=id_modal2 %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
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
                                            <button type="button"  class="btn btn-default" data-dismiss="modal" type="submit">Canejar</button>
                                            <button type="button" class="btn btn-primary">Publicar</button>
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
                    
                    <!-- SUGERIDOS fin -->
                    <!--<div class="col-sm-6 col-md-4">-->
                    <div class="col-md-12">
                       <!--ANUNCIO 1 --> 
                       <% int cantanucios= 0; %>
                        <% for (Anuncio a : anuncios) {%>
                    <div class="col-sm-6 col-md-4" id="desdeaqui<%= cantanucios  %>">
                        <div class="thumbnail" id="anuncios">
                            <img class="img-responsive" id="img_anuncios"  src="../img/anuncios/<%= a.getImagen_anuncio() %>" >
                            <div class="caption">
                              <h3><%= a.getNombre_anuncio() %></h3>
                              
                             <!--VENTANA MODAL INICIO -->
                             <form method="POST" action="${pageContext.request.contextPath}/PublicarCanjear">
                                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal"  data-target="#<%= a.getCodigo_anuncio() %>">Detalle</button>
                                    <div class="modal fade"  id="<%=a.getCodigo_anuncio()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                        <div class="modal-content">
                                             <div class="modal-header">
                                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                 <h4 class="modal-title" id="myModalLabel"> <h3><%= a.getNombre_anuncio() %></h3></h4>
                                                 <input type="hidden" name="codigoanuncio" value="<%= a.getCodigo_anuncio()%>">
                                            </div>
                                            <div class="modal-body">
                                                <img class="img-responsive" src="../img/anuncios/<%= a.getImagen_anuncio() %>" >
                                                <p>Esta es una pequeña descripcion del anuncio.</p>
                                                 <% 
                                                    String Favorito = "";
                                                     System.out.println(a.getFavorito() + "favorito");
                                                    if(a.getFavorito() == 1){
                                                        System.out.println(Favorito + "favorito2");
                                                        Favorito = "checked";
                                                    };
                                                 %>
                                                 <input type="checkbox"  onclick="clickCheck(<%= a.getCodigo_anuncio() %>,' <%= nombre_difusor%>')" id ="favorito" <%= Favorito %> class="click"> Agregar a Favorito
                                            </div>
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-default" name="canjear" data-dismiss="modal" value="Canjear">
                                                <input type="submit" class="btn btn-primary" name="publicar"value="Publicar">
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                               </form> 
                            <!--VENTANA MODAL FIN -->
                                </div>                          
                            </div>
                        </div>
                        <%cantanucios++;} ;System.out.println(cantanucios);%>    
                    </div>
                    <input type="text" id ="cantidadanuncios"value="<%= cantanucios%>">
                   
                </div>
                
            </div>
        </div>
                    
                    <script>
                        function clickCheck(codigo_anuncio,nombre_difusor){
                         console.log(codigo_anuncio);
                         console.log(nombre_difusor);

                          $.get(
                                "../AgregarFavorito",
                                {
                                in_codigo_anuncio: codigo_anuncio,
                                in_nombre_difusor: nombre_difusor 
                                },
                                function(respuesta){
                          console.log(respuesta);
                          $(this).checked = respuesta;
                          });  
                          }                    
                    </script>   
        <%@include file="../base_ag/_pie_pagina.jsp" %>    
    </body>
</html>
