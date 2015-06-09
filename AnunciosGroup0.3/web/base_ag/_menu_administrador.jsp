<%-- 
    Document   : _menu_administrador
    Created on : 30-mar-2015, 18:45:20
    Author     : macbookair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Menu</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="../css/Estilos_ag.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/social-icons/Logoicon.ico">
</head>
<body>

	<header>
		<div class="login">
			<div class="Logo">
				ANUNCIOSGROUP
			</div>
			<div class="datos_login">
				<p>Administrador</p>
                                
                        </div>
                        <div> 
				<p>Informacion administrador</p>
                        </div>
                    
		</div>
		<div class="menu_bar">
			<a href="#" class="bt-menu"><span class="icon-list2"></span>AnunciosGroup</a>
		</div>
		<nav class="Menu">
                    <a class="navbar-brand" href="../AnunciosGroup0.3/newjsp.jsp">
                                <span>
                                    <img src="/AnunciosGroup0.3/img/AG logo.png" height="30" width="30">
                                </span>
                                <span>
                                    AnunciosGroup
                                </span>
                            </a>
			<ul>
				<li><a href="../administrador/admin_anuncios.jsp"><span class="icon-house"></span>Anuncios</a></li>
				<li><a href="../administrador/admin_empresas.jsp"><span class="icon-suitcase"></span>Empresas</a></li>
                                <li><a href="../administrador/admin_perfil.jsp"><span class="icon-earth"></span>Perfil</a></li>
			</ul>
		</nav>
	</header>
</body>	
</html>