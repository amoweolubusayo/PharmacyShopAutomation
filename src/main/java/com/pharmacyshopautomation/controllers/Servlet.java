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

        User user = new User();
        user.setUsername("ADMIN");
        user.setPassword("ADMIN");
        user.setRoletype("SUPERVISOR");
        user.setEnabled(true);
        session.saveOrUpdate(user);

        Role role = new Role();
        role.setRoletype("SUPERVISOR");
        session.saveOrUpdate(role);

        session.getTransaction().commit();

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

        response.sendRedirect("/updatedatabase");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        doPost(request,response);
    }
}
