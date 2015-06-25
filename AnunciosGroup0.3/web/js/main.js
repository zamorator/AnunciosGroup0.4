//$(document).ready(main);
 
//var contador = 1;
 
//function main () {
//	$('.menu_bar').click(function(){
//		if (contador == 1) {
//			$('nav').animate({
//				left: '0'
//			});
//			contador = 0;
//		} else {
//contador = 1;
//			$('nav').animate({
//				left: '-100%'
//			});
//		}
//	});
//}

$(function (){
    
    var app_id='428447157327741'; //app_id de la aplicacion en facbook
    var scopes='email, user_friends, public_profile'; // Alcances y permisos para perfil de face (que prodra ver etc..)
    
    var btn_login='<a href="#" id="login" class="btn btn-primary" >Vincular Facebook </a>';
    
    var div_session=' <div id="facebook-session">'+
            '<strong></strong>'+
            '<img>'+
            '<a href="#" id="logout" class="btn btn-danger"> Desvincular <a/>'+
            '</div>';
    
    //SE CONECTA AL SDK CON LOS PARAMETROS
    window.fbAsyncInit = function() {
        console.log(app_id);
        FB.init({
          appId      : app_id,
          cookie     : true,
          status     : true, 
          xfbml      : true,  
          version    : 'v2.2' 
         
        });

        // VERIFICA SI YA ESTA CONECTADO A FACEBOOK
        FB.getLoginStatus(function(response) {
          statusChangeCallback(response, function(){
              
          });
        });

    };
        // LLAMADA DESDE LOGIN ESTATUS PARA VERIFICACION DE CONECCION
    var statusChangeCallback= function(response, callback) {
            console.log(response);

        if (response.status === 'connected') {
            getFacebookData();
        } else {
            callback(false);
        }
    };
    
 
    
    var checkLoginState = function(callback) {
        FB.getLoginStatus(function(response) {
           statusChangeCallback(response, function(data){
              callback(data);
          });
        });
    };
    
    
    var getFacebookData = function(){
        
      FB.api('/me',function(response){
          $('#login').after(div_session);
          $('#login').remove();
          //$('#facebook-session strong').text("Bienvenido :" + response.name);
          $("#Facebook-nombre").val(response.name);
          $("#Facebook-id").val(response.id);
          //$('#facebook-session img').attr('src','http://graph.facebook.com/' + response.id + '/picture?type=large');
      });
    };
    
    // VERIFICA LA SESION DE FACEBOOK PARA SI ESTA INICIADA RESCATAR LOS PARAMETROS
    var facebookLogin = function(){
        checkLoginState(function(response){
            if(!response){
              FB.login(function(response){
                    if(response.status === 'connected')
                        getFacebookData();
              }, {scopes: scopes});
            };
        });
    };
    
    
    var facebookLogout = function(){
        FB.getLoginStatus(function(response) {
            console.log("Hola");
            if (response.status === 'connected'){
                console.log("Hola1");
             FB.logout(function(response){
                 console.log("Hola");
                 $('#facebook-session').before(btn_login);
                 $('#facebook-session').remove();
             }); 
                
            };
        });
    };
    
    
    //EVENTO CLICK EN BOTON VINCULAR FACEBOOK
    $(document).on('click','#login', function(e){
        e.preventDefault();
        
        facebookLogin();
    });
    
    $(document).on('click','#logout', function(e){
        e.preventDefault();
         
        if(confirm("¿Esta Seguro?")){ 
         
            facebookLogout();
            $('#Facebook-nombre').val("");
        }else{
          return false;  
      };
    });
    
});

