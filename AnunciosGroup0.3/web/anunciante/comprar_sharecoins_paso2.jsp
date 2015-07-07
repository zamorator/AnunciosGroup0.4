<%-- 
    Document   : comprar_sharcoins_paso2
    Created on : 04-06-2015, 09:02:36 PM
    Author     : zamorator <zamorator@gmail.com>
--%>

<%@page import="cl.inacap.model.ShareCoin"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page import="cl.inacap.model.Giro"%>
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
        <title>Anunciante</title>
        <% Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
            System.out.println(anunciante);
            Anuncio anuncio = (Anuncio) session.getAttribute("anuncio");
            Giro giro = (Giro) session.getAttribute("giro");
             ShareCoin sharecoin  = (ShareCoin) session.getAttribute("shareCoins");
            System.out.println(giro);
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp" %> 

        <ul class="nav nav-pills nav-justified menu_anunciante" role="group"style="padding-top: 10%;">
            <li role="presentation" class="active"><a href="mis_anuncios.jsp">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="#">Ayuda</a></li>
        </ul>

        <div id="panel"> 
          <!--  <form method="post" action="${pageContext.request.contextPath}/ComprarShareCoinsPaso3"  >-->
            <div id="submenu" class="links_submenu">
                <ul class="nav nav-tabs ">
                    <li role="submenu" class="active"><a href="mis_anuncios.jsp">Mis Anuncios</a></li>
                    <li role="submenu"><a href="#">Agregar Anuncio</a></li>
                    <li role="submenu"><a href="#">Editar Anuncio</a></li>
                </ul>
            </div>
            <div id="agregar_anuncio" class="contenido">
                <ul class="nav nav-wizard">

                    <li>Paso 1</li>

                    <li class='active'>Paso 2</li>

                    <li>Paso 3</li>

                </ul>
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
                           
                        <div class="col-md-6">
                            <div class="puntos" >


                                <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                                    <input type="hidden" name="cmd" value="_s-xclick">
                                    <input type="hidden" name="hosted_button_id" value="TEEDAMVKV6CZY">
                                    <table>
                                        <tr><td><input  type="hidden" name="on0" value="Seleccione sus ShareCoins">Estos son tus ShareCoin Seleccionados</td></tr><tr><td><select  name="os0">
                                                    <% if (sharecoin.getCantidad_compartir() == 125){ %>
                                                        <option selected="" value="125 ShareCoin">125 ShareCoin $16,00 USD</option>
                                                    <% }else{%>
                                                        <option  value="125 ShareCoin">125 ShareCoin $16,00 USD</option>
                                                    <%} %>
                                                    <% if (sharecoin.getCantidad_compartir() == 200){ %>
                                                        <option selected="" value="200 ShareCoin">200 ShareCoin $24,00 USD</option>
                                                    <% }else{%>
                                                        <option  value="200 ShareCoin">200 ShareCoin $24,00 USD</option>
                                                    <%} %>
                                                    <% if (sharecoin.getCantidad_compartir() == 300){ %>
                                                        <option selected="" value="300 ShareCoin">300 ShareCoin $32,00 USD</option>
                                                    <% }else{%>
                                                       <option  value="300 ShareCoin">300 ShareCoin $32,00 USD</option> 
                                                    <%} %>
                                                </select> </td></tr>
                                        
                                    </table>
                                    </br>
                                    <input type="hidden" name="currency_code" value="USD">
                                    <input type="image" src="https://www.paypalobjects.com/es_XC/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                                    <img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">
                                    </br>
                                    </br>
                                    <input type="hidden" name="on1" value="El campo de texto"><input disabled="true" type="text" name="os1" value="Codigo: <%= anuncio.getCodigo_anuncio() %> , Nombre: <%= anuncio.getNombre_anuncio() %> " maxlength="200">
                                </form>




                            </div>
                            <br>
                            <!--<p><input type="checkbox" id="terminos" > Al comprar Sharecoins Acepto los <a href="#">términos y condiciones</a></p>     -->
                        </div>
                        <br>

                        <br>
                        </br>
                        </br>
                        </br>

                        </form>
                    </div>
                </div>    

            </div>
            <!-- </form> -->
        </div>

        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
