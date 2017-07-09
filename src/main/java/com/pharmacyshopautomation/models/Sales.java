package main.java.com.pharmacyshopautomation.models;

import javax.persistence.*;
import java.util.Date;


@Entity
public class Sales {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    public String drugcategory;
    public String drugname;

    public void setQuantityrequested(float quantityrequested) {
        this.quantityrequested = quantityrequested;
    }

    public float getPrice() {
        return price;
    }

    public float quantityrequested;
    public float price;
    public String totalbill;
    public String dateofsale;


    public void setPrice(float price) {
        this.price = price;
    }

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

    public String getDrugcategory() {
        return drugcategory;
    }

    public void setDrugcategory(String drugcategory) {
        this.drugcategory = drugcategory;
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
