package main.java.com.pharmacyshopautomation.controllers;

import main.java.com.pharmacyshopautomation.models.Drug;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by USER on 6/22/2017.
 */
@WebServlet(name = "AddDrugController")
public class AddDrugController extends HttpServlet {
    HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher rd = null;
        response.addHeader("Cache-Control", "no-cache");
        session= request.getSession();
        String drugid = request.getParameter("drugid");
        String drugname = request.getParameter("drugname");
        String manufacturer = request.getParameter("manufacturer");
        String drugcategory = request.getParameter("drugcategory");
        String drugprice = request.getParameter("drugprice");
        String druglocation = request.getParameter("druglocation");
        String drugquantity = request.getParameter("drugquantity");
        String batchnumber = request.getParameter("batchnumber");
        String function = request.getParameter("function");
        String productiondate = request.getParameter("productiondate");
        SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-mm-dd");
        Date proddate = null;
        try {
            proddate = formatter1.parse(productiondate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String expirydate = request.getParameter("expirydate");
        SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-mm-dd");
        Date expdate = null;
        try {
            expdate = formatter2.parse(productiondate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String registrationdate = request.getParameter("registrationdate");
        SimpleDateFormat formatter3 = new SimpleDateFormat("yyyy-mm-dd");
        Date regdate = null;
        try {
            regdate = formatter3.parse(productiondate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try{
            if(GeneralUtil.checkIfDrugExists(drugid)){
                System.out.println("got here");
                request.setAttribute("issues", "Drug with drug-id" + "'" + drugid + "'" + "already exists");
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
        Drug drug = new Drug();
        drug.setDrugid(drugid);
        drug.setDrugname(drugname);
        drug.setManufacturer(manufacturer);
        drug.setCategory(drugcategory);
        drug.setPrice(Integer.parseInt(drugprice));
        drug.setLocation(druglocation);
        drug.setQuantity(Integer.parseInt(drugquantity));
        drug.setBatchnumber(batchnumber);
        drug.setFunction(function);
        drug.setProddate(proddate);
        drug.setExpdate(expdate);
        drug.setRegdate(regdate);
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.save(drug);
                tx.commit();
                request.setAttribute("issues", "Drug" + " " + drugname + " " + "with drug-id" + "'" + drugid + "'" + " has been successfully added");
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
