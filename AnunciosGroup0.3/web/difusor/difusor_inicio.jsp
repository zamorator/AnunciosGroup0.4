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
        
        <input type="hidden" id="ruta" value="${pageContext.request.contextPath}" >
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation" class="active"><a href="#">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="#">Canjear</a></li>
        </ul>
        <div id="panel" class="container">
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
                            <img class="img-responsive img-thumbnail" id="img_anuncios"src="${pageContext.request.contextPath}/images/anunciante/<%= b.getImagen_anuncio() %>" >
                            <div class="caption">
                                
                                <% if(b.getNombre_anuncio().length() <= 23){ %>
                                    <h4><a href="#"><%= b.getNombre_anuncio() %></a>
                                </h4>
                                <%}else{%>
                               
                                    <h4><a href="#"><%= b.getNombre_anuncio().substring(0, 23) %> ...</a></h4>
                                <%}%>
                            <div class="ratings">
                                    <p class="pull-right" style="color: red;"> Hasta <%= b.getPorcentaje_descuento() %>% </p>
                                <p>
                                    <% if(b.getPorcentaje_descuento()  > 0 && b.getPorcentaje_descuento() <= 10) {%>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <%};%>
                                    <% if(b.getPorcentaje_descuento() > 10 && b.getPorcentaje_descuento() <=50) {%>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <%};%>
                                    <% if(b.getPorcentaje_descuento()   > 50 && b.getPorcentaje_descuento() <100) {%>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <%};%>
                                </p>
                            </div>
                             <h4 class="pull-right">$<%= b.getValor_real() %></h4>
                             <!--VENTANA MODAL INICIO -->
                            <form method="GET" action="${pageContext.request.contextPath}/PublicarCanjear">
                                <button type="button" class="btn btn-primary"   data-toggle="modal" onclick="VerificaPulbicarf(<%=b.getCodigo_anuncio()%>,'<%= difusor.getNombre_u_difusor() %>',<%= id_modal2%>)" data-target="#<%= id_modal2%>">Detalle</button>
                                <div class="modal fade" id="<%=id_modal2 %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                    <div class="modal-content">
                                         <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                             <h4 class="modal-title" id="myModalLabel"> <h3><%= b.getNombre_anuncio() %></h3></h4>
                                             <input type="hidden" name="codigoanuncio" value="<%= b.getCodigo_anuncio()%>">
                                        </div>
                                        <div class="modal-body">
                                            <img class="img-responsive img-thumbnail" id="img_anuncios" src="${pageContext.request.contextPath}/images/anunciante/<%= b.getImagen_anuncio() %>" >
                                            <p><%= b.getDescripcion_anuncio()%></p>
                                            <% 
                                                    String Favorito = "";
                                                    if(b.getFavorito() == 1){
                                                        Favorito = "checked";
                                                    };
                                                 %>
                                                 <input type="checkbox"  onclick="clickCheck(<%= b.getCodigo_anuncio() %>,' <%= nombre_difusor%>')" id ="favorito" <%= Favorito %> class="click"> Agregar a Favorito
                                        </div>
                                        <div class="modal-footer">
                                            <input type="submit" class="btn btn-default" name="canjear" value="Canjear">
                                            <button type="submit" class="btn btn-primary" id="publicarf<%= id_modal2 %>" name="publicar"value="Publicar"> Publicar</button>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                </form> 
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
                            <img class="img-responsive img-thumbnail" id="img_anuncios"  src="${pageContext.request.contextPath}/images/anunciante/<%= a.getImagen_anuncio() %>" >
                            <div class="caption">
                                
                                <% if(a.getNombre_anuncio().length() <= 23){ %>
                                    
                                    <h4><a href="#"><%= a.getNombre_anuncio() %></a>
                                </h4>
                                <%}else{%>
                                <h4><a href="#"><%= a.getNombre_anuncio().substring(0, 23) %> ...</a></h4>       
                                <%}%>
                                <div class="ratings">
                                    <p class="pull-right" style="color: red;"> Hasta <%= a.getPorcentaje_descuento() %>% </p>
                                <p>
                                    <% if(a.getPorcentaje_descuento()  > 0 && a.getPorcentaje_descuento() <= 10) {%>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <%};%>
                                    <% if(a.getPorcentaje_descuento() > 10 && a.getPorcentaje_descuento() <=50) {%>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <%};%>
                                    <% if(a.getPorcentaje_descuento()   > 50 && a.getPorcentaje_descuento() <100) {%>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <%};%>

                                </p>
                            </div>
                              <h4 class="pull-right">$<%= a.getValor_real() %></h4>
                             <!--VENTANA MODAL INICIO -->
                             <form method="POST" action="${pageContext.request.contextPath}/PublicarCanjear">
                                 <button type="button" class="btn btn-primary " data-toggle="modal" onclick="VerificaPulbicar(<%=a.getCodigo_anuncio()%>,'<%= difusor.getNombre_u_difusor() %>',<%=a.getCodigo_anuncio()%>)"  data-target="#<%= a.getCodigo_anuncio() %>">Detalle</button>
                                    <div class="modal fade"  id="<%=a.getCodigo_anuncio()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                        <div class="modal-content">
                                             <div class="modal-header">
                                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                 <h4 class="modal-title" id="myModalLabel"> <%= a.getNombre_anuncio() %></h4>
                                                 <input type="hidden" name="codigoanuncio" value="<%= a.getCodigo_anuncio()%>">
                                            </div>
                                            <div class="modal-body">
                                                <img class="img-responsive img-thumbnail" id="img_anuncios" src="${pageContext.request.contextPath}/images/anunciante/<%= a.getImagen_anuncio() %>" >
                                                <p><%= a.getDescripcion_anuncio()%></p>   
                                                 <% 
                                                    String Favorito = "";
                                                    if(a.getFavorito() == 1){
                                                        Favorito = "checked";
                                                    };
                                                 %>
                                                 <input type="checkbox"  onclick="clickCheck(<%= a.getCodigo_anuncio() %>,' <%= nombre_difusor%>')" id ="favorito" <%= Favorito %> class="click"> Agregar a Favorito
                                            </div>
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-default" name="canjear" value="Canjear">
                                                <button type="submit" class="btn btn-primary" id="publicar<%=a.getCodigo_anuncio()%>" name="publicar"value="Publicar"> Publicar</button>
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
                        <input type="hidden" id ="cantidadanuncios"value="<%= cantanucios%>">
                   
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
                        function VerificaPulbicar(codigo_anuncio,nombre_difusor,id_publicar){
                            console.log("Dentro VeriricaPublicar");
                            $.get(
                                "../VerificarPublicar",
                                {
                                in_codigo_anuncio: codigo_anuncio,
                                in_nombre_difusor: nombre_difusor
                                },
                                function(respuesta){
                                       console.log("Respueta verifica" + respuesta); 
                                    var res = JSON.parse(respuesta);   
                                       if (res  === "V"){
                                           console.log("V");
                                            $('#publicar'+id_publicar).prop('disabled',false);
                                       }else{
                                           console.log("F");
                                            $('#publicar'+id_publicar).prop('disabled',true);
                                       }
                                });  
                            
                        }
                        function VerificaPulbicarf(codigo_anuncio,nombre_difusor,id_publicar){
                            console.log("Dentro VeriricaPublicar");
                            $.get(
                                "../VerificarPublicar",
                                {
                                in_codigo_anuncio: codigo_anuncio,
                                in_nombre_difusor: nombre_difusor
                                },
                                function(respuesta){
                                       console.log("Respueta verifica" + respuesta); 
                                    var res = JSON.parse(respuesta);   
                                       if (res  === "V"){
                                           console.log("V");
                                            $('#publicarf'+id_publicar).prop('disabled',false);
                                       }else{
                                           console.log("F");
                                            $('#publicarf'+id_publicar).prop('disabled',true);
                                       }
                                });  
                            
                        }
                    </script>   
        <%@include file="../base_ag/_pie_pagina.jsp" %>    
    </body>
</html>
