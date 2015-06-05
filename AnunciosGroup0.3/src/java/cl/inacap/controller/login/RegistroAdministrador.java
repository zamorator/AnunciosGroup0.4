/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.login;

import cl.inacap.dao.administrador.AdministradorDAO;
import cl.inacap.model.Administrador;
import cl.inacap.model.Anunciante;
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
@WebServlet(name = "RegistroAdministrador", urlPatterns = {"/RegistroAdministrador"})
public class RegistroAdministrador extends HttpServlet {

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
            
            
          //Instancia la clase administrador
          Administrador administrador = new Administrador();
          //RESCATO PARAMETROS DEL FORMULARIO,
          administrador.setNombre_u_administrador(request.getParameter("InputNombreUAdministrador"));
          administrador.setNombre_administrador(request.getParameter("InputNombre"));
          administrador.setApellido_paterno_administrador(request.getParameter("InputApellidoPaterno"));
          administrador.setApellido_materno_administrador(request.getParameter("InputApellidoMaterno"));
          administrador.setEmail_administrador(request.getParameter("InputEmail"));
          administrador.setPassword_administrador(request.getParameter("InputPassword"));
          
          //se llama al acceso a datos (se instancia)
          AdministradorDAO administradorDAO = new AdministradorDAO();
          // llamarr al metodo de la clase
          administradorDAO.AgregarAdministrador(administrador);
          
          
          response.sendRedirect("exito.jsp");
          
          
        }catch (Exception e){
            // si hay una excepcion , manda la excepcion (trasa)
        e.printStackTrace();
        }
        finally {
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
            Logger.getLogger(RegistroAdministrador.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RegistroAdministrador.class.getName()).log(Level.SEVERE, null, ex);
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
