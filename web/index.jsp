<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VentaDeAbarrotesenLinea Page</title>
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
                        <li class="nav-item">       
                            <a class="nav-link " href="Controlador?accion=Carrito"  style="color: lime"><i class="fas fa-cart-plus"></i>En el carrito <label style="color: lawngreen">(${contador}) artículos</label></a>
                        </li>
                    </ul>
                                <form class="form-inline my-2 my-lg-0">
                                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                                    <button class="btn my-2 my-sm-0" type="submit"><img src="Img/la-busqueda-de-empleo.png" alt=""/></button>
                                </form>
                            <div class="dropdown">
                                <a  style="color: white" href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Cerrar Sesion</a>
                                <div class="dropdown-menu text-center">
                                    <a><img src="Img/usuario.png" height="80" width="80"></a>
                                    <a>User</a>
                                    <a>example@hotmail.com</a>
                                    <div class="dropdown-divider"></div>
                                    <a  href="iniciar.jsp" class="dropdown-item">Salir</a>
                                </div>
                            </div>
                        </nav>
             
    <div class="container mt-2">
        <div class="row">
            <c:forEach var="p" items="${productos}">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <h5>${p.getNombres()}</h5>
                        </div>
                        <div class="card-body">
                            <i>$${p.getPrecio()}</i>
                            <img src="ControladorIMG?id=${p.getId()}" width="200" height="180" >
                        </div>
                        <div class="card-footer text-center">
                            <label>${p.getDescripcion()}</label>
                            <div>
                                <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn-outline-info"><img src="Img/tienda-online (1).png" alt=""/> Agregar a carrito</a>
                                <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>                   
                            </div>
                        </div>
                    </div> 
                </div>             
            </c:forEach>
            <br>
        </div>
    </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
