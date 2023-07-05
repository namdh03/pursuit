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
import pursuit.dao.AccountDAO;
import pursuit.utils.Email;
import pursuit.utils.Encode;
import pursuit.utils.RandomString;

/**
 *
 * @author namdh
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

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
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Gson gson = new Gson();
        Map<String, Object> data = new HashMap<>();
        boolean duplicated = false;

        try {
            AccountDAO adao = new AccountDAO();

            if (adao.checkDuplicate(email, "EMAIL")) {
                data.put("email", "Email is already taken");
                duplicated = true;
            }

            if (!duplicated && adao.checkDuplicate(username, "USERNAME")) {
                data.put("username", "Username is already taken");
                duplicated = true;
            }

            if (!duplicated) {
                String code = RandomString.number(6);
                String rootPath = request.getScheme() + "://" + request.getServerName()
                        + ":" + request.getServerPort() + request.getContextPath();
                boolean isSendEmail = Email.sendEmail(email, "Welcome to Pursuit!", Email.templateEmail(rootPath, username, code));

                if (isSendEmail) {
                    boolean checkInsert = adao.registerAccount(email, username, Encode.toSHA1(password));

                    if (checkInsert) {
                        checkInsert = adao.verifyCode(username, Encode.toSHA1(code), "ADD");

                        if (checkInsert) {
                            data.put("success", "Registration successful! Please check your email and click the link to verify your account");
                        }
                    }
                }
            }
        } catch (Exception e) {
            log("Error at RegisterController: " + e.toString());
        } finally {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(gson.toJson(data));
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
