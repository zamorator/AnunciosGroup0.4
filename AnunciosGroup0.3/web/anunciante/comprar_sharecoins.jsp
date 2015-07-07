<%-- 
    Document   : comprar_sharecoins
    Created on : 04-06-2015, 08:17:10 PM
    Author     : zamorator <zamorator@gmail.com>
--%>

<%@page import="cl.inacap.model.Giro"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page import="cl.inacap.model.Anunciante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/jquery-min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <link rel="stylesheet" href="../css/bootstrap-nav-wizard.css">
        <script>
            $(document).ready(function () {
                $("#terminos").change(function () {
                    if ($("#terminos").is(':checked')) {
                        $("#btnSiguiente").removeAttr('disabled');
                    } else {
                        $("#btnSiguiente").attr('disabled', 'disabled');
                    }
                });
            });
        </script>
        <title>Anunciante</title>
        <% Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
            Giro giro = (Giro) session.getAttribute("giro");
            Anuncio anuncio = (Anuncio) session.getAttribute("anuncio");
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp" %> 

        <ul class="nav nav-pills nav-justified menu_anunciante" role="group"style="padding-top: 10%;">
            <li role="presentation" class="active"><a href="mis_anuncios.jsp">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="#">Ayuda</a></li>
        </ul>

        <div id="panel" > 
            <div id="submenu" class="links_submenu">
                <ul class="nav nav-tabs ">
                    <li role="submenu" class="active"><a href="mis_anuncios.jsp">Mis Anuncios</a></li>
                    <li role="submenu"><a href="#">Agregar Anuncio</a></li>
                    <li role="submenu"><a href="#">Editar Anuncio</a></li>
                </ul>
            </div>
            <div id="agregar_anuncio" class="contenido">
              <!--  <form method="post" action="${pageContext.request.contextPath}/ComprarShareCoinsPaso2"  > -->
                    <div class="workflow" >
                        <ul class="nav nav-wizard">

                            <li class='active'>Paso 1</li>

                            <li>Paso 2</li>

                           

                        </ul>
                    </div>

                    <div class="contenido_interior" >
                        <h3>
                            <%= anuncio.getNombre_anuncio()%>
                        </h3>

                        <div class="row">
                            <div class="col-md-6">
                                <img src="${pageContext.request.contextPath}/images/anunciante/<%= anuncio.getImagen_anuncio()%>" class="img-responsive">
                                <div class="detalle" >
                                    <p> <%= anuncio.getDescripcion_anuncio()%> </p>
                                </div>
                            </div>
                         <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                            <div class="col-md-6">
                                <div class="puntos" >
                                    <p>Seleccione la cantidad de dinero que desea invertir en anuncios, mientras más invierta mayor cantidad de sharecoins obtendrá.</p>
                                <!--    <input type="radio" name="group1" value="10"> $10.000 Equivalente a 125 ShareCoins<br>
                                    <input type="radio" name="group1" value="15" checked> $15.000 Equivalente a 200 ShareCoins<br>
                                    <input type="radio" name="group1" value="20"> $20.000 Equivalente a 300 ShareCoins<br> -->
                                
                               
                                        <input type="hidden" name="cmd" value="_s-xclick">
                                        <input type="hidden" name="hosted_button_id" value="S5NFCEXJBLV6L">
                                        <table>
                                        <tr><td><input type="hidden" name="on0" value=""></td></tr><tr><td><select name="os0">
                                                <option value="125 ShareCoin">125 ShareCoin $16,00 USD</option>
                                                <option value="200 ShareCoin">200 ShareCoin $24,00 USD</option>
                                                <option value="300 ShareCoin">300 ShareCoin $32,00 USD</option>
                                        </select> </td></tr>
                                        </table>
                                        <input type="hidden" name="currency_code" value="USD">
                                        
                                

                                </div>
                                <br>
                                <p><input type="checkbox" id="terminos" > Al comprar Sharecoins Acepto los <a href="#">términos y condiciones</a></p>    
                            </div>
                            <br>
                           <!-- <button type="submit" class="btn btn-primary" disabled="" id="btnSiguiente">Siguiente</button> -->
                            <br>
                           </br>
                           </br>
                           </br>
                           <input disabled="" id="btnSiguiente" type="image" src="https://www.paypalobjects.com/es_XC/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                            <img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">
                            </form>
                        </div>
                    </div>
              <!--  </form> -->
            </div>
        </div>                        
            <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
