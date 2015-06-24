/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.anunciante;

import cl.inacap.dao.anunciante.AnuncioDAO;
import cl.inacap.model.Anunciante;
import cl.inacap.utils.UploadFileUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
            String idAnuncio = (String) session.getAttribute("id_anuncio");

            //valido estructura de directorios
            if (UploadFileUtils.validaEstructuraDirectorios(UploadFileUtils.AnunciantePath, nombreAnunciante, idAnuncio)) {
                //guardo archivo

                String ubicacionArchivo = UploadFileUtils.getRuta(UploadFileUtils.AnunciantePath, nombreAnunciante, idAnuncio).toString();
                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(1024);
                factory.setRepository(new File(ubicacionArchivo));

                ServletFileUpload upload = new ServletFileUpload(factory);

                List<FileItem> partes = upload.parseRequest(request);

                for (FileItem item : partes) {
                    File file = new File(ubicacionArchivo, item.getName());

                    try {

                        item.write(file);
                        String nombrearchivos = file.getName();
                        //guardo ruta de archivo en tabla de anuncio
                        AnuncioDAO anuncioDao = new AnuncioDAO();
                        String cadena = nombreAnunciante + "/" + idAnuncio + "/" + nombrearchivos;
                        anuncioDao.actualizaImagenAnuncio(cadena, Integer.parseInt(idAnuncio));

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }

                response.sendRedirect("anunciante/editar_imagenes_anuncio.jsp?mensaje=" + URLEncoder.encode("Imagen guardada con exito", "UTF-8"));
            } else {
                System.out.println("error");
                //error al intentar guardar archivo
                response.sendRedirect("anunciante/editar_imagenes_anuncio.jsp?mensaje=" + URLEncoder.encode("Error al intentar editar imagen de anuncio", "UTF-8"));
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
