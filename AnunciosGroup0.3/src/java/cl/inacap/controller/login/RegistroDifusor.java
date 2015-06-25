/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.controller.login;

import cl.inacap.dao.difusor.DifusorDAO;
import cl.inacap.dao.difusor.DifusorRedesSocialesDAO;
import cl.inacap.model.Difusor;
import cl.inacap.model.DifusorRedesSocialesR;
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

    public String redesSocialesInvalidas = "";

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
        System.out.println(request.getParameter("InputFacebook-id"));
        try {
            // validacion redes sociales
            if (!request.getParameter("InputFacebook").equals("") || !request.getParameter("InputTwitter").equals("") || !request.getParameter("InputGoogleplus").equals("")) {
                
                String fb = request.getParameter("InputFacebook");
                String tw = request.getParameter("InputTwitter");
                //String gl = request.getParameter("InputGoogleplus");
                
                boolean RedesSocialesValidas = validarExistencia(fb, tw);
                if (RedesSocialesValidas) {
                    //validacion password
                    if (!request.getParameter("InputPassword").equals("") || !request.getParameter("InputPassword2").equals("")) {
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
                                
                                if (request.getParameter("InputEdad") != null) {
                                    int edad = Integer.parseInt(request.getParameter("InputEdad"));
                                    if (edad < 19) {
                                        difusor.setId_segmento_edad(1);
                                    } else if (edad < 30) {
                                        difusor.setId_segmento_edad(2);
                                    } else if (edad < 40) {
                                        difusor.setId_segmento_edad(3);
                                    } else if (edad < 50) {
                                        difusor.setId_segmento_edad(4);
                                    } else {
                                        difusor.setId_segmento_edad(5);
                                    }
                                }
                                if (request.getParameter("optionsRadiosSexo") != null) {
                                    if (request.getParameter("optionsRadiosSexo").equals("male")) {
                                        difusor.setId_segmento_sexo(1);
                                    } else if (request.getParameter("optionsRadiosSexo").equals("female")) {
                                        difusor.setId_segmento_sexo(2);
                                    }
                                }
                                difusor.setPassword_difusor(request.getParameter("InputPassword"));
                                
                                System.out.println(request.getParameter("optionsRadioAvatar") + "llegue aca");
                                if(request.getParameter("optionsRadioAvatar") != null){
                                        difusor.setId_avatar(Integer.parseInt(request.getParameter("optionsRadioAvatar")));   
                                }
                                
                                /* rangos | id
                                 15 - 18 | 1
                                 19 - 29 | 2
                                 30 - 39 | 3
                                 40 - 49 | 4
                                 50 - 59 | 5
                                 */
                                // creo difusor
                                difusorDao = new DifusorDAO();
                                difusorDao.AgregaDifusor(difusor);
                                // creo redes sociales relacionadas a difusor
                                /*
                                 redS | id
                                 face | 1
                                 twit | 2
                                 goo+ | 3
                                 */
                                System.out.println("Previo a ingresar fb:" + fb);
                                if (!fb.equals("")) {
                                    
                                    DifusorRedesSocialesR difusor_redsocial = new DifusorRedesSocialesR();
                                    System.out.println(request.getParameter("InputFacebook-id"));
                                    difusor_redsocial.setId_red_social(1);
                                    difusor_redsocial.setId_red_social_difusor(request.getParameter("InputFacebook-id"));
                                    difusor_redsocial.setNombre_u_difusor(difusor.getNombre_u_difusor());
                                    difusor_redsocial.setNombre_usuario_red_social(request.getParameter("InputFacebook"));
                                    creaRedSocial(difusor_redsocial);
                                }
                                if (!tw.equals("")) {
                                    DifusorRedesSocialesR difusor_redsocial = new DifusorRedesSocialesR();
                                    
                                    
                                   // creaRedSocial(difusor.getNombre_u_difusor(), tw, 2);
                                }

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
                } else {
                    response.sendRedirect("registro_difusor.jsp?message=" + URLEncoder.encode("Red social existente: " + redesSocialesInvalidas, "UTF-8"));
                }
            } else {
                response.sendRedirect("registro_difusor.jsp?message=" + URLEncoder.encode("Llenar al menos una red social", "UTF-8"));
            }
        } catch (Exception e) {
            e.printStackTrace();
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

        private void creaRedSocial(DifusorRedesSocialesR in_difusor_redsocial) throws Exception {
        DifusorRedesSocialesR difusorRedesSocialesR = new DifusorRedesSocialesR();
        DifusorRedesSocialesDAO dAO;
        difusorRedesSocialesR.setNombre_u_difusor(in_difusor_redsocial.getNombre_u_difusor());
        difusorRedesSocialesR.setNombre_usuario_red_social(in_difusor_redsocial.getNombre_usuario_red_social());
        difusorRedesSocialesR.setId_red_social(in_difusor_redsocial.getId_red_social());
        difusorRedesSocialesR.setId_red_social_difusor(in_difusor_redsocial.getId_red_social_difusor());
        dAO = new DifusorRedesSocialesDAO();
        dAO.AgregaRedSocialDifusor(difusorRedesSocialesR);
    }

    private boolean validarExistencia(String fb, String tw) throws Exception {
        DifusorRedesSocialesDAO drsdao = new DifusorRedesSocialesDAO();
        if (drsdao.ConsultaRedSocialExistente(fb) != 0) {
            redesSocialesInvalidas += "Facebook ";
        }
        if (drsdao.ConsultaRedSocialExistente(tw) != 0) {
            redesSocialesInvalidas += "Twitter ";
        }
        if (redesSocialesInvalidas.length() > 0) {
            return false;
        } else {
            return true;
        }
    }

}
