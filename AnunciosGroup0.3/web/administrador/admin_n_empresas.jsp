<%-- 
    Document   : admin_n_empresas
    Created on : 17-jun-2015, 23:02:09
    Author     : Javoru
--%>

<%@page import="cl.inacap.dao.administrador.AdministradorDAO"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page import="cl.inacap.model.Anunciante"%>
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
        <title>Nuevas Empresas</title>
    </head>
    
    
    <%
            ArrayList<Anunciante> anunciantespendientes= null;
            
            
            try{
            anunciantespendientes = new ArrayList<Anunciante>();
            
            AdministradorDAO anunciantesDAO = new AdministradorDAO();
            anunciantespendientes = anunciantesDAO.buscaranuncianteadministrador();
            
            System.out.println(anunciantespendientes);
            } catch(Exception e){
                e.printStackTrace();
            }
        %>
    <body>
        
        <%@include file="../base_ag/_menu_administrador.jsp" %>    
    
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation" ><a href="../administrador/Admin_inicio.jsp">Anuncios</a></li>
            <li role="presentation" class="active"><a href="#">Empresas</a></li>
            <li role="presentation"  ><a href="../administrador/admin_perfil.jsp">Perfil</a></li>
        </ul>
        
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" ><a href="../administrador/admin_empresas.jsp">Mensaje</a></li>
                <li role="presentation" class="active"><a href="#">Nuevas Empresas</a></li>

                
                
            </ul>
            
                       <div class="col-md-12" id="">
                       <!--ANUNCIO 1 --> 
                       <% int id_modal2=0; %>
                       <% for (Anunciante b : anunciantespendientes) {%>
                       <div class="col-sm-6 col-md-4">
                        
                            
                            <div class="caption">
                               <h3> <%= b.getNombre_u_anunciante()%></h3>
                               <h3> <%= b.getDireccion_anunciante()%></h3>
                               <h3> <%= b.getEstado_anunciante() %></h3>
                             <!--VENTANA MODAL INICIO -->
                            <form action="${pageContext.request.contextPath}/ActualizarAnuncianteAdmin" method="POST" >
                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#<%= id_modal2%>">Detalle</button>
                                <div class="modal fade" id="<%=id_modal2 %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <input type="hidden" name="in_nombre_u_anunciante" value="<%= b.getNombre_u_anunciante()%>" >
                                    <div class="modal-content">
                                         <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                             <h3 class="modal-title" id="myModalLabel"> <%= b.getNombre_anunciante()%> </h3>
                                        </div>
                                        <div class="modal-body">
                                            
                                        <p>Esta es una pequeña descripcion del anuncio.</p>
                     
                                           
                                        </div>
                                        <div class="modal-footer">
                                            <button  class="btn btn-success"  type="submit">Aceptar</button>
                                            <button type="button" class="btn btn-danger" data-dismiss="modal" >Rechazar</button>
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
