<%-- 
    Document   : _menu_difusor
    Created on : 28-abr-2015, 22:11:38
    Author     : macbookair
--%>

<%@page import="cl.inacap.model.Difusor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/cabecera_anunciante.css">
<!DOCTYPE html>
<html>
            <%
            HttpSession session_actual = request.getSession(true);
            Difusor difusor = (Difusor) session_actual.getAttribute("difusor");
            %>
    <body>
        <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="../AnunciosGroup0.3/newjsp.jsp">
                                <span>
                                    <img src="/AnunciosGroup0.3/img/AG logo.png" height="30" width="30">
                                </span>
                                <span>
                                    AnunciosGroup
                                </span>
                            </a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                            <ul class="nav navbar-nav navbar-right">
                                <% if(difusor != null){    %>
                                <img width="50px" src="/AnunciosGroup0.3/img/avatar/<%=difusor.getNombre_avatar()%>">
                                <a href="../difusor/difusor_perfil.jsp"><%= difusor.getNombre_u_difusor() %> </a>
                                <% }%>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
    </body>
</html>
