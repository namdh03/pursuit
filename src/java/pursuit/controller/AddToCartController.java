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
import pursuit.dao.CartDAO;
import pursuit.dao.CartItemDAO;
import pursuit.dao.ProductVariantDAO;
import pursuit.dto.AccountDTO;
import pursuit.dto.CartDTO;
import pursuit.dto.CartItemDTO;

/**
 *
 * @author namdh
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

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
        String customerId = request.getParameter("customerId");
        String productId = request.getParameter("productId");
        String productVariantId = request.getParameter("productVariantId");
        String quantity = request.getParameter("quantity");
        Gson gson = new Gson();
        Map<String, Object> data = new HashMap<>();

        try {
            HttpSession session = request.getSession();
            AccountDTO adto = (AccountDTO) session.getAttribute("USER");

            if (customerId != null && Integer.parseInt(customerId) == adto.getCustomer().getCustomerId()) {

                ProductVariantDAO pvdao = new ProductVariantDAO();
                int pvQty = pvdao.getQtyByPVID(Integer.parseInt(productVariantId));
                boolean check;
                if (pvQty < Integer.parseInt(quantity)) {
                    check = false;
                } else {
                    CartDAO cartDAO = new CartDAO();
                    check = cartDAO.addToCart(Integer.parseInt(customerId),
                            Integer.parseInt(productVariantId),
                            Integer.parseInt(quantity));
                }

                if (check) {
                    CartItemDAO cidao = new CartItemDAO();
                    List<CartItemDTO> list = cidao.getListCartItemByCID(Integer.parseInt(customerId));
                    session.setAttribute("CART", list);

                    data.put("CART", list);
                    data.put("CART_SUCCESS", "Item(s) successfully added to your cart");
                } else {
                    data.put("CART_ERROR_QUANTITY", "Sorry, the selected quantity exceeds the available stock. Please adjust the quantity in your cart");
                }
            } else {
                data.put("CART_ERROR_LOGIN", "Please log in to add items to your cart");
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
