/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.difusor;

import cl.inacap.dao.difusor.DifusorAnunciosDAO;
import cl.inacap.model.Anuncio;
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
@WebServlet(name = "PublicarCanjear", urlPatterns = {"/PublicarCanjear"})
public class PublicarCanjear extends HttpServlet {

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
            System.out.println("publicar canjear");
            Anuncio anuncio = new Anuncio();
            DifusorAnunciosDAO dad = new DifusorAnunciosDAO();
            String publicar = request.getParameter("publicar");
            String canjear = request.getParameter("canjear");
           // if(!request.getParameter("publicar").equals(null)){
            if(publicar != null){
                   System.out.println(request.getParameter("publicar"));
                   System.out.println(request.getParameter("codigoanuncio"));
                   anuncio.setCodigo_anuncio(Integer.parseInt(request.getParameter("codigoanuncio")));
                   System.out.println(request.getParameter("codigoanuncio"));
                   anuncio = dad.buscaranuncioespecifico(anuncio);
                   HttpSession session_actual2 = request.getSession(true);
                   session_actual2.setAttribute("anuncio", anuncio);
                   
                   response.sendRedirect("difusor/difusor_publicar.jsp");
                    //request.setAttribute("anuncios", anuncio);
                    //System.out.println(anuncio.getDescripcion_anuncio());
                    // request.getRequestDispatcher("difusor/difusor_publicar.jsp").forward(request, response);
                    //  request.getRequestDispatcher("difusor/difusor_publicar.jsp").forward(request, response);
                }else if(canjear != null) {
                    System.out.println("llegue canjeo");
                    anuncio.setCodigo_anuncio(Integer.parseInt(request.getParameter("codigoanuncio")));
                    anuncio = dad.buscaranuncioespecifico(anuncio);
                    HttpSession session_actual2 = request.getSession(true);
                    session_actual2.setAttribute("anuncio", anuncio);
                    response.sendRedirect("difusor/difusor_canjear.jsp");
            }   
        }catch (Exception e) {
            System.out.println(e);
        }finally {
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
            Logger.getLogger(PublicarCanjear.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PublicarCanjear.class.getName()).log(Level.SEVERE, null, ex);
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
