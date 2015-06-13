/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.login;

import cl.inacap.dao.anunciante.AnuncianteDAO;
import cl.inacap.model.Anunciante;
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
 * @author zamorator
 */
@WebServlet(name = "LoginAnunciante", urlPatterns = {"/LoginAnunciante"})
public class LoginAnunciante extends HttpServlet {

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
            AnuncianteDAO anuncianteDAO = new AnuncianteDAO();
            Anunciante anValidación = anuncianteDAO.ConsultaIngresoAnunciante(request.getParameter("InputNombreUAnunciante"));
            if (anValidación != null) {
                if (anValidación.getEstado_anunciante().equals("V")) { //es válido
                    Anunciante anunciante = anuncianteDAO.IniciarSesionAnunciante(request.getParameter("InputNombreUAnunciante"), request.getParameter("InputPassword"));
                    HttpSession session_actual = request.getSession(true);
                    session_actual.setAttribute("anunciante", anunciante);
                    response.sendRedirect("anunciante/mis_anuncios.jsp");
                } else{
                    //no es valido, comunicarse con admin
                    response.sendRedirect("ingreso_anunciante.jsp?message=" + URLEncoder.encode("Usuario aun no validado por administradores, favor contactarse con su administrador ", "UTF-8"));
                }
            } else{
                //no existe, crear o comunicar con admin
                response.sendRedirect("ingreso_anunciante.jsp?message=" + URLEncoder.encode("Usuario no existe, favor crear nuevo anunciante", "UTF-8"));
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ingreso_anunciante.jsp?message=" + URLEncoder.encode("Usuario y contrase&ntilde;a no coinciden", "UTF-8"));
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
