/*

* To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.entryBean;
import beans.searchBean;
import beans.userBean;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.DButils;

/**
 *
 * @author elizabeth
 */
public class Search extends HttpServlet {

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
        
        String action = request.getParameter("action");
        String url ="/Search.jsp";
        
        if(action.equals("entry")){
            HttpSession session = request.getSession();
            
            userBean user = (userBean) session.getAttribute("user");
            String username = user.getEmail();
            String name = user.getFirstName();
            String location = request.getParameter("location");
            String phone = request.getParameter("phone");
            String content = request.getParameter("content");
            
            entryBean entry = new entryBean(username,name,location,phone,content);
            
            DButils.setPost(entry);
            url="/Search?action=search";
        }
        
        if(action.equals("search")){
            String s = request.getParameter("search");
            searchBean search = new searchBean(s);
            request.setAttribute("search", s);
            
            request.setAttribute("entries",DButils.getEntries());
        }
        if(action.equals("delete")){
            String content = request.getParameter("content");
            DButils.deletePost(content);
            url="/Search?action=search";
        }
       this.getServletContext().getRequestDispatcher(url).forward(request,response);
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
