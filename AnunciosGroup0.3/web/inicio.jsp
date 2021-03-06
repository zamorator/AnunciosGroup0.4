<%-- 
    Document   : inicio
    Created on : 11-jun-2015, 21:53:40
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
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/Estilos_ag.css">
        <title>AnunciosGroup</title>
    </head>
    <body>
        <%@include file="base_ag/_menu_general.jsp" %>
        <!-- Image Background Page Header -->
        <!-- Note: The background image is set within the business-casual.css file. -->
        <header class="business-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="tagline"></h1>
                    </div>
                </div>
            </div>
        </header>

        <!-- Page Content -->
        <div class="container">

            <hr>

            <div class="row">
                <div class="col-sm-7">
                    <h2>¿Qu&eacute; es AnunciosGroup?</h2>
                    <p>Una nueva e innovadora forma de difundir publicidad a través de internet, el objetivo es que tanto la empresas como los usuarios interactúen entre s&iacute;, para que ambos obtengan beneficios.</p>
                    <p>En <b>AnunciosGroup</b> los usuarios podran acumular <b>Coins</b> a medida que comparten los anuncios de las empresas o <b>Anunciantes</b>.</p>
                    <p>Cada <b>Coin</b> acumulado en <b>AnunciosGroup</b> es un porcentaje de descuento que podrá ser canjeado por los diversos productos o servicios que se encuentren disponibles dentro de la plataforma de <b>AnunciosGroup</b>.</p> 
                    <p>Comparte, acumula <b>Coins</b> y canjea!</p>
                    <p>
                    </p>
                </div>
                <div class="col-sm-3" id="tesistas">
                    <img class="img-responsive  img-right" src="img/acumula_coin.png"  width="300px" height="400px" alt="">
                </div>
            </div>



            <!-- /.row -->

            <hr>
            <h2>Conoce m&aacute;s sobre AnunciosGroup</h2>
            </br>
            </br>
            <div class="row">
                <div class="col-sm-4" id="acceso_usuarios">
                    <a href="inicio_difusor.jsp"><img class="img-circle img-responsive img-center" src="img/usuarios.jpg" width="300px" height="400px" alt=""> </a>
                    <h2>Acceso Usuario</h2>
                    <p>Si tienes alguna red social estas listo para comenzar a juntar <b>Coins</b> y canjearlos por fabulosos descuentos. Accede ahora y comienza a acumular!</p>
                </div>
                <div class="col-sm-4" id="imagen2" >
                    <a href="inicio_anunciante.jsp"><img class="img-circle img-responsive img-center" src="img/empresas.jpg"  width="300px" height="400px" alt=""> </a>
                    <h2>Empresas Anunciantes</h2>
                    <p>Crea tus anuncios publicitarios de tus productos o servicios en <b>AnunciosGroup</b>, los que podr&aacute;n ser compartidos en las redes sociales por medio de los <b>Difusores</b>, Tus anuncios ser&aacute;n vistos por mucha gente y a un bajo costo. Accede para obtener m&aacute;s informaci&oacute;n. </p>
                </div>

            </div>
            <!-- /.row -->

            <hr>
            <h2>¿Qui&eacute;nes somos?</h2>
            </br>
            </br>
            <div class="row">
                <div class="col-sm-3">
                    <img class="img-circle img-responsive img-center" src="img/ruben.jpg" alt="" width="150px">
                    <h2>Ruben Quinteros</h2>
                    <p>Ingeniero en informatica de la Universidad tecnologica de Chile, CEO en AnunciosGroup, desarrollador y adicto a las bebidas energeticas.</p>
                </div>
                <div class="col-sm-3" id="tesistas">
                    <img class="img-circle img-responsive img-center" src="img/diego.jpg" width="150px" alt="">
                    <h2>Diego Zamora</h2>
                    <p>Ingeniero en informatica de la Universidad tecnologica de Chile, Cofundador en AnunciosGroup, desarrollador y coleccionador de comic.</p>
                </div>
                <div class="col-sm-3" id="tesistas">
                    <img class="img-circle img-responsive img-center" src="img/javier.jpg" width="150px" alt="">
                    <h2>Javier Castro</h2>
                    <p>Ingeniero en informatica de la Universidad tecnologica de Chile, Gerente de Finanzas, desarrollador y basquetbolista aficionado.</p>            </div>
            </div>




        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>  
        <%@include file="base_ag/_pie_pagina.jsp" %>   
    </body>
</html>
