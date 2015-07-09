/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.anunciante;

import cl.inacap.dao.anunciante.AnuncioDAO;
import cl.inacap.model.Anunciante;
import cl.inacap.model.Anuncio;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

/**
 *
 * @author zamorator
 */
@WebServlet(name = "AgregarAnuncio", urlPatterns = {"/AgregarAnuncio"})
public class AgregarAnuncio extends HttpServlet {

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
        try {
            System.out.println(request.getParameter("file"));
            HttpSession sesion = request.getSession();
            Anunciante anunciante = (Anunciante) sesion.getAttribute("anunciante");
            Anuncio anuncio = new Anuncio();
            int valorAnuncio = Integer.parseInt(request.getParameter("InputValorReal"));
            
            anuncio.setNombre_u_anunciante(anunciante.getNombre_u_anunciante());
            anuncio.setNombre_anuncio(request.getParameter("InputNombreAnuncio"));
            anuncio.setImagen_anuncio("imagen");
            anuncio.setDescripcion_anuncio(request.getParameter("InputDescripcionAnuncio"));
            anuncio.setId_categoria(Integer.parseInt(request.getParameter("selectCategoria")));
            anuncio.setId_segmento_sexo(Integer.parseInt(request.getParameter("selectSegmentoSexo")));
            anuncio.setId_segmento_edad(Integer.parseInt(request.getParameter("selectSegmentoEdad")));
            anuncio.setCantidad_cupones(10);
            anuncio.setPorcentaje_descuento(Integer.parseInt(request.getParameter("porcentajeDescueto")));
            
            AnuncioDAO anuncioDao = new AnuncioDAO();
            anuncioDao.AgregaAnuncio(anuncio);
            // traigo id de anuncio recien creado
            int id_anuncio = anuncioDao.buscarIdAnuncio(anuncio);
            
            //agrego valor anuncio
            anuncioDao.agregarValorAnuncio(id_anuncio,valorAnuncio );
            response.sendRedirect("anunciante/agregar_anuncio.jsp?message=" + URLEncoder.encode("Exito al crear anuncio", "UTF-8"));
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("anunciante/agregar_anuncio.jsp?message=" + URLEncoder.encode("error al crear anunciante", "UTF-8"));
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
