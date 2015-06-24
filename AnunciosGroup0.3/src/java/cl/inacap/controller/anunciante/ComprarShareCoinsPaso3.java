/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.anunciante;

import cl.inacap.dao.anunciante.AnuncioDAO;
import cl.inacap.model.ShareCoin;
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
@WebServlet(name = "ComprarShareCoinsPaso3", urlPatterns = {"/ComprarShareCoinsPaso3"})
public class ComprarShareCoinsPaso3 extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            AnuncioDAO anuncioDao = new AnuncioDAO();
            HttpSession session_actual = request.getSession(true);
            ShareCoin shareCoin = (ShareCoin) session_actual.getAttribute("shareCoins"); 
            anuncioDao.AgregaShareCoins(shareCoin);
            response.sendRedirect("anunciante/mis_anuncios.jsp");
        } catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("anunciante/comprar_sharecoins_paso3.jsp?messaje=" + URLEncoder.encode("Error al intentar comprar ShareCoins", "UTF-8"));
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
