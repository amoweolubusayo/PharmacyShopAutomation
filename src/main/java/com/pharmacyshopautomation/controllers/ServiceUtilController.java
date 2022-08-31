package main.java.com.pharmacyshopautomation.controllers;

import main.java.com.pharmacyshopautomation.models.Drug;
import main.java.com.pharmacyshopautomation.models.Sales;
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
                //System.out.println(drugname);
                output.write(fetchbyDrugName(drugname));
                break;
            case 7:
                String saledate =  request.getParameter("saledate");
                output.write(fetchbyhelperdate(saledate));
                break;
            case 8:
                String currentdate =  request.getParameter("currentdate");
                output.write(fetchbycurrentdate(currentdate));
                break;
            case 6:
                ArrayList<String> eachsaleArray = new ArrayList<String>();
                for (int i = 0; i < 100; i++) {
                    String eachsale = request.getParameter("eachsale");
                    System.out.println("i got here" + eachsale);
                    eachsaleArray.add(eachsale);
                    output.write(fetchEachSaleDetails(eachsaleArray));
                }


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
    public String fetchbyhelperdate(String saledate){
        String res = null;
        JSONObject saleDateJson = new JSONObject();
        List<String> DrugNameArray = new ArrayList<String>();
        List<String> PriceArray = new ArrayList<String>();
        List<String> QuantityArray = new ArrayList<String>();
        List<String> TotalBillArray = new ArrayList<String>();
        List<String> TimeArray = new ArrayList<String>();
        List<String> SoldByArray = new ArrayList<String>();
        try{
            List<Sales> sales = GeneralUtil.getSalesByHelperDate(saledate);
            for(int i = 0; i< sales.size() ; i++) {
                System.out.println("this is the size" + sales);
                String drugname = sales.get(i).getDrugname().replace("[","").replace("]","");
                DrugNameArray.add(drugname);
                String price = sales.get(i).getPrice().replace("[","").replace("]","");
                PriceArray.add(price);
                String quantity = sales.get(i).getQuantityrequested().replace("[","").replace("]","");
                QuantityArray.add(quantity);
                String totalbill = sales.get(i).getTotalbill().replace("[","").replace("]","");
                TotalBillArray.add(totalbill);
                String time = sales.get(i).getDateofsale().substring(11,16);
                TimeArray.add(time);
                String soldby = sales.get(i).getSoldby().toUpperCase();
                SoldByArray.add(soldby);
            }
            try {
                saleDateJson.put("Drugname", DrugNameArray);
                saleDateJson.put("Price", PriceArray);
                saleDateJson.put("Quantity", QuantityArray);
                saleDateJson.put("TotalBill", TotalBillArray);
                saleDateJson.put("Time", TimeArray);
                saleDateJson.put("Soldby", SoldByArray);
                saleDateJson.put("respcode", "00");
                System.out.println(DrugNameArray);
                System.out.println(PriceArray);
            }
            catch (JSONException e){
                e.printStackTrace();
            }

        }
        catch (JSONException e) {

            e.printStackTrace();
            saleDateJson.put("respCode", "99");
        }
        res= saleDateJson.toString();
        return res;

    }


    public String fetchbycurrentdate(String saledate){
        String res = null;
        JSONObject saleDateJson = new JSONObject();
        List<String> DrugNameArray = new ArrayList<String>();
        List<String> PriceArray = new ArrayList<String>();
        List<String> QuantityArray = new ArrayList<String>();
        List<String> TotalBillArray = new ArrayList<String>();
        try{
            List<Sales> sales = GeneralUtil.getSalesByCurrentDate(saledate);
            for(int i = 0; i< sales.size() ; i++) {
                System.out.println("this is the size" + sales);
                String drugname = sales.get(i).getDrugname().replace("[","").replace("]","");
                DrugNameArray.add(drugname);
                String price = sales.get(i).getPrice().replace("[","").replace("]","");
                PriceArray.add(price);
                String quantity = sales.get(i).getQuantityrequested().replace("[","").replace("]","");
                QuantityArray.add(quantity);
                String totalbill = sales.get(i).getTotalbill().replace("[","").replace("]","");
                TotalBillArray.add(totalbill);
            }
            try {
                saleDateJson.put("Drugname", DrugNameArray);
                saleDateJson.put("Price", PriceArray);
                saleDateJson.put("Quantity", QuantityArray);
                saleDateJson.put("TotalBill", TotalBillArray);
                saleDateJson.put("respcode", "00");
                System.out.println(DrugNameArray);
                System.out.println(PriceArray);
            }
            catch (JSONException e){
                e.printStackTrace();
            }

        }
        catch (JSONException e) {

            e.printStackTrace();
            saleDateJson.put("respCode", "99");
        }
        res= saleDateJson.toString();
        return res;

    }

    public String fetchEachSaleDetails(ArrayList<String> eachsaleArray){
        String res = null;
        JSONObject eachSaleJson = new JSONObject();
        try{
            Sales sale = GeneralUtil.getEachSalesDetailsByTotalBill(eachsaleArray);
            eachSaleJson.put("Name",sale.getDrugname());
            eachSaleJson.put("Price",sale.getPrice());
            eachSaleJson.put("Quantity",sale.getQuantityrequested());
            eachSaleJson.put("respcode","00");
            System.out.println(sale.getDrugname());
            System.out.println(sale.getPrice());
        }
        catch (JSONException e) {

            e.printStackTrace();
            eachSaleJson.put("respCode", "99");
        }
        res= eachSaleJson.toString();
        return res;
    }

    public String fetchDrugList(String category){
        String resp = null;
        JSONObject druglistJson = new JSONObject();
        List<String> drugNameArray = new ArrayList<String>();
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
