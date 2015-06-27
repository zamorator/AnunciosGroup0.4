<%-- 
    Document   : inicio_difusor
    Created on : 11-jun-2015, 22:12:40
    Author     : macbookair
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
        <link rel="stylesheet" href="css/modern-business.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/Estilos_ag.css">
        <title>Inicio Difusor</title>
    </head>
    <body>
         <%@include file="base_ag/_menu_general.jsp" %>
        <!-- Header Carousel -->
        <header id="myCarousel" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div class="fill" style="background-image:url('img/comparte.jpg');"></div>
                    <div class="carousel-caption">
                        <h2>Comparte</h2>
                    </div>
                </div>
                <div class="item">
                    <div class="fill" style="background-image:url('img/acumula.jpg');"></div>
                    <div class="carousel-caption">
                        <h2>Acumula Coins</h2>
                    </div>
                </div>
                <div class="item">
                    <div class="fill" style="background-image:url('img/descuento.jpg');"></div>
                    <div class="carousel-caption">
                        <h2>Gana fabulosos descuentos</h2>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="icon-prev"></span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="icon-next"></span>
            </a>
        </header>

        <!-- Page Content -->
        <div class="container">

            <!-- Marketing Icons Section -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Bienvenido a AnunciosGroup
                    </h1>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4><i class="fa fa-fw fa-check"></i>¿Aun no sabes como funciona?</h4>
                        </div>
                        <div class="panel-body">
                            <p>Básicamente consiste en compartir distintos anuncios en tus redes sociales, cada ves que lo realices obtendrás, coins los cuales seran acumulables y equivaldrán a porcentajes de descuentos en los productos de la pagina. Comienza ya y obtén fabulosos descuentos.</p>
                            <a href="#" class="btn btn-default">Solicitar mas informacion</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4><i class="fa fa-fw fa-gift"></i>¿Ya estas registrado?</h4>
                        </div>
                        <div class="panel-body">
                            <p>¿Que esperas? Sigue compartiendo anuncios publicitarios e invita a tus amigos para que formen parte de <b>AnunciosGroup</b>, recuerda que es totalmente gratis y puedes obtener descuentos en todos los productos anunciados en la pagina.</p>
                            <a href="ingreso_difusor.jsp" class="btn btn-default">Iniciar sesion</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4><i class="fa fa-fw fa-compass"></i> Registrate</h4>
                        </div>
                        <div class="panel-body">
                            <p>¿Quieres comprar productos o servicios pero son demasiado caros? <b>AnunciosGroup</b> te ayuda entregándote descuentos los cuales son proporcionales a tu participación. Regístrate ahora y comienza a acumular coins y canjear descuentos fabulosos. </p>
                            <a href="registro_difusor.jsp" class="btn btn-default">Registrate</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('.carousel').carousel({
                interval: 5000 //changes the speed
            });
        </script>
        <%@include file="base_ag/_pie_pagina.jsp" %>  
    </body>

</html>
