package main.java.com.pharmacyshopautomation.controllers;

import main.java.com.pharmacyshopautomation.models.Drug;
import main.java.com.pharmacyshopautomation.models.Sales;
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by USER on 7/6/2017.
 */
@WebServlet(name = "AddSalesController")
public class AddSalesController extends HttpServlet {
    HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = null;
        response.addHeader("Cache-Control", "no-cache");
        session = request.getSession();
        String drugid = request.getParameter("drugid");
        String quantity = request.getParameter("quantity");
        ArrayList<String> drugName = new ArrayList<String>();
        String salesId = request.getParameter("salesid");
        for (int i = 0; i < 100; i++) {
            System.out.println(drugName.size());
            if (request.getParameter("dgname" + (i)) != null && !request.getParameter("dgname" + (i)).trim().equals("")) {
                String drgname = (request.getParameter("dgname" + (i)));
                drugName.add(drgname);
                System.out.println(request.getParameter("dgname" + (i)));
            }
        }
        drugName.trimToSize();
        ArrayList<String> drugCategory = new ArrayList<String>();

        for (int i = 0; i < drugName.size(); i++) {
            if (request.getParameter("dcategory" + (i)) != null && !request.getParameter("dcategory" + (i)).trim().equals("")) {
                String drgcategory = (request.getParameter("dcategory" + (i)));
                drugCategory.add(drgcategory);
                System.out.println(request.getParameter("dcategory" + (i)));
            }
        }
        drugCategory.trimToSize();
        ArrayList<Float> price = new ArrayList<Float>();

        for (int i = 0; i < drugName.size(); i++) {
            if (request.getParameter("dgprice" + (i)) != null && !request.getParameter("dgprice" + (i)).trim().equals("")) {
                Float drgprice = Float.parseFloat(request.getParameter("dgprice" + (i)));
                price.add(drgprice);
                System.out.println(request.getParameter("dgprice" + (i)));
            }
        }
        price.trimToSize();

        ArrayList<Float> leftover = new ArrayList<Float>();
        for (int i = 0; i < drugName.size(); i++) {
            if (request.getParameter("leftover" + (i)) != null && !request.getParameter("leftover" + (i)).trim().equals("")) {
                Float left_over = Float.parseFloat(request.getParameter("leftover" + (i)));
                leftover.add(left_over);
                System.out.println(request.getParameter("leftover" + (i)));
            }
        }
        leftover.trimToSize();

        ArrayList<Float> quantityrequested = new ArrayList<Float>();

        for (int i = 0; i < drugName.size(); i++) {
            if (request.getParameter("qrequested" + (i)) != null && !request.getParameter("qrequested" + (i)).trim().equals("")) {
                Float quantRequested = Float.parseFloat(request.getParameter("qrequested" + (i)));
                quantityrequested.add(quantRequested);
                System.out.println(request.getParameter("qrequested" + (i)));
            }
        }
        quantityrequested.trimToSize();

        System.out.println("number of drg" + drugName.size());
        System.out.println(drugName.toString());
        System.out.println("number of  price" + price.size());
        System.out.println("number of quantity" + quantityrequested.size());
        String totalbill = request.getParameter("totalbill");
        System.out.println(totalbill);


        Sales sales = new Sales();
        sales.setDrugcategory(drugCategory.toString());
        sales.setDrugname(drugName.toString());
        sales.setPrice(price.toString());
        sales.setQuantityrequested(quantityrequested.toString());
        sales.setTotalbill(totalbill.toString());
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        System.out.println(dateFormat.format(date));
        sales.setDateofsale(dateFormat.format(date));
        saveSales(sales);
        Drug drug = GeneralUtil.getUniqueDrug(drugid);
        System.out.println(drugid);
        for (int i = 0; i < drugName.size(); i++) {
            drug.setQuantity(leftover.get(i));
            updateDrug(drug);
        }

        request.setAttribute("issues", "Sale Successfully Recorded");
        rd = request.getRequestDispatcher("attendantdashboard.jsp");
        rd.forward(request, response);
    }

        public static void saveSales(Sales sales){
            try{
                Session session = HibernateUtil.getSessionFactory().openSession();
                Transaction tx = null;
                try {
                    tx = session.beginTransaction();
                    session.save(sales);
                    tx.commit();
                } catch (Exception e) {
                    if (tx != null) {
                        tx.rollback();
                    }
                    e.printStackTrace();
                    System.err.println("Beans!!!");
                } finally {
                    session.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    public static void updateDrug(Drug drug){
        try{
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = null;
            try {
                tx = session.beginTransaction();

                session.update(drug);

                tx.commit();
            } catch (Exception e) {
                if (tx != null) {
                    tx.rollback();
                }
                e.printStackTrace();
                System.err.println("Beans!!!");
            } finally {
                session.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("attendantdashboard.jsp").forward(request,response);
    }
}
