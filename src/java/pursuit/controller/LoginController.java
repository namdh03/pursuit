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
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pursuit.dao.AccountDAO;
import pursuit.dao.AddressDAO;
import pursuit.dao.CartItemDAO;
import pursuit.dao.ColorDAO;
import pursuit.dao.OrderDAO;
import pursuit.dao.SizeDAO;
import pursuit.dto.AccountDTO;
import pursuit.dto.AddressDTO;
import pursuit.dto.CartItemDTO;
import pursuit.dto.ColorDTO;
import pursuit.dto.OrderDetailDTO;
import pursuit.dto.SizeDTO;
import pursuit.utils.Encode;

/**
 *
 * @author namdh
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String AD = "AD";

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
        String password = request.getParameter("password");
        Gson gson = new Gson();
        Map<String, Object> data = new HashMap<>();

        try {
            AccountDAO adao = new AccountDAO();

            if (!adao.verifyUsernameCredentials(username, Encode.toSHA1(password))) {
                data.put("incorrect", "Invalid username or password. Please try again");
            } else if (!adao.checkStatusByUsername(username)) {
                data.put("verify", "Please check your email and click the link to verify your account");
            } else {
                HttpSession session = request.getSession();
                AccountDTO adto = adao.getUserInformation(username, "USERNAME");
                data.put("user", adto);
                session.setAttribute("USER", adto);

                CartItemDAO cidao = new CartItemDAO();
                List<CartItemDTO> cartList = cidao.getListCartItemByCID(adto.getCustomer().getCustomerId());
                session.setAttribute("CART", cartList);

                AddressDAO addressDAO = new AddressDAO();
                List<AddressDTO> addressList = addressDAO.getAddressList(adto.getCustomer().getCustomerId());
                session.setAttribute("ADDRESSES", addressList);

                OrderDAO orderDAO = new OrderDAO();
                Map<Integer, List<OrderDetailDTO>> map = orderDAO.getOrderList(adto.getCustomer().getCustomerId());
                session.setAttribute("ORDER", map);

                if (AD.equals(adto.getRole().getRoleId().trim())) {
                    SizeDAO sizeDAO = new SizeDAO();
                    List<SizeDTO> sizeList = sizeDAO.getListSize();
                    session.setAttribute("SIZE", sizeList);

                    ColorDAO colorDAO = new ColorDAO();
                    List<ColorDTO> colorList = colorDAO.getListColor();
                    session.setAttribute("COLOR", colorList);

                }
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e.toString());
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
