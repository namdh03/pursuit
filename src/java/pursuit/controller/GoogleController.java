/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pursuit.dao.AccountDAO;
import pursuit.dto.AccountDTO;
import pursuit.dto.GoogleDTO;
import pursuit.utils.Google;

/**
 *
 * @author namdh
 */
@WebServlet(name = "GoogleController", urlPatterns = {"/GoogleController"})
public class GoogleController extends HttpServlet {

    private static final String SUCCESS = "index.jsp";
    private static final String ERROR = "login.jsp";

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
        String url = ERROR;
        String refresh_token = request.getParameter("code");
        String authentication_token = Google.getToken(refresh_token);
        GoogleDTO gdto = Google.getUser(authentication_token);

        Gson gson = new Gson();
        Map<String, Object> data = new HashMap<>();
        HttpSession session = request.getSession();

        try {
            AccountDAO adao = new AccountDAO();
            boolean check = adao.loginWithGoogle(gdto);

            if (check) {
                AccountDTO adto = adao.getUserInformation(gdto.getId(), "GOOGLE_ID");
                session.setAttribute("USER", adto);
                url = SUCCESS;
            } else {
                session.setAttribute("ERROR", "Failed to log in with Google. Please try again or use another login method");
            }
        } catch (Exception e) {
            log("Error at GoogleController: " + e.toString());
        } finally {
            response.sendRedirect(url);
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
