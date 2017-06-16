package main.java.com.pharmacyshopautomation.utils;

import main.java.com.pharmacyshopautomation.models.Admin;
import main.java.com.pharmacyshopautomation.models.Staff;
import main.java.persistence.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by USER on 6/12/2017.
 */
public class GeneralUtil {
    public static Admin getAdminByUserName(String username) {
        Admin admin = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String hql = "FROM Admin a where a.username =:username";
            Query query = session.createQuery(hql);
            query.setParameter("username", username);
            admin = (Admin) query.list().get(0);

            System.out.println("found!!!!");

        } catch (Exception ex) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }

        return admin;
    }
    public static boolean checkForUsernameandPassword(String username, String password) {
        boolean result = false;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();

            Query query = session.createQuery("from Admin a  where a.username= :username and a.password=:password");
            query.setParameter("username", username);
            query.setParameter("password", password);

            Admin e = (Admin) query.uniqueResult();

            if (e != null) {
                result = true;
            }
        } catch (Exception ex) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }
    public static boolean checkIfUserExists(String staffusername) {
        boolean result = false;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Staff r  where r.staffusername=:staffusername");
            query.setParameter("staffusername", staffusername);
            Staff e = (Staff) query.uniqueResult();
            if (e != null) {
                result = true;
            }

        } catch (Exception ex) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }

}
