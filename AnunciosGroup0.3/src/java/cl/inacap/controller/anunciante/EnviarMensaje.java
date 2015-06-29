/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.anunciante;

import cl.inacap.dao.anunciante.MensajeDAO;
import cl.inacap.model.Mensaje;
import java.io.IOException;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
@WebServlet(name = "EnviarMensaje", urlPatterns = {"/EnviarMensaje"})
public class EnviarMensaje extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            Mensaje mensaje = new Mensaje();
            mensaje.setDe(request.getParameter("InputDe"));
            mensaje.setPara(request.getParameter("InputPara"));
            mensaje.setAsunto(request.getParameter("InputAsunto"));
            mensaje.setMensaje(request.getParameter("InputMensaje"));
            mensaje.setNombre_u_anunciante(request.getParameter("InputNombreUAnunciante"));

            MensajeDAO mensajeDao = new MensajeDAO();

            mensajeDao.agregarMensaje(mensaje);

            response.sendRedirect("anunciante/enviar_mensaje.jsp?message=" + URLEncoder.encode("Tu mensaje se ha enviado exitosamente", "UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("anunciante/enviar_mensaje.jsp?message=" + URLEncoder.encode("Error al intentar enviar tu mensaje", "UTF-8"));
        } finally {
            
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
