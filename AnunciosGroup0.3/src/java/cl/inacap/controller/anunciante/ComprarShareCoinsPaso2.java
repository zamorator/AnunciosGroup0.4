/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.anunciante;

import cl.inacap.model.Anuncio;
import cl.inacap.model.ShareCoin;
import java.io.IOException;
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
@WebServlet(name = "ComprarShareCoinsPaso2", urlPatterns = {"/ComprarShareCoinsPaso2"})
public class ComprarShareCoinsPaso2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession sesion = request.getSession();
            Anuncio anuncio = (Anuncio) sesion.getAttribute("anuncio");
            String select = request.getParameter("group1");

            ShareCoin shareCoin = new ShareCoin();
            shareCoin.setId_valor_coin(1); //anunciante
            shareCoin.setCodigo_anuncio(anuncio.getCodigo_anuncio());
            //seteo ShareCoin segun opcion escogida
            if (select.equals("10")) {
                //10k, 125 shares
                shareCoin.setCantidad_compartir(125);
                shareCoin.setCantidad_extra_compartir(0);
            } else if (select.equals("15")) {
                //15k, 200 shares (187+13), 13 extra 
                shareCoin.setCantidad_compartir(200);
                shareCoin.setCantidad_extra_compartir(13);
            } else if (select.equals("20")) {
                //20k, 300 shares (250+50), 50 extra
                shareCoin.setCantidad_compartir(300);
                shareCoin.setCantidad_extra_compartir(50);
            }
            HttpSession session_actual = request.getSession(true);
            session_actual.setAttribute("shareCoins", shareCoin);
            response.sendRedirect("anunciante/comprar_sharecoins_paso2.jsp");
        } catch (Exception e) {
            e.printStackTrace();
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
