package main.java.com.pharmacyshopautomation.controllers;

import main.java.com.pharmacyshopautomation.models.DrugCategory;
import main.java.com.pharmacyshopautomation.models.Shelf;
import main.java.com.pharmacyshopautomation.utils.GeneralUtil;
import main.java.persistence.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by USER on 7/26/2017.
 */
@WebServlet(name = "AddShelfController")
public class AddShelfController extends HttpServlet {
    HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = null;
        response.addHeader("Cache-Control", "no-cache");
        session= request.getSession();
        String shelflabel = request.getParameter("shelflabel");
        try{
            if(GeneralUtil.checkIfShelfLabelExists(shelflabel)){
                System.out.println("got here");
                request.setAttribute("issues", "Shelf labelled" + "'" + shelflabel + "'" + "already exists");
                rd = request.getRequestDispatcher("admindashboard.jsp");
                rd.forward(request, response);
                return;
            }
        }
        catch (Exception e){
            request.setAttribute("issues", e.getMessage());
            rd = request.getRequestDispatcher("admindashboard.jsp");
            rd.forward(request, response);
            return;
        }
        Shelf shelfLabel = new Shelf();
        shelfLabel.setShelflabel(shelflabel);
        try{
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = null;
            try{
                tx = session.beginTransaction();
                session.save(shelfLabel);
                tx.commit();
                request.setAttribute("issues", "Shelf labelled" + "'" + shelflabel + "'" + " Successfully Created");
                rd = request.getRequestDispatcher("admindashboard.jsp");
                rd.forward(request, response);
                return;
            }
            catch (Exception e) {
                if (tx != null && tx.isActive()) {
                    tx.rollback();
                }
                e.printStackTrace();

            } finally {
                session.close();
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("admindashboard.jsp").forward(request,response);
    }
}
