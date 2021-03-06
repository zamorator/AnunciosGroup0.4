<%-- 
    Document   : difusor_cupon
    Created on : 23-jun-2015, 22:10:08
    Author     : macbookair
--%>

<%@page import="cl.inacap.model.Anunciante"%>
<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
<%@page import="cl.inacap.model.Cupon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="stylesheet" href="../css/anunciante.css">
        <title>Cupon</title>
            <%

                HttpSession session_actual4 = request.getSession(true);
                Cupon cupon = (Cupon) session_actual4.getAttribute("cupon2");
                DifusorAnunciosDAO  dad  = new DifusorAnunciosDAO();
                Anunciante anunciante  = new Anunciante();
                anunciante = dad.buscaanuncianteporanuncio(Integer.parseInt(cupon.getCodigo_anuncio()));
            %>
    </head>
    <body>
        <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead"><%= cupon.getDescripcion_cupon() %></p>
                <div class="list-group">
                    <a href="#" class="list-group-item active">Codigo cupón: # <%= cupon.getId_cupon() %></a>

                </div>
            </div>

            <div class="col-md-9">

                <div class="thumbnail">
                            <img class="img-responsive img-thumbnail" src="${pageContext.request.contextPath}/images/anunciante/<%= cupon.getImg_anuncio() %>" style="width: 300px; height: 300px;">          
                   
                    <div class="caption-full">
                        <h4 class="pull-right"> $ <%= cupon.getValor_final_producto() %></h4>
                        <h4><a href="#"><%= cupon.getDescripcion_cupon() %></a>
                        </h4>
                        <p> <%= cupon.getDescripcion_cupon2() %></p>
                    </div>
                    <div class="ratings">
                        
                    </div>
                </div>
               <div class="list-group" >
                            <a href="#" class="list-group-item active">
                                <p>El canjeo de este cupón sera valido en la siguiente dirección:</p>
                            </a>
                            <a href="#" class="list-group-item">Nombre empresa:<%= anunciante.getNombre_anunciante() %></a>
                            <a href="#" class="list-group-item">Correo:<%= anunciante.getEmail_anunciante() %></a>
                            <a href="#" class="list-group-item">Dirección:<%= anunciante.getDireccion_anunciante() %></a>
                           
                          </div>          


            </div>

        </div>

    </div>
                    <div class="col-md-1" style="margin-left: 40%;" >
            <input type="button" name="imprimir" value="Imprimir" onclick="window.print();">
            </div>
    </body>
</html>
