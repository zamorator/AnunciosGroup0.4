<%-- 
    Document   : difusor_cupones
    Created on : 23-jun-2015, 2:08:49
    Author     : macbookair
--%>

<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page import="cl.inacap.model.Cupon"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Cupones</title>
    </head>
    
    <body>
        <%@include file="../base_ag/_menu_difusor.jsp" %>
        <%
         ArrayList<Cupon> cupones= null;
         String nombredisfusor = difusor.getNombre_u_difusor();
         try{
             cupones = new ArrayList<Cupon>();
             DifusorAnunciosDAO anunciosDAO = new DifusorAnunciosDAO();
             cupones = anunciosDAO.buscarcupones(nombredisfusor);
             System.out.println(cupones);
         } catch(Exception e){
                e.printStackTrace();
            }
    %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"><a href="difusor_inicio.jsp">Inicio</a></li>
            <li role="presentation" class="active"><a href="#">Perfil</a></li>
            <li role="presentation"><a href="#">Canjear</a></li>
        </ul>
        
        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation"><a href="difusor_perfil.jsp">Mis Datos</a></li>
                <li role="presentation"><a href="difusor_puntos.jsp">Puntos</a></li>
                <li role="presentation" class="active"><a href="#">Cupones</a></li>
         </div>
        <div class="container">
         
         <% for (Cupon b : cupones) {%>    
         <form method="POST" action="${pageContext.request.contextPath}/GeneraCupon3"   >
            <ul class="media-list">
                <li class="media">
                  <div class="media-left">
                    <a href="#">
                        <img class="media-object" src="${pageContext.request.contextPath}/images/anunciante/<%= b.getImg_anuncio() %>" width="100px">
                    </a>
                  </div>
                  <div class="media-body">
                        <h4 class="media-heading"> #<%= b.getId_cupon()%><%= b.getCodigo_anuncio() %>   <%= b.getDescripcion_cupon()%></h4>
                        <input type="hidden" name="id_cupon" value="<%= b.getId_cupon()%>">
                    <div class="col-md-2" style="float: right">
                        <button  class="btn btn-success"  type="submit" >Generar Cupón</button>
                    </div>
                  </div>
                  
                </li>
            </ul>
            </form>
                    <hr>      
         <%};%> 
        </div>
       
     
        
        <% if (request.getParameter("message") != null) {%>
            <script>
            function Abrir_ventana(){
                console.log("llegue");
                window.open("difusor_cupon.jsp", "ventana", 'width=900,height=800');
                }
            window.onload=Abrir_ventana();
            </script>
        <% }%>
        
        
    </body>
</html>
