<%-- 
    Document   : difusor_favorito
    Created on : 25-may-2015, 23:19:56
    Author     : macbookair
--%>

<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Favoritos difusor</title>
    </head>
    <body>
        <%@include file="../base_ag/_menu_difusor.jsp" %>
         <%
            ArrayList<Anuncio> anunciosfavoritos= null;
            String nombre_difusor = difusor.getNombre_u_difusor();
            
            try{
            anunciosfavoritos = new ArrayList<Anuncio>();
            
            DifusorAnunciosDAO anunciosDAO = new DifusorAnunciosDAO();
            anunciosfavoritos = anunciosDAO.buscaranunciofavortio(difusor);
            
            System.out.println(anunciosfavoritos);
            } catch(Exception e){
                e.printStackTrace();
            }
        %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation" class="active"><a href="#">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="#">Canjear</a></li>
        </ul>
        <div id="panel" class="container-fluid">
            <ul class="nav nav-tabs">
                <li role="presentation"><a href="difusor_inicio.jsp">Todos</a></li>
                <li role="presentation"class="active"><a href="difusor_favorito.jsp">Mis Anuncios</a></li>
            </ul>
            
                
                <div class="row">
                    <!-- SUGERIDOS inicio -->

                 <div class="col-md-12" >
                       <!--ANUNCIO 1 --> 
                       <% int id_modal2=0; %>
                        <% for (Anuncio b : anunciosfavoritos) {%>
                        <div class="col-sm-6 col-md-4">
                        <div class="thumbnail" id="anunciossugeridos">
                            <img class="img-responsive img-thumbnail" id="img_anuncios" src="${pageContext.request.contextPath}/images/anunciante/<%= b.getImagen_anuncio() %>" >
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
                            <form method="POST" action="${pageContext.request.contextPath}/PublicarCanjear">
                            <button type="button" class="btn btn-primary"  data-toggle="modal" onclick="VerificaPulbicarf(<%=b.getCodigo_anuncio()%>,'<%= difusor.getNombre_u_difusor() %>',<%= id_modal2%>)"data-target="#<%= id_modal2%>">Detalle</button>
                                <div class="modal fade" id="<%=id_modal2 %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                    <div class="modal-content">
                                         <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                             <h4 class="modal-title" id="myModalLabel"> <h3><%= b.getNombre_anuncio() %></h3></h4>
                                              <h6 style="color: red;">Al publicar un anuncio debera esperar 3 horas para que este se habilite nuevamente.</h6>
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
                                        <% if (b.getCantidad_cupones() > 0){ %>
                                                    <input type="submit" class="btn btn-default" name="canjear" value="Canjear (<%= b.getCantidad_cupones()  %>)">
                                        <% }else{%>
                                                    <input disabled="true" type="submit" class="btn btn-default" name="canjear" value="Sin cupones disponibles">
                                        <% } %>
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
                       
            
        </div>
        </div>               <script>
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
