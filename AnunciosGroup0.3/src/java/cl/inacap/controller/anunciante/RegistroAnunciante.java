/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.anunciante;

import cl.inacap.dao.anunciante.AnuncianteDAO;
import cl.inacap.dao.anunciante.ComunaDAO;
import cl.inacap.model.Anunciante;
import cl.inacap.model.Comuna;
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

/**
 *
 * @author zamorator
 */
@WebServlet(name = "RegistroAnunciante", urlPatterns = {"/RegistroAnunciante"})
public class RegistroAnunciante extends HttpServlet {

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
            AnuncianteDAO anuncianteDao = new AnuncianteDAO();
            //valido no coincida nombre
            if (anuncianteDao.ConsultaNombreAnunciante(request.getParameter("InputNombreUAnunciante")) == 0) {
                //valido passwords
                if (request.getParameter("InputPassword").equals(request.getParameter("InputPassword2"))) {
                    Anunciante anunciante = new Anunciante();
                    anunciante.setNombre_u_anunciante(request.getParameter("InputNombreUAnunciante"));
                    anunciante.setNombre_anunciante(request.getParameter("InputNombreAnunciante"));
                    anunciante.setDireccion_anunciante(request.getParameter("InputDireccionAnunciante"));
                    anunciante.setId_comuna(Integer.parseInt(request.getParameter("selectComuna")));
                    anunciante.setPassword_anunciante(request.getParameter("Inputpassword"));

                    anuncianteDao.AgregaAnunciante(anunciante);
                    response.sendRedirect("registro_anunciante.jsp?susses=" + URLEncoder.encode("Se ha creado exitosamente un nuevo Anunciante", "UTF-8"));
                } else {
                    response.sendRedirect("registro_anunciante.jsp?message=" + URLEncoder.encode("Passwords no coinciden", "UTF-8"));
                }
            } else {
                response.sendRedirect("registro_anunciante.jsp?message=" + URLEncoder.encode("Usuario ya Existe", "UTF-8"));
            }
        } catch (Exception e) {
            response.sendRedirect("registro_anunciante.jsp?message=" + URLEncoder.encode("Error al intentar registrar nuevo Anunciante", "UTF-8"));
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
