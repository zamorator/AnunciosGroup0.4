

$(window).scroll(function(){   
    if ($(window).scrollTop() === $(document).height() - $(window).height()){
        console.log("xapalapaxala");
        var cantidad = $('#cantidadanuncios').val();
        var nombre_difusor = $('#nombre_difusor').val();
        $.get("../TraeAnuncios",{in_cantidad:cantidad, in_nombre_difuor:nombre_difusor},function(res){
            var json = res;
            var data = JSON.parse(json);
            console.log(data.length + " cantidad arrays  ");
            for(f=0;f<data.length;f++)
                {  
                 var cantidad_anterior= cantidad;
                 var anuncios_nuevos='                    <div class="col-sm-6 col-md-4" id="desdeaqui'+ cantidad  +'">'+
                                                        '<div class="thumbnail" id="anuncios">'+
                                                            '<img class="img-responsive" id="img_anuncios"  src="../img/anuncios/' + data[f].imagen_anuncio +'" >'+
                                                            '<div class="caption">'+
                                                              '<h3>'+ data[f].nombre_anuncio   +'</h3>'+

                                                             '<!--VENTANA MODAL INICIO -->'+
                                                             '<form method="POST" action="/AnunciosGroup0.3/PublicarCanjear">'+
                                                                '<button type="button" class="btn btn-primary btn-lg" data-toggle="modal"  data-target="#'+data[f].codigo_anuncio+'">Detalle</button>'+
                                                                    '<div class="modal fade"  id="'+data[f].codigo_anuncio+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
                                                                        '<div class="modal-dialog">'+
                                                                        '<div class="modal-content">'+
                                                                             '<div class="modal-header">'+
                                                                                 '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
                                                                                 '<h4 class="modal-title" id="myModalLabel"> <h3>'+data[f].nombre_anuncio +'</h3></h4>'+
                                                                                 '<input type="hidden" name="codigoanuncio" value="'+data[f].codigo_anuncio+'">'+
                                                                            '</div>'+
                                                                            '<div class="modal-body">'+
                                                                                '<img class="img-responsive" src="../img/anuncios/' + data[f].imagen_anuncio +'" >'+
                                                                                '<p>Esta es una pequeña descripcion del anuncio.</p>'+
                                                                                '<input type="checkbox"  name ="favorito" class="click" onclick="clickCheck('+data[f].codigo_anuncio+' , ' +'&quot;' + nombre_difusor+'&quot;'+')" > Agregar a Favorito'+
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


