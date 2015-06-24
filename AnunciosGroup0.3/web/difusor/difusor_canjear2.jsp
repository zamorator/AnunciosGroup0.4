<%-- 
    Document   : difusor_canjear2
    Created on : 21-jun-2015, 22:46:41
    Author     : macbookair
--%>

<%@page import="cl.inacap.model.Cupon"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
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
        <title>Canjear</title>
    </head>
    <%
        HttpSession session_actual2 = request.getSession(true);
        Anuncio anuncio = (Anuncio) session_actual2.getAttribute("anuncio");
        HttpSession session_actual3 = request.getSession(true);
        Cupon cupon = (Cupon) session_actual3.getAttribute("cupon");
    %>

    <body>
        <%@include file="../base_ag/_menu_difusor.jsp" %>
        <%
            DifusorAnunciosDAO difusoranunciosdao = new DifusorAnunciosDAO();
            int puntos = difusoranunciosdao.contartotalpuntos(difusor);
        %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"><a href="difusor_inicio.jsp">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation" class="active"><a href="#">Canjear</a></li>
        </ul>

        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Canjear</a></li>

            </ul>

            <div id="agregar_anuncio" class="contenido">
                <div class="workflow" >
                    <ul class="nav nav-wizard">
                        <li>Paso 1</li>
                        <li class='active'>Paso 2</li>
                        <li>Paso 3</li>
                    </ul>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-7">
                        <a href="#">
                            <img class="img-responsive" src="../img/anuncios/<%= anuncio.getImagen_anuncio()%>" width="500px" alt="">
                        </a>
                    </div>
                    <div class="col-md-5">
                        <input type="checkbox" id="terminos" onclick="ValidarCheck()" > Acepto terminos y condiciones.
                    </div>
                    <div class="col-md-5">

                    </div>
                </div>
                <hr>      
                <input type="button" class="btn btn-primary" src="difusor_canjear3.jsp" onclick="location.href = '../difusor/difusor_canjear3.jsp'" id="boton_input" disabled="true" value="Siguiente"> 
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %> 

        <script>
            /*        
             function ValidarCheck (){
             console.log("Hola mundo");
             console.log($('#terminos').prop('checked',true));
             //if ($('#terminos').prop('checked',true)){
             console.log($('#terminos').checked);
             $('#boton').prop('disabled',false);
             $('#boton_input').prop('disabled',false);
             //}else{   
             //$('#boton').prop('disabled',true);
             //};
             }
             */
            $(document).ready(function () {
                $("#terminos").change(function () {
                    if ($("#terminos").is(':checked')) {
                        $("#boton_input").removeAttr('disabled');
                    } else {
                        $("#boton_input").attr('disabled', 'disabled');
                    }
                });
            });
        </script>
    </body>
</html>
