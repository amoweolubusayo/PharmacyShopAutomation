package main.java.com.pharmacyshopautomation.controllers;

import main.java.com.pharmacyshopautomation.models.Admin;
import main.java.com.pharmacyshopautomation.utils.GeneralUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by USER on 6/12/2017.
 */
public class LoginController extends HttpServlet{
    HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = null;
        response.addHeader("Cache-Control", "no-cache");
        session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        password = password.toUpperCase();
        Admin current_user = null;
        try {
            current_user = GeneralUtil.getAdminByUserName(username);
        } catch (Exception e) {

            System.out.println(e.getMessage());
        }
        if (current_user == null) {
            System.out.println("this is me");
            request.setAttribute("issues", "Invalid Username or Password");
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
            return;
        }
        try {
            if (!GeneralUtil.checkForUsernameandPassword(username, password)) {
                request.setAttribute("issues", "Invalid Username or Password");
                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
                return;
            }

        } catch (Exception e) {
            request.setAttribute("issues", e.getMessage());
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
            return;
        }
        if (!current_user.isEnabled()) {
            System.out.println("hey im here");
            request.setAttribute("issues", "Invalid Username or Password");
            rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
            return;
        }
        try {
            System.out.println("logged in");
            Admin admin = current_user;
            session.setAttribute("current_user", admin);
            request.setAttribute("issues", "Welcome");
            rd = request.getRequestDispatcher("admindashboard.jsp");
            rd.forward(request, response);
            return;

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

}
