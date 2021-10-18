package com.tienda.controlador;

import com.tienda.modelo.Carrito;
import com.tienda.modelo.Persona;
import com.tienda.modelo.PersonaDAO;
import com.tienda.modelo.Producto;
import com.tienda.modelo.ProductoDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controlador extends HttpServlet {
    
    ProductoDAO pdao=new ProductoDAO();
    Producto p=new Producto();
    List<Producto> productos=new ArrayList<>();
    
    List<Carrito> listaCarrito=new ArrayList<>();
    int item;
    double totalPagar=0.0;
    int cantidad=1;
    
    
    PersonaDAO dao=new PersonaDAO();
    Persona pa=new Persona();
    
    
    int r;
    int  ipd;
    Carrito car;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion=request.getParameter("accion");
        if(accion.equals("Ingresar")){
            String nom = request.getParameter("txtnom");
            String email = request.getParameter("txtEmail");
            pa.setNom(nom);
            pa.setEmail(email);
            r=dao.validar(pa);
            if(r==1){
                request.getRequestDispatcher("iniciar.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
            
        productos=pdao.listar();
        switch (accion){
            case "Comprar":
                totalPagar=0.0;
                int idp;
                idp = Integer.parseInt(request.getParameter("id"));
                p=pdao.listarId(idp);
                item=item+1;
                car=new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombres());
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad*p.getPrecio());
                listaCarrito.add(car);
                for (int i=0;i<listaCarrito.size();i++){
                    totalPagar=totalPagar+listaCarrito.get(i).getSubTotal();
                }
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;
            case "AgregarCarrito":
                int pos=0;
                cantidad=1;        
                idp=Integer.parseInt(request.getParameter("id"));
                p=pdao.listarId(idp);
                if (listaCarrito.size()>0){
                    for(int i = 0;i< listaCarrito.size() ;i++){
                        if(idp==listaCarrito.get(i).getIdProducto()){
                            pos=i;
                        }
                    }
                    if(idp==listaCarrito.get(pos).getIdProducto()){
                        cantidad=listaCarrito.get(pos).getCantidad()+cantidad;
                        double subtotal=listaCarrito.get(pos).getPrecioCompra()*cantidad;
                        listaCarrito.get(pos).setCantidad(cantidad);
                        listaCarrito.get(pos).setSubTotal(subtotal);
                    }else{
                    item=item+1;
                    car=new Carrito();
                    car.setItem(item);
                    car.setIdProducto(p.getId());
                    car.setNombres(p.getNombres());
                    car.setDescripcion(p.getDescripcion());
                    car.setPrecioCompra(p.getPrecio());
                    car.setCantidad(cantidad);
                    car.setSubTotal(cantidad*p.getPrecio());
                    listaCarrito.add(car);
                    }
                }else{
                item=item+1;
                car=new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombres());
                car.setDescripcion(p.getDescripcion());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad*p.getPrecio());
                listaCarrito.add(car);    
                }
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;
            case "Delete":
                int idproducto=Integer.parseInt(request.getParameter("idp"));
                for (int i = 0;i < listaCarrito.size(); i++){
                    if(listaCarrito.get(i).getIdProducto()==idproducto){
                        listaCarrito.remove(i);
                    }
                }
            case "Carrito":
                totalPagar=0.0;
                request.setAttribute("carrito", listaCarrito);
                for (int i=0;i<listaCarrito.size();i++){
                    totalPagar=totalPagar+listaCarrito.get(i).getSubTotal();
                }   
                request.setAttribute("totalPagar",totalPagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
