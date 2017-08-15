package main.java.com.pharmacyshopautomation.models;

import javax.persistence.*;
import java.util.ArrayList;


@Entity
public class Sales {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    public String drugcategory;
    public String drugname;



    public String quantityrequested;
    public String price;

    public void setDrugcategory(String drugcategory) {
        this.drugcategory = drugcategory;
    }

    public void setQuantityrequested(String quantityrequested) {
        this.quantityrequested = quantityrequested;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDrugcategory() {
        return drugcategory;
    }

    public String getQuantityrequested() {
        return quantityrequested;
    }

    public String getPrice() {
        return price;
    }

    public String totalbill;
    public String dateofsale;
    public String soldby;

    public String getSoldby() {
        return soldby;
    }

    public void setSoldby(String soldby) {
        this.soldby = soldby;
    }

    public String getHelperdate() {
        return helperdate;
    }

    public void setHelperdate(String helperdate) {
        this.helperdate = helperdate;
    }

    public String helperdate;




    public String getDateofsale() {
        return dateofsale;
    }

    public void setDateofsale(String dateofsale) {
        this.dateofsale = dateofsale;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    public String getDrugname() {
        return drugname;
    }

    public void setDrugname(String drugname) {
        this.drugname = drugname;
    }

    public String getTotalbill() {
        return totalbill;
    }

    public void setTotalbill(String totalbill) {
        this.totalbill = totalbill;
    }


}
