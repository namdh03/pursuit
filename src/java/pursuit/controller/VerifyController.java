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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pursuit.dao.AccountDAO;
import pursuit.dto.AccountDTO;
import pursuit.utils.Email;
import pursuit.utils.Encode;
import pursuit.utils.RandomString;

/**
 *
 * @author namdh
 */
public class VerifyController extends HttpServlet {

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
        String username = request.getParameter("username");
        String code = request.getParameter("code");

        try {
            AccountDAO aO = new AccountDAO();
            boolean check = aO.verifyCode(username, Encode.toSHA1(code), "CHECK");

            if (check) {
                AccountDTO uDTO = new AccountDTO();
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("<script>");
                out.println("function closeTab() {");
                out.println("    setTimeout(function() {");
                out.println("        window.close();");
                out.println("    }, 2000);"); 
                out.println("}");
                out.println("</script>");
                out.println("</head>");
                out.println("<body onload='closeTab()'>");
                out.println("<h1>Successful</h1>");
                out.println("</body>");
                out.println("</html>");
            } else {
                PrintWriter out = response.getWriter();
                out.println("<html>");
                out.println("<head>");
                out.println("<script>");
                out.println("function closeTab() {");
                out.println("    setTimeout(function() {");
                out.println("        window.close();");
                out.println("    }, 2000);"); 
                out.println("}");
                out.println("</script>");
                out.println("</head>");
                out.println("<body onload='closeTab()'>");
                out.println("<h1>Failure</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        } catch (Exception e) {
            log("Error at RegisterController: " + e.toString());
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
