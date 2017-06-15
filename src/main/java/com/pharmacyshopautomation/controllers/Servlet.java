package main.java.com.pharmacyshopautomation.controllers;

import main.java.com.pharmacyshopautomation.models.*;
import main.java.persistence.HibernateUtil;
import org.hibernate.Session;

import javax.servlet.RequestDispatcher;
import java.io.IOException;


public class Servlet extends javax.servlet.http.HttpServlet {


    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        System.out.println("WElcome!!!!!!!!!!!!!");

        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        Admin admin = new Admin();
        admin.setUsername("ADMIN");
        admin.setPassword("ADMIN");
        admin.setEnabled(true);
        session.saveOrUpdate(admin);
        session.getTransaction().commit();

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

        response.sendRedirect("/updatedatabase");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        doPost(request,response);
    }
}
