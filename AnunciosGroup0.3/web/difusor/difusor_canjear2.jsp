<%-- 
    Document   : difusor_canjear2
    Created on : 21-jun-2015, 22:46:41
    Author     : macbookair
--%>

<%@page import="cl.inacap.model.Cupon"%>
<%@page import="cl.inacap.model.Anuncio"%>
<%@page import="cl.inacap.dao.difusor.DifusorAnunciosDAO"%>
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
        <title>Canjear</title>
    </head>
    <%
        HttpSession session_actual2 = request.getSession(true);
        Anuncio anuncio = (Anuncio) session_actual2.getAttribute("anuncio");
        HttpSession session_actual3 = request.getSession(true);
        Cupon cupon = (Cupon) session_actual3.getAttribute("cupon");
    %>

    <body>
        <%@include file="../base_ag/_menu_difusor.jsp" %>
        <%
            DifusorAnunciosDAO difusoranunciosdao = new DifusorAnunciosDAO();
            int puntos = difusoranunciosdao.contartotalpuntos(difusor);
        %>
        <ul class="nav nav-pills nav-justified menu_anunciante" role="group" style="padding-top: 10%;">
            <li role="presentation"><a href="difusor_inicio.jsp">Inicio</a></li>
            <li role="presentation"><a href="difusor_perfil.jsp">Perfil</a></li>
            <li role="presentation" class="active"><a href="#">Canjear</a></li>
        </ul>

        <div id="panel">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="#">Canjear</a></li>

            </ul>

            <div id="agregar_anuncio" class="contenido">
                <div class="workflow" >
                    <ul class="nav nav-wizard">
                        <li>Paso 1</li>
                        <li class='active'>Paso 2</li>
                        <li>Paso 3</li>
                    </ul>
                </div>
                <hr>
                <div class="row">

                    <div class="row">
                        <div class="col-md-7">
                            <a href="#">
                                <img class="img-responsive img-thumbnail" src="${pageContext.request.contextPath}/images/anunciante/<%= anuncio.getImagen_anuncio()%>" style="width: 300px; height: 300px;" alt="">
                            </a>
                        </div>
                        <div class="col-md-5">
                            <textarea rows="15" cols="50">
                                Términos y Condiciones de Uso y Privacidad 
                                Este Sitio Web www.anunciosgroup.cl (el “Sitio Web”) es operado por  AG S.A. (o “nosotros”) y se encuentra a su disposición para fines publicitarios. Al acceder o utilizar este Sitio Web, usted acepta estos Términos y Condiciones de Uso y Privacidad. Si usted no acepta los Términos y Condiciones de Uso, usted no puede utilizar este Sitio Web. 
                                Uso de Material de este Sitio Web
                                Este Sitio Web (incluyendo todo su contenido) es propiedad de las empresas asociadas a “AnunciosGroup” o de sus licenciantes y está protegido por leyes de derecho de autor, de marcas y otras de Chile y de otros países. Excepto cuando fuera expresamente dispuesto de otro modo, autorizamos a Ud. a consultar este Sitio Web y a compartir o publicar anuncios solamente para uso publicitario, no comercial,  ello en la medida en que Ud. no elimine o remueva cualquier notificación o información de derechos de autor o propiedad intelectual que aparecieran en el material que Ud. Publique o comparta. Ud. acuerda que salvo lo expuesto precedentemente, no usará el material publicado en este Sitio Web como propio, de cualquier manera y/o por cualquier medio. Ud. también acuerda no modificar, vender o cualquier material en el Sitio Web, de cualquier manera o en cualquier medio.
                                Marcas
                                El Sitio Web también puede incluir marcas comerciales o marcas de servicio de terceros. Todas esas marcas comerciales son propiedad de sus respectivos titulares y Ud. acuerda no usar o mostrar las mismas de forma propia sin la autorización previa del propietario de la marca comercial en cuestión.
                                Contenido del Visitante (Anunciante y/o Difusor)
                                La Página Web podría permitir el upload de información, datos, textos, fotografías, ("Contenido"), sea que se fijen públicamente o se transmitan privadamente. En tal caso, dicho Contenido es únicamente responsabilidad de la persona que lo originó. Esto significa que usted (y no AnunciosGroup) es enteramente responsable por todo el Contenido que usted cargue, publique, envíe por correo electrónico, transmita o de cualquier forma ponga a disposición a través del Sitio Web. Nosotros no controlamos el Contenido publicado por Ud. a través del Sitio Web y, por tal motivo, no garantizamos su exactitud, integridad o calidad. No obstante, el Sitio Web contará con un moderador (Administrador de AnunciosGroup) que estará facultado a eliminar el Contenido que le parezca impropio. Asimismo, AnunciosGroup eliminará todo Contenido ante la denuncia de aquellos terceros que se vean afectados y/o lesionados en sus derechos. Bajo ninguna circunstancia AnunciosGroup será responsable en cualquier forma por cualquier Contenido, incluyendo, pero sin limitarse a cualquier error u omisión en cualquier Contenido, o por cualquier pérdida o daño de cualquier tipo ocasionado como resultado del uso de cualquier Contenido publicado, enviado a través de correo electrónico, transmitido o puesto a disposición a través del Sitio Web.
                                Nosotros nos reservamos el derecho de eliminar el acceso y/o uso del Sitio Web a cualquier usuario y/o Cliente que no respete los términos y condiciones establecidos en el presente. Así mismo, nosotros nos reservamos el derecho de eliminar cualquier mensaje que: 
                                • Sea ilegal, peligroso, amenazante, abusivo, hostigador, tortuoso, difamatorio, vulgar, obsceno, calumnioso, invasivo de la privacidad de terceros, odioso, discriminatorio, o que de cualquier forma viole derechos de terceros y/o disposiciones legales aplicables; 
                                • Sea contrario a la moral y las buenas costumbres. 
                                • Ofrezca, venda o de cualquier modo comercialice pornografía de cualquier clase. 





                                Usted se obliga a no utilizar el Sitio Web para lo siguiente:
                                •	Hacerse pasar por alguna persona o entidad de cualquier otra forma falsificar su asociación a alguna persona o entidad; 
                                •	Falsificar encabezados o de cualquier otra forma manipular identificadores para desviar el origen de algún Contenido transmitido por medio del Sitio Web; 
                                •	Cargar ("upload"), publicar, enviar por correo electrónico, transmitir, o de cualquier otra forma poner a disposición algún Contenido del cual no tiene el derecho;
                                •	Cargar, publicar, enviar por correo electrónico, transmitir, o de cualquier otra forma poner a disposición algún Contenido que viole alguna patente, marca, secreto comercial, derecho de autor o cualquier derecho de propiedad ("Derechos") de algún tercero; 
                                •	Cargar, publicar, enviar por correo electrónico, transmitir o de cualquier otra forma poner a disposición cualquier anuncio no solicitado o no autorizado, materiales promocionales, correo no solicitado ("junk mail", "spam"), cartas en cadena ("chain letters”) o cualquier otra forma de solicitud;
                                •	Cargar ("upload"), publicar, enviar por correo electrónico, transmitir, o de cualquier otra forma poner a disposición algún material que contenga virus de software, o cualquier otro código de computadora, archivos o programas diseñados para interrumpir, destruir o limitar el funcionamiento de algún software, hardware o equipo de telecomunicaciones; 
                                •	Interrumpir el flujo normal de diálogo, hacer que una pantalla se mueva ("scroll") más rápido de lo que otros Visitantes pueden manejar, o de cualquier otra forma actuar de manera que afecte negativamente la habilidad de otros Visitantes para vincularse en intercambios de tiempo reales; 
                                •	Interferir o interrumpir el Sitio Web, servidores, o redes conectadas al Sitio Web, o desobedecer cualquier requisito, procedimiento, política o regulación de redes conectadas al Sitio Web; 
                                •	Violar con o sin intención alguna ley local, estatal, nacional o internacional aplicable y cualquier otra regulación; 
                                •	Acechar o de cualquier otra forma hostigar a un tercero; o 
                                •	Colectar o guardar datos personales acerca de otros Visitantes. 
                                •	Publicar datos personales sin el consentimiento de la persona involucrada.
                                Datos personales 
                                Datos personales es cualquier información que permite identificar a un usuario o empresa. Las clases de datos personales que el presente sitio puede recolectar incluyen el nombre y el apellido de la persona o el nombre de la empresa, dirección, número de teléfono, Rut y dirección de correo electrónico (datos no sensibles). El titular de este sitio no recabará ningún dato personal sobre su persona a menos que Ud. voluntariamente lo provea o de otro modo lo permita la normativa aplicable sobre protección de datos personales. En consecuencia, quien provee los datos reconoce que proporciona sus datos en forma absolutamente voluntaria y que los mismos son ciertos. Advertencia (“Phishing”): AnunciosGroup no solicita información de tipo financiera ni bancaria. Todo mensaje que solicite dicha información no proviene de AnunciosGroup. El ingreso de los datos personales implica el consentimiento del usuario y/o Empresa a ceder sus datos y ser parte de la base de datos de AnunciosGroup. Aquellos que deseen tener acceso a sus datos personales y/o eliminarlos de la base de datos, deberán comunicarse con el Administrador del Sitio Web.
  
                            </textarea>
                            <input type="checkbox" id="terminos" onclick="ValidarCheck()" >  Acepto <a href="" >terminos y condiciones.</a>
                        </div>
                        <div class="col-md-5">
                            
                        </div>

                    </div>
                </div>
                <hr>      
                <input type="button" class="btn btn-primary" src="difusor_canjear3.jsp" onclick="location.href = '../difusor/difusor_canjear3.jsp'" id="boton_input" disabled="true" value="Siguiente"> 
            </div>
        </div>
        <%@include file="../base_ag/_pie_pagina.jsp" %> 

        <script>
            /*        
             function ValidarCheck (){
             console.log("Hola mundo");
             console.log($('#terminos').prop('checked',true));
             //if ($('#terminos').prop('checked',true)){
             console.log($('#terminos').checked);
             $('#boton').prop('disabled',false);
             $('#boton_input').prop('disabled',false);
             //}else{   
             //$('#boton').prop('disabled',true);
             //};
             }
             */
            $(document).ready(function () {
                $("#terminos").change(function () {
                    if ($("#terminos").is(':checked')) {
                        $("#boton_input").removeAttr('disabled');
                    } else {
                        $("#boton_input").attr('disabled', 'disabled');
                    }
                });
            });
        </script>
    </body>
</html>
