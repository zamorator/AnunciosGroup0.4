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
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"><a href="difusor_inicio.jsp">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="#">Canjear</a></li>
        </ul>
        <div class="container" style="padding-top: 5%;" >

        <!-- Heading Row -->
        <div class="row">
            <div class="col-md-8">
                <img class="img-responsive img-rounded" src="${pageContext.request.contextPath}/images/anunciante/<%= anuncio.getImagen_anuncio() %>"   width="800px" height="250px"alt="">
                <input type="hidden" id="imagen" value="http://190.13.76.218:8080/${pageContext.request.contextPath}/images/anunciante/<%= anuncio.getImagen_anuncio() %>">
            </div>
            <!-- /.col-md-8 -->
            <div class="col-md-4">
                <h1><%= anuncio.getNombre_anuncio() %></h1>
                <p><%= anuncio.getDescripcion_anuncio() %></p>
                <input type="hidden" id="descripcion" value="<%= anuncio.getDescripcion_anuncio() %>">
                
                <a class="btn btn-primary btn-lg" href="#" id="share_button" style="text-decoration: none; margin-right: -4px; margin-left: -3px;">
			Publicar en Facebook
		</a>
                

            </div>
            <!-- /.col-md-4 -->
        </div>
        <!-- /.row -->

        <hr>

        <!-- Call to Action Well -->
        <div class="row">
            <div class="col-lg-12">
                <div class="well text-center">
                    Aqui hay otros anuncios que pueden ser de tu interes, no dudes en compartirlos!.
                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-4">
                <h2>Heading 1</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2>Heading 2</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-4 -->
            <div class="col-md-4">
                <h2>Heading 3</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe rem nisi accusamus error velit animi non ipsa placeat. Recusandae, suscipit, soluta quibusdam accusamus a veniam quaerat eveniet eligendi dolor consectetur.</p>
                <a class="btn btn-default" href="#">More Info</a>
            </div>
            <!-- /.col-md-4 -->
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
        
        <%@include file="../base_ag/_pie_pagina.jsp" %>   
    </body>
</html>
