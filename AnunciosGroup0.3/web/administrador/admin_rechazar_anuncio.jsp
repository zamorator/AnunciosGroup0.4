<%-- 
    Document   : admin_rechazar_anuncio
    Created on : 08-jul-2015, 13:27:50
    Author     : macbookair
--%>

<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page import="cl.inacap.model.Anunciante"%>
<%@page import="cl.inacap.model.Administrador"%>
<%@page import="cl.inacap.model.Anuncio"%>
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
        <link rel="stylesheet" href="../css/bootstrap-nav-wizard.css">
        <title>Rechazar anuncio</title>
    </head>
    <%
          Administrador administrador = (Administrador) session.getAttribute("administrador");  
          HttpSession session_actual = request.getSession(true);
          Anuncio anuncio = (Anuncio) session_actual.getAttribute("anuncio");
          Anunciante anunciante  = new Anunciante();
          DifusorAnunciosDAO dad = new DifusorAnunciosDAO();
          anunciante = dad.buscaanuncianteporanuncio(anuncio.getCodigo_anuncio());
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
                <li role="presentation" class="active"><a href="#">Motivo Rechazo</a></li>
                        
            </ul>
            
            
            <div class="col-md-7">
                               
                        <img  class="img-responsive img-thumbnail"  src="${pageContext.request.contextPath}/images/anunciante/<%= anuncio.getImagen_anuncio()%>" style="width: 300px; height: 300px; margin-top: 10px;" alt="">
                           
                        </div>
                        <form action="${pageContext.request.contextPath}/EnviarMensaje" method="POST" >
                        <div class="col-md-5">
                            <h4>Motivo Rechazo Anuncio Codigo: <%= anuncio.getCodigo_anuncio() %> </h4>
                            <h4></h4>
                            <select name="InputAsunto">
                                <option value="No cumple con politicas de AnunciosGroup.">No cumple con politicas de AnunciosGroup.</option>
                                <option value="No contiene toda la informacion o esta inconclusa">No contiene toda la informacion o esta inconclusa.</option>
                                <option value="La imagen de anuncio no a sido actualizada.">La imagen de anuncio no a sido actualizada.</option>
                                <option value="El anuncio no presenta cupones para canjeo.">El anuncio no presenta cupones para canjeo.</option>
                                <option value="Otros.">Otros.</option>
                            </select>
                            <h4>Mensaje: </h4>
                            <textarea
                            onKeyDown="textCounter(this.form.resum,this.form.r emLen,2000);" 
                            onKeyUp="javascript:storeCaret(this); 
                            textCounter(this.form.resum,this.form.remLen,2000) ;" name="InputMensaje" 
                            onchange="javascript:storeCaret(this);" 
                            onclick="javascript:storeCaret(this);" rows="10" wrap="VIRTUAL" cols="60"
                            >Codigo anuncio: <%=anuncio.getCodigo_anuncio() %> 
Nombre anuncio: <%= anuncio.getNombre_anuncio() %>
                                
                            </textarea>
                            
                            <p></p>
                            <input type="hidden" name="InputDe" value="administrador@anunciosgorup.cl">
                            <input type="hidden" name="InputPara" value="<%= anunciante.getNombre_u_anunciante() %>">
                            <input type="hidden" name="InputNombreUAnunciante" value="<%= anuncio.getNombre_u_anunciante() %>">
                            <input type="hidden" name="InputRemitente" value="A">
                            <input type="hidden" name="in_codigo_anuncio" value="<%= anuncio.getCodigo_anuncio() %>">
                            <input type="submit" name="enviar_mensaje" class="btn btn-primary" value="Enviar Mensaje">
                            <hr>
                            
            </div>
        </form>                 
        </div>
    <%@include file="../base_ag/_pie_pagina.jsp" %>                        
    </body>
</html>
