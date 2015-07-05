<%-- 
    Document   : admin_empresas
    Created on : 08-jun-2015, 20:14:37
    Author     : Javoru
--%>

<%@page import="cl.inacap.model.Administrador"%>
<%@page import="cl.inacap.dao.administrador.AdministradorDAO"%>
<%@page import="cl.inacap.model.Mensaje"%>
<%@page import="java.util.ArrayList"%>
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
        <!--  MENSAJES BOOTSTRAP  -->
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>MENSAJES</title>
    </head>

    <%
        Administrador administrador = (Administrador) session.getAttribute("administrador");
        ArrayList<Mensaje> mostrarmensajes = null;

        try {
            mostrarmensajes = new ArrayList<Mensaje>();

            AdministradorDAO mensajesDAO = new AdministradorDAO();
            mostrarmensajes = mensajesDAO.buscarmensajes("E");

            System.out.println(mostrarmensajes);
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <body>
        <%@include file="../base_ag/_menu_administrador.jsp" %>     

        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation" ><a href="../administrador/Admin_inicio.jsp">Anuncios</a></li>
            <li role="presentation" class="active"><a href="#">Empresas</a></li>
            <li role="presentation"><a href="../administrador/admin_perfil.jsp">Perfil</a></li>
        </ul>

        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Mensajes</a></li>
                <li role="presentation"><a href="admin_n_empresas.jsp">Nuevas Empresas</a></li>
            </ul>

            <!--ANUNCIO 1 --> 
            <% int id_modal2 = 0; %>
            <% for (Mensaje b : mostrarmensajes) {%>
            <form action="${pageContext.request.contextPath}/TraerMensaje" method="POST" > 

                <div class="tab-content">
                    <div class="tab-pane fade in active" id="home">
                        <div class="list-group">
                            <a href="#" class="list-group-item" data-toggle="modal" data-target="#<%= id_modal2%>" >
                                <span class="glyphicon glyphicon-star-empty"></span>
                                <span class="name" style="min-width: 110px;display: inline-block;"> <%= b.getNombre_u_anunciante()%> </span> <span class=""> <%= b.getDe()%> </span>
                                <span class="text-muted" style="font-size: 11px;">- <%= b.getAsunto()%> </span> <span class="badge"> <%= b.getFecha()%> </span> <span class="pull-right">
                                </span>
                            </a>
                        </div>
                    </div>
                </div>                        
            </form>

            <!--VENTANA MODAL INICIO -->
            <form action="${pageContext.request.contextPath}/TraerMensaje" method="POST" >

                <div class="modal fade" id="<%=id_modal2%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <input type="hidden" name="in_nombre_u_anunciante" value="<%= b.getNombre_u_anunciante()%>" >
                        <input type="hidden" name="in_asunto" value="<%= b.getAsunto()%>" >
                        <input type="hidden" name="in_mensaje" value="<%= b.getMensaje()%>" >
                        <input type="hidden" name="in_codigo_administrador" value="<%= b.getCodigo_administrador()%>" >
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h3 class="modal-title" id="myModalLabel"> <%= b.getNombre_u_anunciante()%> </h3>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <!-- AL INSERTAR EL MENSAJE TAMBIEN SE DEBE INSERTAR 
                                    - NOMBRE DEL ANUNCIANTE
                                    --ASUTO
                                    - POR DEFECTO EL TIPO "E" -->

                                    <h3>ASUNTO :  <%= b.getAsunto()%></h3>

                                    <h3>MENSAJE : <%= b.getMensaje()%></h3>
                                </div>
                                <label class="control-label col-sm-2" for="InputEmpresa"> Empresa </label>
                                <input value="<%= b.getNombre_u_anunciante()%>" type="text" class="form-control" name="InputEmpresa" id="Empresa"  required=""  >
                                <label class="control-label col-sm-2" for="InputEmpresa"> Asunto </label>
                                <input value="<%= b.getAsunto()%>" type="text" class="form-control" name="InputAsunto" id="Asunto"  required=""  >
                                <label class="control-label col-sm-2" for="InputMensaje">Mensaje</label>
                                <input type="text" class="form-control" name="InputMensaje" id="Mensaje" placeholder="Respuesta" required="">  
                            </div>
                            <div class="modal-footer">
                                <button  class="btn btn-success"  type="submit">Responder</button>

                                <button type="button" class="btn btn-danger" data-dismiss="modal" >Ignorar</button>
                            </div>
                        </div>
                    </div>
                </div>

            </form>

            <!--VENTANA MODAL FIN -->


            <%id_modal2++;
                            }%>    


        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
