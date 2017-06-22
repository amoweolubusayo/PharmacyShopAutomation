package main.java.com.pharmacyshopautomation.controllers;

import main.java.com.pharmacyshopautomation.models.DrugCategory;
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
 * Created by USER on 6/22/2017.
 */
@WebServlet(name = "AddDrugCategoryController")
public class AddDrugCategoryController extends HttpServlet {
    HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = null;
        response.addHeader("Cache-Control", "no-cache");
        session= request.getSession();
        String category = request.getParameter("category");
        try{
            if(GeneralUtil.checkIfDrugCategoryExists(category)){
                System.out.println("got here");
                request.setAttribute("issues", "Drug category" + "'" + category + "'" + "already exists");
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
        DrugCategory drugCategory = new DrugCategory();
        drugCategory.setCategory(category);
        try{
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = null;
            try{
                tx = session.beginTransaction();
                session.save(drugCategory);
                tx.commit();
                request.setAttribute("issues", "Drug category" + "'" + category + "'" + " Successfully Created");
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
        }




