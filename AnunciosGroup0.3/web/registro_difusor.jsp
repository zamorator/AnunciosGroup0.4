<%-- 
    Document   : registro_difusor
    Created on : 24-04-2015, 10:06:20
    Author     : zamorator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<script src="http://code.jquery.com/jquery-latest.js"></script>-->
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/Estilos_ag.css">
        <title>Registro Difusor</title>
    </head>
    <body>
        <%@include file="base_ag/_menu_general.jsp" %>
        <script>
            (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
          }(document, 'script', 'facebook-jssdk'));
        </script>      

        <div class="contenido" id="registro" style="padding-top: 10%;">
            <ul class="nav nav-tabs">
                <li role="presentation" ><a href="inicio.jsp">Home</a></li>
            </ul>
            <% if (request.getParameter("message") != null) {%>
            <div class="alert alert-danger" role="alert">${param.message}</div>
            <% }%>
            
               <div class="panel panel-primary ajustado">
                <div class="panel-heading">
                    <h3 class="panel-title">Registro Nuevo Usuario</h3>
                </div>
                    <form method="POST" action="${pageContext.request.contextPath}/RegistroDifusor_1">
                        <div class="row">
                            <div class="col-md-8">
                        <div class="contenido" id="registro_panel">
                            <div id="datosPersonalesAnunciante" class="panel panel-default margen"  >
                                <div class="panel-heading">
                                    <h3 class="panel-title">Datos Personales</h3>
                                </div>
                            <div class="form-group" style="padding: 2%;">
                                <label for="InputNombreDifusor">Nombre Difusor</label>
                                <input type="text" class="form-control" name="InputNombreDifusor" id="NombreDifusor" placeholder="Ingrese Nombre Difusor" required="">
                            </div>
                            <div class="form-group"style="padding: 2%;">
                                <label for="InputNombres">Nombres</label>
                                <input type="text" class="form-control" name="InputNombres" id="Nombres" placeholder="Ingrese Nombres" required="">
                            </div>
                            <div class="form-group"style="padding: 2%;">
                                <label for="InputApellidoPaterno">Apellido Paterno</label>
                                <input type="text" class="form-control" name="InputApellidoPaterno" id="ApellidoPaterno" placeholder="Ingrese Apellido Paterno" required="">
                            </div>
                            <div class="form-group"style="padding: 2%;">
                                <label for="InputApellidoMaterno">Apellido Materno</label>
                                <input type="text" class="form-control" name="InputApellidoMaterno" id="ApellidoMaterno" placeholder="Ingrese Apellido Materno" required="">
                            </div>
                            <div class="form-group"style="padding: 2%;">
                                <label for="InputEmail">e-mail</label>
                                <input type="email" class="form-control" name="InputEmail" id="Email" placeholder="Ingrese Correo Electrónico" required="">
                            </div>
                            <div class="form-group"style="padding: 2%;">
                                <label for="InputEdad">Edad</label>
                                <input type="number" min="0" max="100" class="form-control" onkeypress="return solonumeros(event);" name="InputEdad" id="Edad" placeholder="Ingrese Edad" required="">
                            </div>
                            <div class="form-group"style="padding: 2%;">
                                <label for="optionsRadiosSexo">Sexo</label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadiosSexo" id="male" value="male" checked>
                                        Masculino
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="optionsRadiosSexo" id="female" value="female">
                                        Femenino
                                    </label>
                                </div>  
                            </div>
                            </div>
                            </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div id="datosPersonalesAnunciante" class="panel panel-default margen" style="margin-top: 2%;" >
                                <div class="panel-heading">
                                    <h3 class="panel-title">Vincular red social</h3>
                                </div>
                            
                            
                            <div class="form-group"style="padding: 2%;">
                                <label for="InputFacebook">Facebook</label>
                                <input type="text" class="form-control" name="InputFacebook" id="Facebook-nombre" readonly="true"placeholder="" required="">
                                <input type="hidden" class="form-control" name="InputFacebook-id" id="Facebook-id" placeholder="">

                                    <a href="#" id="login" class="btn btn-primary" style="margin-top:  1%;">Vincular Facebook </a>
                            </div>
                             <!-- Vinculacion Twitter
                            <div class="form-group"style="padding: 2%;">
                                <label for="InputTwitter">Twitter</label>
                                <input type="text" class="form-control" name="InputTwitter" id="Twitter-nombre" readonly="true"   placeholder="" required="">
                                <input type="hidden" class="form-control" name="InputTwitter-id" id="Twitter-id" placeholder="">
                                <a href="#" id="login-twitter" class="btn btn-primary" style="margin-top:  1%;">Vincular Twitter </a>
                            </div>
                           -->
                            </div> 
                            </div>
                                                   
                            <div class="col-md-4">
                            <div id="datosPersonalesAnunciante" class="panel panel-default margen" >
                                <div class="panel-heading">
                                    <h3 class="panel-title">Contraseña</h3>
                                </div>
                            <div class="form-group"style="padding: 2%;">
                                <label for="InputPassword">Contraseña</label>
                                <input type="password" class="form-control" name="InputPassword" id="password" placeholder="Ingrese Contraseña" required="">
                            </div>
                            <div class="form-group"style="padding: 2%;">
                                <label for="InputPassword">Repita Contraseña</label>
                                <input type="password" class="form-control" name="InputPassword2" id="password2" placeholder="Ingrese Contraseña" required="">
                            </div>
                             </div>
                                </div>
                            
                            <div class="col-md-4">
                             <div id="datosPersonalesAnunciante" class="panel panel-default margen" >
                                <div class="panel-heading">
                                    <h3 class="panel-title"> Seleccione su avatar</h3>
                                </div>
                            
                            <div class="radio avatar-seleccionar" style="padding: 2%;">
                                    <label>
                                        <input type="radio" name="optionsRadioAvatar" id="avatar" value="1"  checked="true">
                                        <img id="img-avatar" src="img/avatar/Alien 3.ico">   
                                    </label>
                                    <label>
                                        <input type="radio" name="optionsRadioAvatar"  value="2" >
                                        <img id="img-avatar" src="img/avatar/Bat.ico">   
                                    </label>
                                    <label>
                                        <input type="radio" name="optionsRadioAvatar"  value="3" >
                                        <img id="img-avatar" src="img/avatar/Devil 2.ico">   
                                    </label>
                                    <label>
                                        <input type="radio" name="optionsRadioAvatar"  value="4" >
                                        <img id="img-avatar" src="img/avatar/Pumpkin.ico">   
                                    </label>
                                    <label>
                                        <input type="radio" name="optionsRadioAvatar" value="5" >
                                        <img id="img-avatar" src="img/avatar/Sea Monster.ico">   
                                    </label>
                                    <label>
                                        <input type="radio" name="optionsRadioAvatar"  value="6" >
                                        <img id="img-avatar" src="img/avatar/Zombie Female.ico">   
                                    </label>
                                    <label>
                                        <input type="radio" name="optionsRadioAvatar"  value="7" >
                                        <img id="img-avatar" src="img/avatar/Skull 2.ico">   
                                    </label>      
                            </div>
                            </div>
                            </div>
                            <div class="col-md-4">
                            <button class="btn btn-success" type="submit" >Registro</button>
                            </div>
                            </div> <!--FILA-->
                           </form> 
                        </div>
                        </div>
                    
        
                        
    </div>
        <%@include file="base_ag/_pie_pagina.jsp" %>
        
                <script>
                        function solonumeros(e)
                     {   
                      
                         var keynum = window.event ? window.event.keyCode : e.which;
                         if ((keynum === 8) || (keynum === 46))
                         return true;
                         return /\d/.test(String.fromCharCode(keynum));

                     }
                </script>
    </body>
</html>
