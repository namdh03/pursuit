/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pursuit.dao.AccountDAO;
import pursuit.dto.AccountDTO;

/**
 *
 * @author namdh
 */
@WebServlet(name = "UpdateUserController", urlPatterns = {"/UpdateUserController"})
public class UpdateUserController extends HttpServlet {

    private static final String SUCCESS = "user.jsp";
    private static final String ERROR = "user.jsp";

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
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        if (fullName != null) {
            fullName = fullName.trim();
        }
        
        if (email != null) {
            email = email.trim();
        }
        
        if (phone != null) {
            phone = phone.trim();
        }

        try {
            HttpSession session = request.getSession();
            AccountDTO adto = (AccountDTO) session.getAttribute("USER");
            AccountDAO adao = new AccountDAO();
            boolean isEmail = false;
            boolean isPhone = false;

            if (fullName == null) {
                fullName = adto.getCustomer().getLastName() + " " + adto.getCustomer().getFirstName();
            }

            if (email == null) {
                email = adto.getEmail();
            } else {
                if (!email.equals(adto.getEmail())) {
                    isEmail = adao.checkDuplicate(email, "EMAIL");
                }
            }

            if (phone == null) {
                phone = adto.getCustomer().getPhone();
            } else {
                if (!phone.equals(adto.getCustomer().getPhone())) {
                    isPhone = adao.checkDuplicate(phone, "PHONE");
                }
            }

            if (!isEmail && !isPhone) {
                String firstName = "";
                String lastName = "";
                String[] fullNameArr = fullName.split(" ");

                for (int i = 0; i < fullNameArr.length; i++) {
                    if (i != 0) {
                        firstName += fullNameArr[i] + " ";
                    } else {
                        lastName = fullNameArr[i];
                    }
                }
                
                boolean isSuccess = adao.updateUser(adto.getAccountId(), email, firstName.trim(), lastName.trim(), phone, adto.getCustomer().getCustomerId());

                if (isSuccess) {
                    if (adto.getGoogleId() != null) {
                        adto = adao.getUserInformation(adto.getGoogleId(), "GOOGLE_ID");
                        session.setAttribute("USER", adto);
                    } else {
                        adto = adao.getUserInformation(adto.getUsername(), "USERNAME");
                        session.setAttribute("USER", adto);
                    }
                }
            } 
            
            if (isEmail) {
                request.setAttribute("DUPLICATE_EMAIL", "Email is already taken");
            } 
            
            if (isPhone) {
                request.setAttribute("DUPLICATE_PHONE", "Phone number is already taken");
            } 
        } catch (Exception e) {
            log("Error at UpdateUserController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
