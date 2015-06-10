<%-- 
    Document   : newjsp
    Created on : 04-04-2015, 17:07:59
    Author     : zamorator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/Estilos_ag.css">
        <title>AnunciosGroup</title>
    </head>
    <body>


        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header alto">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <span>
                            <img src="img/AG Logo03.jpg">
                        </span>
                        <!--
                        <span>
                            AnunciosGroup
                        </span>
                        -->
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right upright">
                        <a class="btn btn-primary" href="registro_difusor.jsp">Registro</a>
                        <a class="btn btn-primary" href="ingreso_difusor.jsp">Ingreso</a>
                    </ul> 
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>


        <% if (request.getParameter("message") != null) {%>
        <div class="alert alert-info" role="alert">${param.message}</div>
        <% }%>
        <div class="top3">
            <div id="myCarousel" class="carousel" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="img/slider3.jpg" align=center>
                    </div>

                    <div class="item">
                        <img src="img/slider1.jpg" height="800" align=center>
                    </div>

                    <div class="item">
                        <img src="img/slider2.jpg" height="800" align=center>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="contenido">
            <div class="row">
                <div class="col-md-8">

                    <div class="row">
                        <div class="col-md-8">
                            <h1>¿Qu&eacute; es AnunciosGroup?</h1>
                            <p class="lead">AnunciosGroup es una plataforma web que tiene como objetivo crear un nuevo canal de publicidad en internet, a un bajo costo y con alta penetración del mercado. Logrando incorporar anuncios publicitarios dentro de las redes sociales que usa la gente. </p>
                        </div>
                        <div class="col-md-4">
                            <img src="img/Logo1.png" height="200" width="200" align=center>
                        </div>
                    </div>



                    <h1>¿C&oacute;mo funciona para las empresas?</h1>
                    <p class="lead">Todas las empresas que deseen invertir en publicdad est&aacute;n invitadas a participar en AnunciosGroup. Podrán invertir en anuncios de productos o servicios de manera r&aacute;pida, bajo costo y alta penetraci&oacute;n de mercado, en AnciosGroup podr&aacute;n conseguir nuevos clientes.</p>

                    <h1>¿C&oacute;mo funciona para los difusores?</h1>
                    <p  class="lead">Ingresando a AnunciosGroup tendr&aacute;s un perfil que, a medida que vayas compartiendo anuncios en tus redes sociales podrás ir acumulando Coins, los que podr&aacute;s canjear por porcentajes de descuento en cualquier producto o servicio que est&eacute; en AnunciosGroup.</p>
                </div>
                <div class="col-md-4">

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3>Anunciante</h3>
                            <h4>Accede a AnunciosGroup</h4>
                            <a class="btn btn-primary" href="registro_anunciante.jsp">Registro Nuevo Anunciante</a>
                            <a class="btn btn-primary" href="ingreso_anunciante.jsp">Ingreso Anunciantes</a>
                            <p>Olvidaste tu usuario o contraseña | <a href="#">Reestablecer</a></p>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3>Siguenos en Twitter</h3>
                            <p>orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

                        </div>
                    </div>

                    <p>Administrador</p>
                    <a class="" href="registro_administrador.jsp">Registro Administrador</a> | 
                    <a class="" href="ingreso_administrador.jsp">Ingreso Administrador</a>
                </div>
            </div>



        </div>
        <br>
        <%@include file="base_ag/_pie_pagina.jsp" %>
    </body>
</html>

