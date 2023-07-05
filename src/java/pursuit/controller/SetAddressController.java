/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pursuit.dao.AddressDAO;
import pursuit.dto.AccountDTO;
import pursuit.dto.AddressDTO;

/**
 *
 * @author namdh
 */
@WebServlet(name = "SetAddressController", urlPatterns = {"/SetAddressController"})
public class SetAddressController extends HttpServlet {

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
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        try {
            HttpSession session = request.getSession();
            AccountDTO accountDTO = (AccountDTO) session.getAttribute("USER");
            boolean isDefault;
            boolean flag = false;

            int customerId = accountDTO.getCustomer().getCustomerId();
            fullName = fullName.trim();
            phone = phone.trim();
            address = address.trim();

            AddressDAO addressDAO = new AddressDAO();
            isDefault = addressDAO.checkDefaultAddress(customerId);
            
            if (!isDefault) {
                flag = true;
            }
            
            boolean check = addressDAO.addNewAddress(customerId, fullName, phone, address, flag);
            
            if (check) {
                List<AddressDTO> addressList = addressDAO.getAddressList(accountDTO.getCustomer().getCustomerId());
                session.setAttribute("ADDRESSES", addressList);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at AddressController: " + e.toString());
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
