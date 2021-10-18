$(document).ready(function (){
    $("tr #btnDelete").click(function (){
        var idp=$(this).parent().find("#idp").val();
        Swal.fire({
                title: 'Estas Seguro de Eliminar?',
                text: "Ud puede agregar de nuevo!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, Borrar!'
              }).then((result)=>{
                if (result.value){
                    eliminar(idp);
                    parent.location.href="Controlador?accion=carrito";
                  Swal.fire(
                    'Eliminado!',
                    'Producto Eliminado.',
                    'success'
                  )
                };
              });
    });
    function eliminar(idp){
        var url="Controlador?accion=Delete";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp="+idp,
            success: function (data,textStatus,jqXHR){
        
            }
        });
    }
});

