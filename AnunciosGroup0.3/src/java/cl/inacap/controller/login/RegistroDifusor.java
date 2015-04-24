/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.login;

import cl.inacap.dao.anunciante.AnuncioDAO;
import cl.inacap.dao.difusor.DifusorDAO;
import cl.inacap.model.Difusor;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
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
 * @author zamorator
 */
@WebServlet(name = "RegistroDifusor_1", urlPatterns = {"/RegistroDifusor_1"})
public class RegistroDifusor extends HttpServlet {

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
            if (!request.getParameter("InputPassword").equals("") || !request.getParameter("InputPassword2").equals("")) {
                //validacion password
                if (request.getParameter("InputPassword").equals(request.getParameter("InputPassword2"))) {
                    //validacion username unico
                    DifusorDAO difusorDao = new DifusorDAO();
                    if (difusorDao.ConsultaNombreDifusor(request.getParameter("InputNombreDifusor")) == 0) {
                        Difusor difusor = new Difusor();
                        difusor.setNombre_u_difusor(request.getParameter("InputNombreDifusor"));
                        difusor.setNombres(request.getParameter("InputNombres"));
                        difusor.setApellido_paterno_difusor(request.getParameter("InputApellidoPaterno"));
                        difusor.setApellido_materno_difusor(request.getParameter("InputApellidoMaterno"));
                        difusor.setPassword_difusor(request.getParameter(""));
                        difusor.setEmail_difusor(request.getParameter("InputEmail"));
                        difusor.setId_segmento_edad(1); //request.getParameter("optionsRadiosEdad")
                        difusor.setId_segmento_sexo(2); //request.getParameter("optionsRadiosSexo")
                        difusor.setPassword_difusor(request.getParameter("InputPassword"));

                        difusorDao = new DifusorDAO();
                        difusorDao.AgregaDifusor(difusor);
                        response.sendRedirect("exito.jsp");
                    } else {
                        response.sendRedirect("registro_difusor.jsp?message=" + URLEncoder.encode("Nombre Difusor ya existe", "UTF-8"));
                    }
                } else {
                    response.sendRedirect("registro_difusor.jsp?message=" + URLEncoder.encode("Contrase&ntilde;a no coincide", "UTF-8"));
                }
            } else {
                response.sendRedirect("registro_difusor.jsp?message=" + URLEncoder.encode("Llenar ambos campos de contrase&ntilde;a", "UTF-8"));
            }
        } catch (Exception e) {
            response.sendRedirect("registro_difusor.jsp?message=" + URLEncoder.encode("Error al Intentar Crear Difusor", "UTF-8"));
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
