package main.java.com.pharmacyshopautomation.controllers;

import main.java.com.pharmacyshopautomation.models.Drug;
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
import java.util.ArrayList;
import java.util.List;

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

            case 3:
                String drugid =  request.getParameter("drugid");
                output.write(fetchbyDrugId(drugid));
                break;
            case 4:
                String drugcategory =  request.getParameter("drugcategory");
                output.write(fetchDrugList(drugcategory));
                break;
            case 5:
                String drugname =  request.getParameter("drugname");
                output.write(fetchbyDrugName(drugname));
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
            System.out.println(staff.getDateemployed().toString());

        }
        catch (JSONException e) {

            e.printStackTrace();
            staffidJson.put("respCode", "99");
        }
        res= staffidJson.toString();
        return res;

    }
    public String fetchbyDrugId(String drugid){
        String res = null;
        JSONObject drugidJson = new JSONObject();
        try{
            Drug drug = GeneralUtil.getDrugById(drugid);
            drugidJson.put("Name",drug.getDrugname());
            drugidJson.put("Quantity",drug.getQuantity());
            drugidJson.put("Manufacturer",drug.getManufacturer());
            drugidJson.put("Batchno",drug.getBatchnumber());
            drugidJson.put("Category",drug.getCategory());
            drugidJson.put("DrugFunction",drug.getFunction());
            drugidJson.put("Price",drug.getPrice());
            drugidJson.put("ProdDate",drug.getProddate());
            drugidJson.put("DrugLocation",drug.getLocation());
            drugidJson.put("ExpDate",drug.getExpdate());
            drugidJson.put("respcode","00");

        }
        catch (JSONException e) {

            e.printStackTrace();
            drugidJson.put("respCode", "99");
        }
        res= drugidJson.toString();
        return res;

    }
    public String fetchbyDrugName(String drugname){
        String res = null;
        JSONObject drugnameJson = new JSONObject();
        try{
            Drug drug = GeneralUtil.getDrugByName(drugname);
            drugnameJson.put("Id",drug.getDrugid());
            drugnameJson.put("Quantity",drug.getQuantity());
            drugnameJson.put("Manufacturer",drug.getManufacturer());
            drugnameJson.put("Batchno",drug.getBatchnumber());
            drugnameJson.put("Category",drug.getCategory());
            drugnameJson.put("DrugFunction",drug.getFunction());
            drugnameJson.put("Price",drug.getPrice());
            drugnameJson.put("ProdDate",drug.getProddate());
            drugnameJson.put("DrugLocation",drug.getLocation());
            drugnameJson.put("ExpDate",drug.getExpdate());
            drugnameJson.put("respcode","00");
            System.out.println(drug.getDrugid());
            System.out.println(drug.getExpdate());

        }
        catch (JSONException e) {

            e.printStackTrace();
            drugnameJson.put("respCode", "99");
        }
        res= drugnameJson.toString();
        return res;

    }
    public String fetchDrugList(String category){
        String resp = null;
        JSONObject druglistJson = new JSONObject();
        List<String> drugNameArray = new ArrayList<>();
        try{
            List<Drug> drugList = GeneralUtil.getDrugsBasedOnCategory(category);
            for (int i = 0; i < drugList.size(); i++) {
                String drug = drugList.get(i).getDrugname();
                drugNameArray.add(drug);
            }
            druglistJson.put("drugList",drugNameArray);
            System.out.println(drugNameArray);
        }
     catch (JSONException e) {
        e.printStackTrace();
        druglistJson.put("respCode", "99");

    }
    resp = druglistJson.toString();
        return resp;
    }
}
