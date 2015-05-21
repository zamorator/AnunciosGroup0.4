<%-- 
    Document   : difusor_perfil
    Created on : 12-may-2015, 20:16:12
    Author     : macbookair
--%>

<%@page import="cl.inacap.model.Difusor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Difusor Perfil</title>
        
        <%
            HttpSession session_actual = request.getSession(true);
            Difusor difusor = (Difusor) session_actual.getAttribute("difusor");
        %>
    </head>
    <body>
        <%@include file="../base_ag/_menu_difusor.jsp" %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group">
            <li role="presentation"><a href="difusor_inicio.jsp">Inicio</a></li>
            <li role="presentation" class="active"><a href="#">Perfil</a></li>
            <li role="presentation"><a href="#">Canjear</a></li>
        </ul>
        
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Mis Datos</a></li>
                <li role="presentation"><a href="#">Puntos</a></li>
            </ul>
            
            <div class="contenido" id="contenido_panel">
                
                <% if (request.getParameter("mensajeexito") != null) {%>
                    <div class="alert alert-success" role="alert">${param.mensajeexito}</div>
                <% }%>
                
                <% if (request.getParameter("mensajeerror") != null) {%>
                    <div class="alert alert-danger" role="alert">${param.mensajeerror}</div>
                <% }%>
                
                <form action="${pageContext.request.contextPath}/ActualizarPerfil" method="POST">
                    <div class="form-group" id="box_input">
                        <label for="InputNombreUAnunciante">Nombre Usuario:</label>
                        <input type="text" class="form-control"  name="InputNombreUDifusor" value="<%=difusor.getNombre_u_difusor() %>" required="" readonly="true" >
                    </div>

                    <div class="form-group" id="box_input">
                        <label for="InputNombres">Nombres:</label>
                        <input type="text" class="form-control"  name="InputNombres" value="<%=difusor.getNombres() %>" required="">
                    </div>

                    <div class="form-group" id="box_input">
                        <label for="InputApellidoPaterno">Apellido Paterno:</label>
                        <input type="text" class="form-control" name="InputApellidoPaterno" value="<%=difusor.getApellido_paterno_difusor() %>" required="">
                    </div>

                    <div class="form-group" id="box_input">
                        <label for="InputApellidoMaterno">Apellido Materno:</label>
                        <input type="text" class="form-control" name="InputApellidoMaterno" value="<%=difusor.getApellido_materno_difusor() %>" required="">
                    </div>
                    
                    <div class="form-group" id="box_input">
                        <label for="InputCorreo">Correo electronico:</label>
                        <input type="text" class="form-control" name="InputCorreo" value="<%=difusor.getEmail_difusor() %>" required="">
                    </div>
                    
                    <div class="form-group" id="box_input">
                        <label for="InputNombreContraseña">Contraseña:</label>
                        <input type="text" class="form-control" name="InputNombreContrasena" placeholder="Ingrese Contraseña" required="">
                    </div>
                     <div class="form-group" id="box_input">
                        <button class="btn btn-default" id="btn_actualizar" type="submit" >Actualizar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
