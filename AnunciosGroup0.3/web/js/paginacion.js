

$(window).scroll(function(){   
    if ($(window).scrollTop() === $(document).height() - $(window).height()){
        console.log("xapalapaxala");
        var cantidad = $('#cantidadanuncios').val();
        var ruta = $('#ruta').val();
        var nombre_difusor = $('#nombre_difusor').val();
        console.log(nombre_difusor);
        var favorito = "";
        $.get("../TraeAnuncios",{in_cantidad:cantidad, in_nombre_difusor:nombre_difusor},function(res){
            var json = res;
            console.log(json);
            var data = JSON.parse(json);
            console.log(data.length + " cantidad arrays  ");
            for(f=0;f<data.length;f++)
                {  
                 var cantidad_anterior= cantidad;
                 var anuncios_nuevos='                    <div class="col-sm-6 col-md-4" id="desdeaqui'+ cantidad  +'">'+
                                                        '<div class="thumbnail" id="anuncios">'+
                                                            '<img class="img-responsive img-thumbnail" id="img_anuncios"  src="'+ ruta +'/images/anunciante/' + data[f].imagen_anuncio +'" >'+
                                                            '<div class="caption">';
                                                              
                        //---------------Nuevo inicio                                        
                                            if(data[f].nombre_anuncio.length <= 23){ 
                                                anuncios_nuevos = anuncios_nuevos + '<h4><a href="#">'+data[f].nombre_anuncio+' </a>'+
                                                '</h4>';
                                            }else{
                                                anuncios_nuevos = anuncios_nuevos +'<h4><a href="#">' + data[f].nombre_anuncio.substring(0, 23)+' ...</a></h4>';
                                            }
 anuncios_nuevos = anuncios_nuevos +'<div class="ratings">'+
                                    '<p class="pull-right" style="color: red;"> Hasta ' + data[f].porcentaje_descuento+ '%</p>'+
                                    '<p>';
                                    if(data[f].porcentaje_descuento  > 0 && data[f].porcentaje_descuento <= 10) {
                                     anuncios_nuevos = anuncios_nuevos +'<span class="glyphicon glyphicon-star"></span>';
                                    }
                                    if(data[f].porcentaje_descuento > 10 && data[f].porcentaje_descuento <=50) {
                                     anuncios_nuevos = anuncios_nuevos +'<span class="glyphicon glyphicon-star"></span>'+
                                    '<span class="glyphicon glyphicon-star"></span>'+
                                    '<span class="glyphicon glyphicon-star"></span>';
                                    }
                                    if(data[f].porcentaje_descuento   > 50 && data[f].porcentaje_descuento <100) {
                                     anuncios_nuevos = anuncios_nuevos +'<span class="glyphicon glyphicon-star"></span>'+
                                    '<span class="glyphicon glyphicon-star"></span>'+
                                    '<span class="glyphicon glyphicon-star"></span>'+
                                    '<span class="glyphicon glyphicon-star"></span>'+
                                    '<span class="glyphicon glyphicon-star"></span>';
                                    }
             anuncios_nuevos = anuncios_nuevos +'</p>'+
                                                '</div>'+
                                                '<h4 class="pull-right">$'+ data[f].valor_real +'</h4>';                            
                        //------------------Nuevo fin
                       anuncios_nuevos = anuncios_nuevos + '<!--VENTANA MODAL INICIO -->'+
                                                             '<form method="POST" action="/AnunciosGroup0.3/PublicarCanjear">'+
                                                                '<button type="button" class="btn btn-primary" data-toggle="modal"  data-target="#'+data[f].codigo_anuncio+'">Detalle</button>'+
                                                                    '<div class="modal fade"  id="'+data[f].codigo_anuncio+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
                                                                        '<div class="modal-dialog">'+
                                                                        '<div class="modal-content">'+
                                                                             '<div class="modal-header">'+
                                                                                 '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
                                                                                 '<h4 class="modal-title" id="myModalLabel"> <h3>'+data[f].nombre_anuncio +'</h3></h4>'+
                                                                                 '<input type="hidden" name="codigoanuncio" value="'+data[f].codigo_anuncio+'">'+
                                                                            '</div>'+
                                                                            '<div class="modal-body">'+
                                                                                '<img class="img-responsive img-thumbnail" src="'+ ruta +'/images/anunciante/' + data[f].imagen_anuncio +'" >'+
                                                                                '<p>'+ data[f].descripcion_anuncio+'</p>';
                                                                                
                                                                                if(data[f].favorito  === 1){
                                                                                    console.log("es" +favorito );
                                                                                    favorito = "checked";
                                                                                }else{
                                                                                    favorito="";
                                                                                };
                                                                                
                                 anuncios_nuevos = anuncios_nuevos +    '<input type="checkbox"  name ="favorito" class="click" onclick="clickCheck('+data[f].codigo_anuncio+' , ' +'&quot;' + nombre_difusor+'&quot;'+')"'+ favorito+' > Agregar a Favorito'+
                                                                            '</div>'+
                                                                            '<div class="modal-footer">'+
                                                                                '<input type="submit" class="btn btn-default" name="canjear" data-dismiss="modal" value="Canjear">'+
                                                                                '<input type="submit" class="btn btn-primary" name="publicar"value="Publicar">'+
                                                                            '</div>'+
                                                                        '</div>'+
                                                                        '</div>'+
                                                                    '</div>'+
                                                               '</form> '+
                                                            '<!--VENTANA MODAL FIN -->'+
                                                                '</div>                          '+
                                                            '</div>'+
                                                        '</div>';
                
                 var cantidadvalor = $('#cantidadanuncios').val();
                 $('#cantidadanuncios').val(parseInt(cantidadvalor) + 1);
                 $('#desdeaqui'+ (parseInt(cantidad_anterior)-1) +'').after(anuncios_nuevos);
                 cantidad = parseInt(cantidad) +1;
                 cantidad_anterior = parseInt(cantidad_anterior) +1;
                 
                }
            
        });
    };

});


