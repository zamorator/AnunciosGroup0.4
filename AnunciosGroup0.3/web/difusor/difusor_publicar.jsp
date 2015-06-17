<%-- 
    Document   : difusor_publicar
    Created on : 02-jun-2015, 21:46:13
    Author     : macbookair
--%>

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
        <title>Publicar anuncio</title>
       
        <%
            HttpSession session_actual2 = request.getSession(true);
            Anuncio anuncio = (Anuncio) session_actual2.getAttribute("anuncio");
         %>
    </head>
    <body>
        
        
        <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.3&appId=428447157327741";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>     
        
        
        
        <%@include file="../base_ag/_menu_difusor.jsp" %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"><a href="difusor_inicio.jsp">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="#">Canjear</a></li>
        </ul>
        <div id="panel">
        <div id="panel_publicar">
            <h3><%= anuncio.getNombre_anuncio() %></h3>
            </br>
            <img id="img_publicar" src="../img/anuncios/<%= anuncio.getImagen_anuncio() %>">  
            </br>
            </br>
            <p><%= anuncio.getDescripcion_anuncio() %></p>
            
            <div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button_count"></div>
            <a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>   
       </div>
        <div id="panel_publicar_lateral">
            </br>
                <div class="row">
                    <div class="col-lg-10 col-lg-12">
                      <div class="thumbnail">
                          <img src="../img/anuncios/cupcake.jpeg" alt="...">
                        <div class="caption">
                            <h5>Otro anuncio</h5>
                          <p>Penes venudos</p>
                          <p><a href="#" class="btn btn-primary" role="button">Button</a> </p>
                        </div>
                      </div>
                    </div>
               </div>      
            </div>   
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>   
    </body>
</html>
