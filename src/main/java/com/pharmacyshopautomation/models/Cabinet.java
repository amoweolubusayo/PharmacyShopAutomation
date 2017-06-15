package main.java.com.pharmacyshopautomation.models;

import javax.persistence.*;


@Entity
public class Cabinet {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCabinetid() {
        return cabinetid;
    }

    public void setCabinetid(String cabinetid) {
        this.cabinetid = cabinetid;
    }

    public String getCabinetname() {
        return cabinetname;
    }

    public void setCabinetname(String cabinetname) {
        this.cabinetname = cabinetname;
    }

    private int id;
    public String cabinetid;
    public String cabinetname;
}
