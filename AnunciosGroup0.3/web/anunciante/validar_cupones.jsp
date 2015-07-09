<%-- 
    Document   : validar_cupones
    Created on : 08-jul-2015, 16:36:22
    Author     : macbookair
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
        <title>Validar Cupon</title>
    </head>

    <%
        Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
        Giro giro = (Giro) session.getAttribute("giro");
    %>
    <body>
        <%@include file="../base_ag/_menu_anunciante.jsp"%>  
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group"style="padding-top: 10%;">
            <li role="presentation" class="active"><a href="mis_anuncios.jsp">Anuncios</a></li>
            <li role="presentation"><a href="perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="enviar_mensaje.jsp">Ayuda</a></li>
        </ul>
        <div id="panel">
            <ul class="nav nav-tabs ">
                <li role="submenu" ><a href="mis_anuncios.jsp">Mis Anuncios</a></li>
                <li role="submenu"><a href="agregar_anuncio.jsp">Agregar Anuncio</a></li>
                <li role="submenu"><a href="#">Editar Anuncio</a></li>
                <li role="submenu" class="active" ><a href="#">Validar Cupones</a></li>
            </ul>
            <form action="${pageContext.request.contextPath}/ValidarCupon" method="POST">
                <p class="alert-info">Para validar el cupón que le entrega el usuario, debe ingresar el codigo de esté y selecionar validar, si no realiza esta operación el cupón seguirá activo.</p>
                <% if (request.getParameter("mensajeexito") != null) {%>
                <div class="alert alert-success" role="alert">${param.mensajeexito}</div>
                <% }%>

                <% if (request.getParameter("mensajeerror") != null) {%>
                <div class="alert alert-danger" role="alert">${param.mensajeerror}</div>
                <% }%>
                <div class="form-group" style="width: 50%;">
                    <label for="exampleInputEmail1">Código anuncio</label>
                    <input type="text" class="form-control" name="id_cupon" placeholder="Ingrese código anuncio">
                    <input type="hidden" name="nombre_u_anunciante"  value="<%= anunciante.getNombre_u_anunciante()%>">
                </div>
                <button type="submit" class="btn btn-default">Validar</button>
            </form>
        </div>
    </body>
</html>
