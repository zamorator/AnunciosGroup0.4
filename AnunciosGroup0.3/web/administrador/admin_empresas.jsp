<%-- 
    Document   : admin_empresas
    Created on : 08-jun-2015, 20:14:37
    Author     : Javoru
--%>

<%@page import="cl.inacap.dao.administrador.AdministradorDAO"%>
<%@page import="cl.inacap.model.Mensaje"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="../js/main.js"></script>
        <link rel="stylesheet" href="../css/cabecera_anunciante.css">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/modern-business.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <script src="../js/bootstrap.min.js"></script>
        <title>MENSAJES</title>
    </head>
    
        <%
            ArrayList<Mensaje> mostrarmensajes = null;
            
            
            try{
            mostrarmensajes = new ArrayList<Mensaje>();
            
            AdministradorDAO mensajesDAO = new AdministradorDAO();
            mostrarmensajes = mensajesDAO.buscarmensajes();
            
            System.out.println(mostrarmensajes);
            } catch(Exception e){
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
            
            
            <div class="col-md-12" id="">
                       <!--ANUNCIO 1 --> 
                       <% int id_modal2=0; %>
                       <% for (Mensaje b : mostrarmensajes) {%>
                       <div class="col-sm-6 col-md-4">
                        
                            
                            <div class="caption">
                                 ID : <h3> <%= b.getId_mensaje() %></h3>
                                 DE : <h3> <%= b.getDe()%></h3>
                         
                             <!--VENTANA MODAL INICIO -->
                            <form action="${pageContext.request.contextPath}/TraerMensaje" method="POST" >
                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#<%= id_modal2%>">Detalle</button>
                                <div class="modal fade" id="<%=id_modal2 %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <input type="hidden" name="in_mensaje" value="<%= b.getMensaje() %>" >
                                    <div class="modal-content">
                                         <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                             <h3 class="modal-title" id="myModalLabel"> <%= b.getNombre_u_anunciante()%> </h3>
                                        </div>
                                        <div class="modal-body">
                                                    
                                                ASUNTO : <h3> <%= b.getAsunto()%></h3>
                                               MENSAJE :
                                                         <h3> <%= b.getMensaje()%></h3>
                                        
                     
                                              <label for="InputMensaje">Mensaje</label>
                                              <input type="text" class="form-control" name="InputMensaje" id="Mensaje" placeholder="Respuesta" required="">   
                                        </div>
                                        <div class="modal-footer">
                                            <button  class="btn btn-success"  type="submit">Responder</button>
                                            
                                            <button type="button" class="btn btn-danger" data-dismiss="modal" >Ignorar</button>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            <!--VENTANA MODAL FIN -->
                              </form>
                              
                            </div>
                        
                        </div>
                        <%id_modal2++;}%>    
                    </div>    
            
            
        </div>
         <%@include file="../base_ag/_pie_pagina.jsp" %>
    </body>
</html>
