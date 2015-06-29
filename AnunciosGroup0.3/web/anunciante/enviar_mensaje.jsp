<%-- 
    Document   : enviar_mensaje
    Created on : 18-05-2015, 06:39:37 PM
    Author     : zamorator <zamorator@gmail.com>
--%>

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
        <title>Anunciante</title>
        <%
            Anunciante anunciante;
            HttpSession session_actual = request.getSession();
            anunciante = (Anunciante) session.getAttribute("anunciante");
            Giro giro = (Giro) session.getAttribute("giro");
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp" %> 

        <ul class="nav nav-pills nav-justified menu_anunciante" role="group"style="padding-top: 10%;">
            <li role="presentation"><a href="mis_anuncios.jsp">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation" class="active"><a href="#">Ayuda</a></li>
        </ul>

        <div id="mis_anuncios" class="contenido">
            <div id="panel">
                <div id="submenu" class="links_submenu">
                    <ul class="nav nav-tabs ">
                        <li role="submenu" class="active"><a href="#">Enviar Mensaje</a></li>
                        <li role="submenu"><a href="bandeja_anunciante.jsp">Bandeja</a></li>
                    </ul>
                </div>
                <% if (request.getParameter("message") != null) {%>
                <div class="label label-success" role="alert">${param.message}</div>
                <% }%>
                <h1>Enviar mensaje</h1>

                <div class="row">
                    <div class="col-md-8">
                        <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/EnviarMensaje">
                            <div class="form-group">
                                <label for="inputDe" class="col-sm-2 control-label">De</label>
                                <div class="col-sm-6">
                                    <input name="InputDe" type="email" class="form-control" id="InputDe" value="<%= anunciante.getEmail_anunciante()%>" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPara" class="col-sm-2 control-label">Para</label>
                                <div class="col-sm-6">
                                    <input name="InputPara" type="email" class="form-control" id="InputPara" placeholder="Email" value="administrador@anunciosgorup.cl" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAsunto" class="col-sm-2 control-label">Asunto</label>
                                <div class="col-sm-6">
                                    <input name="InputAsunto" type="text" class="form-control" id="InputAsunto" placeholder="Ingresar Asunto" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputAsunto" class="col-sm-2 control-label">Mensaje</label>
                                <div class="col-sm-6">
                                    <textarea name="InputMensaje" rows="3" class="form-control" required=""></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-6">
                                    <button type="submit" class="btn btn-default">Enviar</button>
                                </div>
                            </div>
                            <input type="text" hidden="" value="<%= anunciante.getNombre_u_anunciante()%>" name="InputNombreUAnunciante">
                        </form>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>



            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
