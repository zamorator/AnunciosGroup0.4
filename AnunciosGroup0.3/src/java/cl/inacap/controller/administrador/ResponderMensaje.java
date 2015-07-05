/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.administrador;

import cl.inacap.dao.administrador.AdministradorDAO;
import cl.inacap.model.Administrador;
import cl.inacap.model.Mensaje;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Javoru
 */
@WebServlet(name = "TraerMensaje", urlPatterns = {"/TraerMensaje"})
public class ResponderMensaje extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            HttpSession sesion = request.getSession();
            Administrador administrador = (Administrador) sesion.getAttribute("administrador");
         
            Mensaje mensaje = new Mensaje();// creaar objeto mensaje 
            mensaje.setMensaje(request.getParameter("InputMensaje"));
            mensaje.setAsunto(request.getParameter("InputAsunto"));
            mensaje.setNombre_u_anunciante(request.getParameter("InputEmpresa"));
            mensaje.setCodigo_administrador(administrador.getCodigo_administrador());
            mensaje.setPara(request.getParameter("InputEmpresa"));
            mensaje.setNombre_administrador(administrador.getNombre_administrador());
            AdministradorDAO respuesta = new AdministradorDAO();
            //administradordao.respondermensaje(request.getParameter("in_mensaje"));
            //administradordao.respondermensaje(request.getParameter("in_nombre_u_anunciante"));
            //administradordao.respondermensaje(request.getParameter("in_asunto"));
            respuesta.respondermensaje(mensaje); //responder obtiene los valores
            
            
            
            response.sendRedirect("administrador/admin_empresas.jsp");
            
            
        } finally {
            out.close();
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ResponderMensaje.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ResponderMensaje.class.getName()).log(Level.SEVERE, null, ex);
        }
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
