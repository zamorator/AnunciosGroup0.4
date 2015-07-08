<%-- 
    Document   : admin_sharecoins
    Created on : 07-jul-2015, 18:22:31
    Author     : macbookair
--%>

<%@page import="cl.inacap.model.ShareCoin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cl.inacap.dao.administrador.AdministradorDAO"%>
<%@page import="cl.inacap.model.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/jquery-min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <script type ="text/javascript" src="../js/paginacion.js"></script>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Sharecoins</title>
    </head>

    <%
        Administrador administrador = (Administrador) session.getAttribute("administrador");
        AdministradorDAO adao = new AdministradorDAO();
        ArrayList<ShareCoin> sharecoin = new ArrayList<ShareCoin>();
        sharecoin = adao.buscasharecoinp();
    %>   
    <body>
        <%@include file="../base_ag/_menu_administrador.jsp" %>   
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"class="active" ><a href="../administrador/Admin_inicio.jsp">Anuncios</a></li>
            <li role="presentation" ><a href="admin_empresas.jsp">Empresas</a></li>
            <li role="presentation"><a href="../administrador/admin_perfil.jsp">Perfil</a></li>
        </ul>
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" ><a href="Admin_inicio.jsp">Anuncios</a></li>
                <li role="presentation" class="active"><a href="#">ShareCoins</a></li>

            </ul>

            <% int id_modal2 = 0; %>
            <% for (ShareCoin b : sharecoin) {%>
            <form action="${pageContext.request.contextPath}/AceptarRechazarShareCoin" method="GET" > 

                <div class="tab-content">
                    <div class="tab-pane fade in active" id="home">
                        <div class=" container-fluid list-group-item" style="margin-top: 1%;">
                            <span class="glyphicon glyphicon-star-empty"></span>
                            <span class="name" style="min-width: 110px;display: inline-block;"> <%= b.getNombre_u_anunciante()%> </span> 
                            <span class=""> Cantidad de ShareCoins: </span>
                            <span class=""> <%= b.getCantidad_compartir()%> |</span>
                            <span class="text-muted" style="font-size: 11px;">Codigo Solicitud ShareCoin:<%= b.getId_share_coin()%>  </span> 
                            <input type="hidden" name="id_share_coin" value="<%= b.getId_share_coin()%>">
                            <input type="hidden" name="codigo_anuncio" value="<%= b.getCodigo_anuncio()%>">
                            <span class="text-muted" style="font-size: 11px;">- Para Anuncio :<%= b.getCodigo_anuncio()%> </span>  
                            <span class="pull-right " style="margin-top: -6px;"><input type="submit" class="btn btn-success btn-sm" name="aceptar" value="Aceptar"> </span>   
                            <span class="pull-right " style="margin-top: -6px; margin-right:  4px;"><input type="submit" class="btn btn-warning btn-sm" name="rechazar" value="Rechazar"> </span>
                        </div>
                    </div>
                </div>  
            </form>

            <%id_modal2++;
                }%> 
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
