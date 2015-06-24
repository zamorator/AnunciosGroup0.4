/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.anunciante;

import cl.inacap.dao.anunciante.AnuncianteDAO;
import cl.inacap.dao.anunciante.AnuncianteGiroDAO;
import cl.inacap.dao.giro.GiroDAO;
import cl.inacap.model.Anunciante;
import cl.inacap.model.AnuncianteGiro;
import cl.inacap.model.Giro;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
@WebServlet(name = "ActualizarAnunciante", urlPatterns = {"/ActualizarAnunciante"})
public class ActualizarAnunciante extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Anunciante anunciante = new Anunciante();
            anunciante.setNombre_u_anunciante(request.getParameter("InputNombreUAnunciante"));
            anunciante.setNombre_anunciante(request.getParameter("InputNombreAnunciante"));
            anunciante.setDireccion_anunciante(request.getParameter("InputDireccionAnunciante"));
            anunciante.setId_comuna(Integer.parseInt(request.getParameter("selectComuna")));
            anunciante.setPassword_anunciante(request.getParameter("InputPasswordAnunciante"));
            anunciante.setEmail_anunciante(request.getParameter("InputEmailAnunciante"));
            AnuncianteDAO anuncianteDao = new AnuncianteDAO();
            anuncianteDao.ActualizaAnunciante(anunciante);

            AnuncianteGiro anuncianteGiro = new AnuncianteGiro();
            anuncianteGiro.setNombre_u_anunciante(anunciante.getNombre_u_anunciante());
            anuncianteGiro.setCodigo_giro(Integer.parseInt(request.getParameter("selectGiro")));
            AnuncianteGiroDAO anuncianteGiroDao = new AnuncianteGiroDAO();
            anuncianteGiroDao.actualizaAnuncianteGiro(anuncianteGiro);

            GiroDAO giroDao = new GiroDAO();
            Giro giro = giroDao.buscaGiro(anuncianteGiro.getCodigo_giro());
            HttpSession session_actual = request.getSession(true);
            session_actual.setAttribute("anunciante", anunciante);
            session_actual.setAttribute("giro", giro);

            response.sendRedirect("anunciante/perfil.jsp?message=" + URLEncoder.encode("Perfil Actualizado", "UTF-8"));
        } catch (Exception ex) {
            response.sendRedirect("anunciante/perfil.jsp?message=" + URLEncoder.encode("Error al Actualizar Perfil", "UTF-8"));
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
