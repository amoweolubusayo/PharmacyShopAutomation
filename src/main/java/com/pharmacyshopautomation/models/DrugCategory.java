package main.java.com.pharmacyshopautomation.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by USER on 6/22/2017.
 */
@Entity
public class DrugCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    public String category;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
