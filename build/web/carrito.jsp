<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VentaDeAbarrotesenLinea</title>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">VDAL<img src="Img/tiendaonline.png" alt=""/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="Controlador?accion=home">Home <span class="sr-only">(current)</span></a>
                        </li>
                            <a class="nav-link " href="Controlador?accion=home" style="color: lime">seguir comprando</a>
                        
                    </ul>
                                <form class="form-inline my-2 my-lg-0">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                                        <button class="btn  my-2 my-sm-0" type="submit"><img src="Img/la-busqueda-de-empleo.png" alt=""/></button>
                                </form>
                    
  </div>
</nav>
    <div class="container mt-4">
        <h3>Carrito</h3>
        <br>
        <div class="row">
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ITEM</th>
                            <th>NOMBRES</th>
                            <th>DESCRIPCION</th>
                            <th>PRECIO</th>
                            <th>CANT</th>
                            <th>STOCK</th>
                            <th>SUBTOTAL</th>
                            <th>ACCION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="car" items="${carrito}">
                         <tr>
                            <td>${car.getItem()}</td>
                            <td>${car.getNombres()}</td>
                            <td>${car.getDescripcion()}
                                <img src="ControladorIMG?id=${car.getIdProducto()}" width="100" height="100">
                            </td>
                            <td>${car.getPrecioCompra()}</td>
                            <td>${car.getCantidad()}</td>
                            <td>30</td>
                            <td>${car.getSubTotal()}</td>
                            <td>
                                <input type="hidden" id="idp" value="${car.getIdProducto()}">
                                <a href="#" id="btnDelete"><img src="Img/borrar.png" alt=""/></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-sm-4">
                <div class="card">
                    <div class="card-header">
                        <h3>Generar Compra</h3>
                    </div>
                    <div class="card-body">
                        <label>Subtotal:</label>
                        <input type="text" value="$${totalPagar}0" readonly="" class="form-control">
                        <label>IVA:</label>
                        <input type="text" value="%15.0" readonly="" class="form-control">
                        <label>Total Pagar:</label>
                        <input type="text" value="$${totalPagar}0" readonly="" class="form-control">
                    </div>
                    <div class="card-footer">
                            <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                                <input type="hidden" name="cmd" value="_s-xclick">
                                <input type="hidden" name="hosted_button_id" value="V5ASRP3FJKJ2S">
                                <input type="image" src="https://www.paypalobjects.com/es_XC/MX/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="PayPal, la forma más segura y rápida de pagar en línea.">
                                <img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="3" height="3">
                            </form>
                    </div>
            </div>
        </div>
    </div>
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
                        <script src="js/funciones.js" type="text/javascript"></script>
                        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
    </body>
</html>
