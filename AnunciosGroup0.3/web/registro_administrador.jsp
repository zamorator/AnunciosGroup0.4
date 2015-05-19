<%-- 
    Document   : registro_administrador
    Created on : 16-may-2015, 11:46:01
    Author     : Javoru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/Estilos_ag.css">
        <title>Registro Administrador</title>
    </head>
    <body>
        
        <div class="contenido" id="registro">
            <% if (request.getParameter("message") != null) {%>
            <div class="alert alert-danger" role="alert">${param.message}</div>
            <% }%>
            
        <form action="${pageContext.request.contextPath}/LoginAdministrador" method="POST">
            
            <!-- <input type="text" name="txtapellido">  -->
            <!-- <button type="submit">Enviar</button> -->
            
            
        </form>
        <h1>Hello World!</h1>
    </body>
</html>
