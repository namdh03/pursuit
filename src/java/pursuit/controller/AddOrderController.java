/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pursuit.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pursuit.dao.AddressDAO;
import pursuit.dao.CartItemDAO;
import pursuit.dao.OrderDAO;
import pursuit.dao.ProductVariantDAO;
import pursuit.dto.AccountDTO;
import pursuit.dto.AddressDTO;
import pursuit.dto.CartItemDTO;
import pursuit.dto.OrderDetailDTO;

/**
 *
 * @author namdh
 */
@WebServlet(name = "AddOrderController", urlPatterns = {"/AddOrderController"})
public class AddOrderController extends HttpServlet {

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
        String addressId = request.getParameter("addressId");
        String payment = request.getParameter("payment");
        Gson gson = new Gson();
        Map<String, Object> data = new HashMap<>();

        try {
            HttpSession session = request.getSession();
            AccountDTO adto = (AccountDTO) session.getAttribute("USER");
            OrderDAO orderDAO = new OrderDAO();
            LocalDateTime dateTime = LocalDateTime.now();
            Timestamp date = Timestamp.valueOf(dateTime.plusMinutes(5));
            List<CartItemDTO> cartList = (List<CartItemDTO>) session.getAttribute("CART");
            ProductVariantDAO pvdao = new ProductVariantDAO();
            int pvQty = 0;
            boolean check = true;
            
            for (CartItemDTO ci : cartList) {
                pvQty = pvdao.getQtyByPVID(ci.getProductVariant().getProductVariantId());
                
                if (pvQty < ci.getQuantity()) {
                    check = false;
                    break;
                }
            }

            if (check) {
                orderDAO.addOrder(adto.getCustomer().getCustomerId(), Integer.parseInt(addressId), payment, date);
                CartItemDAO cidao = new CartItemDAO();
                cartList = cidao.getListCartItemByCID(adto.getCustomer().getCustomerId());
                session.setAttribute("CART", cartList);
                
                Map<Integer, List<OrderDetailDTO>> map = orderDAO.getOrderList(adto.getCustomer().getCustomerId());
                session.setAttribute("ORDER", map);
                
                data.put("SUCCESS", "SUCCESS");
            } else {
                data.put("ERROR", "ERROR");
            }
        } catch (Exception e) {
            log("Error at AddOrderController: " + e.toString());
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
