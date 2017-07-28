package main.java.com.pharmacyshopautomation.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by USER on 7/27/2017.
 */
@Entity
public class SalesDate {
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSalesdate() {
        return salesdate;
    }

    public void setSalesdate(String salesdate) {
        this.salesdate = salesdate;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    public String salesdate;
}
