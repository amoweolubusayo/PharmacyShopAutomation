package main.java.com.pharmacyshopautomation.controllers;
import main.java.com.pharmacyshopautomation.models.User;
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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by USER on 6/15/2017.
 */
@WebServlet(name = "AddStaffController")
public class AddStaffController extends HttpServlet {
    HttpSession session;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = null;
        response.addHeader("Cache-Control", "no-cache");
        session= request.getSession();
        String staffname = request.getParameter("staffname");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String dateemployed = request.getParameter("dateemployed");
        System.out.println(dateemployed);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
        Date doe = null;
        try {
            doe = formatter.parse(dateemployed);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String phonenumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String maritalstatus = request.getParameter("maritalstatus");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roletype = request.getParameter("roletype");

        try{
            if(GeneralUtil.checkIfUserExists(username)){
                System.out.println("got here");
                request.setAttribute("issues", "Staff with id" + "'" + username + "'" + "already exists");
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
        Staff staff = new Staff();
        staff.setStaffname(staffname);
        staff.setGender(gender);
        staff.setAddress(address);
        staff.setDateemployed(doe);
        staff.setPhonenumber(phonenumber);
        staff.setMaritalstatus(maritalstatus);
        staff.setStaffemail(email);
        staff.setStaffusername(username);
        staff.setStaffpassword(password);
        staff.setRole(roletype);
        staff.setStaffid(username);
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRoletype(roletype);
        user.isEnabled(true);
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.save(staff);
                session.save(user);
                tx.commit();
                request.setAttribute("issues", "Staff with username" + "'" + username + "'" + " Successfully Created");
                rd = request.getRequestDispatcher("admindashboard.jsp");
                rd.forward(request, response);
                return;
            } catch (Exception e) {
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
