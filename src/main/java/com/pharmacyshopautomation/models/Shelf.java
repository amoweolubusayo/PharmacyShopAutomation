package main.java.com.pharmacyshopautomation.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by USER on 7/26/2017.
 */
@Entity
public class Shelf {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    public String shelflabel;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getShelflabel() {
        return shelflabel;
    }

    public void setShelflabel(String shelflabel) {
        this.shelflabel = shelflabel;
    }
}
