package main.java.com.pharmacyshopautomation.controllers;
import main.java.com.pharmacyshopautomation.models.Admin;
import main.java.com.pharmacyshopautomation.models.Staff;
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
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by USER on 6/21/2017.
 */
@WebServlet(name = "EditStaffController")
public class EditStaffController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = null;
        response.addHeader("Cache-Control", "no-cache");
        String staffid = request.getParameter("staffid");
        String staffname = request.getParameter("staffname");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phonenumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String maritalstatus = request.getParameter("maritalstatus");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roletype = request.getParameter("roletype");
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            if (GeneralUtil.checkIfStaffExists(staffid) == null) {
                request.setAttribute("issues", "Unable to Update..That staff hasnt been added yet..Please add the Staff first");
                rd = request.getRequestDispatcher("admindashboard.jsp");
                rd.forward(request, response);
                return;
            }
            Staff staff = GeneralUtil.checkIfStaffExists(staffid);
            staff.setStaffname(staffname);
            staff.setGender(gender);
            staff.setAddress(address);
            staff.setPhonenumber(phonenumber);
            staff.setMaritalstatus(maritalstatus);
            staff.setStaffemail(email);
            staff.setStaffusername(username);
            staff.setStaffpassword(password);
            staff.setRole(roletype);
            staff.setStaffid(username);
            Admin admin = GeneralUtil.getAdminByUserName(username);
            admin.setUsername(username);
            admin.setPassword(password);
            admin.isEnabled(true);
            tx = session.beginTransaction();
            session.update(staff);
            session.update(admin);
            tx.commit();
            request.setAttribute("issues", "Data of" + " " + staffid + " " + "has been successfully edited");
            rd = request.getRequestDispatcher("admindashboard.jsp");
            rd.forward(request, response);
            return;
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
        finally
        {
            session.close();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("admindashboard.jsp").forward(request,response);
    }


}
