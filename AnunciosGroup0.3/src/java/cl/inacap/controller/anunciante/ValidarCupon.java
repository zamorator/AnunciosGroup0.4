/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.anunciante;

import cl.inacap.dao.anunciante.AnuncianteDAO;
import cl.inacap.dao.difusor.DifusorAnunciosDAO;
import cl.inacap.model.Cupon;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author macbookair
 */
@WebServlet(name = "ValidarCupon", urlPatterns = {"/ValidarCupon"})
public class ValidarCupon extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            DifusorAnunciosDAO dad = new DifusorAnunciosDAO();
            AnuncianteDAO adad = new AnuncianteDAO();
            Cupon cupon = new Cupon();
            cupon = dad.buscarcupon(Integer.parseInt(request.getParameter("id_cupon")));
            
            boolean resp = adad.validarcupon(Integer.parseInt(request.getParameter("id_cupon")),request.getParameter("nombre_u_anunciante"));
            
            System.out.println("es"+resp);
            if (resp == true){
                response.sendRedirect("anunciante/validar_cupones.jsp?mensajeexito=" + URLEncoder.encode("Cupón validado con exito.", "UTF-8"));
            }else{
                response.sendRedirect("anunciante/validar_cupones.jsp?mensajeerror=" + URLEncoder.encode("El numero de cupón ingresado no es valido o es un cupón ya canjeando.", "UTF-8"));
            }
            
            
        } catch (Exception e) {
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
