/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.difusor;

import cl.inacap.dao.difusor.DifusorDAO;
import cl.inacap.model.Difusor;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
 * @author macbookair
 */
@WebServlet(name = "ActualizarPerfil", urlPatterns = {"/ActualizarPerfil"})
public class ActualizarPerfil extends HttpServlet {

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
            
            Difusor difusor = new Difusor();
            difusor.setNombre_u_difusor(request.getParameter("inputNombreusuario"));
            difusor.setPassword_difusor(request.getParameter("inputPassword"));
            
            DifusorDAO difusordao = new DifusorDAO();
            
            
            difusor = difusordao.IniciaSesionDifusor(difusor.getNombre_u_difusor(), difusor.getPassword_difusor());
            
            
            if (difusor != null){
            difusor.setNombres(request.getParameter("inputNombres"));
            difusor.setApellido_paterno_difusor(request.getParameter("inputApellidoPaterno"));
            difusor.setApellido_materno_difusor(request.getParameter("inputApellidoMaterno"));
            difusor.setEmail_difusor(request.getParameter("inputCorreo"));   
            difusor = difusordao.ActualizarPerfilDifusor(difusor);
            HttpSession session_actual = request.getSession(true);
            session_actual.setAttribute("difusor", difusor);
            //session_actual.setAttribute("mensaje", "Exito al actualizar perfil.");
           // response.sendRedirect("difusor/difusor_perfil.jsp");
            response.sendRedirect("difusor/difusor_perfil.jsp?mensajeexito=" + URLEncoder.encode("Perfil actualizado exitosamente.", "UTF-8"));
            }else{
            // HttpSession session_actual = request.getSession(true);   
            // session_actual.setAttribute("mensaje", "Error al actualizar perfil");
            // response.sendRedirect("difusor/difusor_perfil.jsp");
            response.sendRedirect("difusor/difusor_perfil.jsp?mensajeerror=" + URLEncoder.encode("Error a actualizar perfil.", "UTF-8"));    
            }
            //System.out.println(resp+"respuesta serlvet");
            /*
            request.setAttribute("respuesta", resp);
            request.getRequestDispatcher("difusor/difusor_perfil.jsp").forward(request, response);
            */
        
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
            Logger.getLogger(ActualizarPerfil.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ActualizarPerfil.class.getName()).log(Level.SEVERE, null, ex);
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
