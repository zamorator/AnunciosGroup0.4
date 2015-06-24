<%-- 
    Document   : difusor_favorito
    Created on : 25-may-2015, 23:19:56
    Author     : macbookair
--%>

<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Favoritos difusor</title>
    </head>
    <body>
        <%@include file="../base_ag/_menu_difusor.jsp" %>
         <%
            ArrayList<Anuncio> anunciosfavoritos= null;
            String nombre_difusor = difusor.getNombre_u_difusor();
            
            try{
            anunciosfavoritos = new ArrayList<Anuncio>();
            
            DifusorAnunciosDAO anunciosDAO = new DifusorAnunciosDAO();
            anunciosfavoritos = anunciosDAO.buscaranunciofavortio(difusor);
            
            System.out.println(anunciosfavoritos);
            } catch(Exception e){
                e.printStackTrace();
            }
        %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation" class="active"><a href="#">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation"><a href="#">Canjear</a></li>
        </ul>
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation"><a href="difusor_inicio.jsp">Todos</a></li>
                <li role="presentation"class="active"><a href="difusor_favorito.jsp">Mis Anuncios</a></li>
            </ul>
        <div class="col-md-12" id="">
                       <!--ANUNCIO 1 --> 
                       <% int id_modal2=0; %>
                        <% for (Anuncio b : anunciosfavoritos) {%>
                        <div class="col-sm-6 col-md-4">
                        <div class="thumbnail" id="anuncios">
                            <img class="img-responsive" id="img_anuncios" src="${pageContext.request.contextPath}/images/anunciante/<%= b.getImagen_anuncio() %>" >
                            <div class="caption">
                              <h3><%= b.getNombre_anuncio() %></h3>
                              
                             <!--VENTANA MODAL INICIO -->
                            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#<%= id_modal2%>">Detalle</button>
                                <div class="modal fade" id="<%=id_modal2 %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                    <div class="modal-content">
                                         <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                             <h4 class="modal-title" id="myModalLabel"> <h3><%= b.getNombre_anuncio() %></h3></h4>
                                        </div>
                                        <div class="modal-body">
                                            <img class="img-responsive" src="${pageContext.request.contextPath}/images/anunciante/<%= b.getImagen_anuncio() %>" >
                                            <p>Esta es una pequeña descripcion del anuncio.</p>
                     
                                            <input type="checkbox"  onclick="clickCheck(<%= b.getCodigo_anuncio() %>,' <%= nombre_difusor%>')" id ="favorito" checked="" class="click"> Agregar a Favorito
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" type="submit">Canejar</button>
                                            <button type="button" class="btn btn-primary">Publicar</button>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            <!--VENTANA MODAL FIN -->
                              
                              
                            </div>
                        </div>
                        </div>
                        <%id_modal2++;}%>    
                    </div>    
            
        </div>
                    <script>
                        function clickCheck(codigo_anuncio,nombre_difusor){
                         console.log(codigo_anuncio);
                         console.log(nombre_difusor);

                          $.get(
                                "../AgregarFavorito",
                                {
                                in_codigo_anuncio: codigo_anuncio,
                                in_nombre_difusor: nombre_difusor 
                                },
                                function(respuesta){
                          console.log(respuesta);
                          $(this).checked = respuesta;
                          });  
                          }                    
                    </script>     
    </body>
</html>
