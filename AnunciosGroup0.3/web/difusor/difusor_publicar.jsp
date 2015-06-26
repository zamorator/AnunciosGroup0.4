<%-- 
    Document   : difusor_publicar
    Created on : 02-jun-2015, 21:46:13
    Author     : macbookair
--%>

<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Publicar anuncio</title>
       
        <%
            HttpSession session_actual2 = request.getSession(true);
            Anuncio anuncio = (Anuncio) session_actual2.getAttribute("anuncio");
         %>
    </head>
    <body>
        <div id="fb-root"></div>
        
        <%@include file="../base_ag/_menu_difusor.jsp" %>
        <%
            ArrayList<Anuncio> anunciossugeridos =null;
            String nombre_difusor = difusor.getNombre_u_difusor();
             try{
         
            
            
            DifusorAnunciosDAO anunciosDAO = new DifusorAnunciosDAO();
        
            anunciossugeridos = anunciosDAO.buscaranunciosugerido(difusor);
            
           
            } catch(Exception e){
                e.printStackTrace();
            }
        %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"><a href="difusor_inicio.jsp">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="#">Canjear</a></li>
        </ul>
        <div class="container" style="padding-top: 5%;" >

        <!-- Heading Row -->
        <div class="row">
            <div class="col-md-8">
                <img class="img-responsive img-rounded img-thumbnail" src="${pageContext.request.contextPath}/images/anunciante/<%= anuncio.getImagen_anuncio() %>"   style="width:400px; height: 290px; " alt="">
                <input type="hidden" id="imagen" value="http://190.13.76.218:8080/${pageContext.request.contextPath}/images/anunciante/<%= anuncio.getImagen_anuncio() %>">
            </div>
            <!-- /.col-md-8 -->
            <div class="col-md-4">
                <h1><%= anuncio.getNombre_anuncio() %></h1>
                <p><%= anuncio.getDescripcion_anuncio() %></p>
                <input type="hidden" id="nombredifusor" value="<%= difusor.getNombre_u_difusor() %>">
                <input type="hidden" id="descripcion" value="<%= anuncio.getDescripcion_anuncio() %>">
                <input type="hidden" id="codigoanuncio" value="<%= anuncio.getCodigo_anuncio() %>">
                <div class="row col-md-12">  
                    <button class="btn btn-primary btn-lg" href="#" id="share_button"  value="Publicar en Facebook">Publicar en Facebook</button>
                </div>
             
                 <!-- <div class="row col-lg-12" style="margin-top: 3%;">  
                    <a class="btn btn-primary btn-lg" href="#" id="share_button" >Publicar en Twitter</a>
                </div>    --> 
            </div>
            
            <!-- /.col-md-4 -->
        </div>
        <!-- /.row -->

        <hr>

        <!-- Call to Action Well -->
        <% if (anunciossugeridos != null){%>
        <div class="row">
            <div class="col-lg-12">
                <div class="well text-center">
                    Aqui hay otros anuncios que pueden ser de tu interes, no dudes en compartirlos!.
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <% };%>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
                    <div class="col-md-12" id="panel_sugeridos">
                       <!--ANUNCIO 1 --> 
                       <% int id_modal2=0; %>
                        <% for (Anuncio b : anunciossugeridos) {%>
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
                            <form method="GET" action="${pageContext.request.contextPath}/PublicarCanjear">
                            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#<%= id_modal2%>">Detalle</button>
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
                        <%id_modal2++;}%>    
                    </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
<script type="text/javascript">
<!--
//nuevo face share btn
$(document).ready(function(){
	$('#share_button').click(function(e){          
		e.preventDefault();
		var url='http://190.13.76.218:8080/AnunciosGroup0.3/inicio.jsp';
		var titulo=$('#descripcion').val();
		var img = $('#imagen').val();
		FB.ui(
		{
			method: 'feed',
			name: titulo,
			link: url,
			picture: img,
			caption: 'AnunciosGroup, tu pagina de cupones.',
			description: 'Anunciosgroup.cl',
			message: 'asdasdasd'
		});
                        var nombre_difusor = $('#nombredifusor').val();
                        var codigo_anuncios = $('#codigoanuncio').val();
                        $.get(
                                "../AgregarCoin",
                                {
                                in_nombre_difusor: nombre_difusor,
                                in_codigo_anuncios: codigo_anuncios
                                },
                                function(respuesta){
                            $('#share_button').prop('disabled',true); 
                          });
			
	});
	
	
});






//-->
</script>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.3&appId=1596591600595494";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
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
