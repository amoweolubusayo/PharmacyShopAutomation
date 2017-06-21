package main.java.com.pharmacyshopautomation.controllers;

import main.java.com.pharmacyshopautomation.models.Staff;
import main.java.com.pharmacyshopautomation.utils.GeneralUtil;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ServiceUtilController")
public class ServiceUtilController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("operation");
        PrintWriter output = response.getWriter();
        switch (Integer.parseInt(op)) {
            case 2:
                    String staffid =  request.getParameter("staffid");
                    output.write(fetchbyStaffId(staffid));
                    break;
            default:
                break;
        }
    }

    public String fetchbyStaffId(String staffid){
        String res = null;
        JSONObject staffidJson = new JSONObject();
        try{
            Staff staff = GeneralUtil.getStaffById(staffid);
            staffidJson.put("Name",staff.getStaffname());
            staffidJson.put("Email",staff.getStaffemail());
            staffidJson.put("MaritalStatus",staff.getMaritalstatus());
            staffidJson.put("Gender",staff.getGender());
            staffidJson.put("Username",staff.getStaffusername());
            staffidJson.put("Address",staff.getAddress());
            staffidJson.put("Password",staff.getStaffpassword());
            staffidJson.put("Position",staff.getRole());
            staffidJson.put("DateEmployed",staff.getDateemployed());
            staffidJson.put("Phonenumber",staff.getPhonenumber());
            staffidJson.put("respcode","00");
            System.out.println(staff.getGender());
            System.out.println(staff.getMaritalstatus());
            System.out.println(staff.getStaffemail());
            System.out.println(staff.getRole());
            System.out.println(staff.getDateemployed());

        }
        catch (JSONException e) {

            e.printStackTrace();
            staffidJson.put("respCode", "99");
        }
        res= staffidJson.toString();
        return res;

    }

}
