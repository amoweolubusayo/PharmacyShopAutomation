package main.java.com.pharmacyshopautomation.models;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Staff {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String staffid;
    public String staffname;
    public String maritalstatus;
    public String address;
    public String phonenumber;
    public String staffemail;
    public String role;
    public Date dateemployed;
    public String staffusername;
    public String staffpassword;
    public String gender;

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStaffid() {
        return staffid;
    }

    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }

    public String getStaffname() {
        return staffname;
    }

    public void setStaffname(String staffname) {
        this.staffname = staffname;
    }

    public String getMaritalstatus() {
        return maritalstatus;
    }

    public void setMaritalstatus(String maritalstatus) {
        this.maritalstatus = maritalstatus;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getStaffemail() {
        return staffemail;
    }

    public void setStaffemail(String staffemail) {
        this.staffemail = staffemail;
    }

    public Date getDateemployed() {
        return dateemployed;
    }

    public void setDateemployed(Date dateemployed) {
        this.dateemployed = dateemployed;
    }

    public String getStaffusername() {
        return staffusername;
    }

    public void setStaffusername(String staffusername) {
        this.staffusername = staffusername;
    }

    public String getStaffpassword() {
        return staffpassword;
    }

    public void setStaffpassword(String staffpassword) {
        this.staffpassword = staffpassword;
    }


}
