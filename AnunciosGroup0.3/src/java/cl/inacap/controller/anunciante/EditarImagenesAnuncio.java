/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.anunciante;

import cl.inacap.dao.anunciante.AnuncioDAO;
import cl.inacap.model.Anunciante;
import cl.inacap.utils.UploadFileUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.file.Files;
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
@WebServlet(name = "EditarImagenesAnuncio", urlPatterns = {"/EditarImagenesAnuncio"})
public class EditarImagenesAnuncio extends HttpServlet {

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
            HttpSession session = request.getSession();
            Anunciante anunciante = (Anunciante) session.getAttribute("anunciante");
            String nombreAnunciante = anunciante.getNombre_u_anunciante();
            String archivo = request.getParameter("inputfile").trim();
            String anuncio = request.getParameter("inputIdAnuncio");

            //valido estructura de directorios
            if (UploadFileUtils.validaEstructuraDirectorios(UploadFileUtils.AnunciantePath, nombreAnunciante, anuncio)) {
                //guardo archivo
                Files.createFile(UploadFileUtils.getRuta(UploadFileUtils.AnunciantePath, nombreAnunciante, anuncio, archivo));
                //guardo ruta de archivo en tabla de anuncio
                AnuncioDAO anuncioDao = new AnuncioDAO();
                anuncioDao.actualizaImagenAnuncio(archivo, Integer.parseInt(anuncio));
                response.sendRedirect("anunciante/mis_anuncios.jsp?mensaje=" + URLEncoder.encode("Imagen guardada con exito", "UTF-8"));
            } else {
                System.out.println("error");
                //error al intentar guardar archivo
                response.sendRedirect("anunciante/mis_anuncios.jsp?error=" + URLEncoder.encode("Error al intentar editar imagen de anuncio", "UTF-8"));
            }

            // imageFileName = file.getFileName().toString();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("anunciante/mis_anuncios.jsp?error=" + URLEncoder.encode("Error al intentar editar imagen de anuncio", "UTF-8"));
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
