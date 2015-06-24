<%-- 
    Document   : pruebas_publicar
    Created on : 24-jun-2015, 1:44:36
    Author     : macbookair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
</head>
<body>
    
   <script type="text/javascript">
<!--
//nuevo face share btn
$(document).ready(function(){
	$('#share_button').click(function(e){          
		e.preventDefault();
		var url='https://www.pcfactory.cl/producto/'+19037+'';
		var titulo='MSI Notebook Gamer GT80 TITAN SLI Intel Core i7-4720HQ 16GB 256GB SSD SuperRaid + 1TB 18.4" Full HD NVIDIA GTX980M x 2 SLI 8GB Teclado mecánico Windows 8.1';
		
		FB.ui(
		{
			method: 'feed',
			name: titulo,
			link: url,
			picture: 'https://www.pcfactory.cl/foto/19037/1_200.jpg',
			caption: 'PC Factory, La cadena de tiendas especializada en tecnología más grande del país.',
			description: 'PCFactory.cl',
			message: 'asdasdasd'
		});
		
			
	});
	
	
});






//-->
</script>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.3&appId=1596591600595494";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<a href="#" id="share_button" style="text-decoration: none; margin-right: -4px; margin-left: -3px;">
			<img src="/img/interface/facebook.png" alt="Facebook" width="16" height="16" hspace="1" border="0">asdas
			</a>
</body>
</html>
