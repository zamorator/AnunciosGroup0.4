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
        <title>JSP Page</title>
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/LoginAdministrador" method="POST">
            <input type="text" name="txtapellido"> 
            <button type="submit">Enviar</button> 
        </form>
        <h1>Hello World!</h1>
    </body>
</html>
