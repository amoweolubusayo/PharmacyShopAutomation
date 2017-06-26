package main.java.com.pharmacyshopautomation.utils;

import main.java.com.pharmacyshopautomation.models.*;

import main.java.persistence.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
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

    public static boolean checkIfDrugCategoryExists(String category) {
        boolean result = false;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from DrugCategory  r where r.category=:category");
            query.setParameter("category", category);
            DrugCategory e = (DrugCategory) query.uniqueResult();
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
    public static boolean checkIfDrugExists(String drugid) {
        boolean result = false;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Drug  r where r.drugid=:drugid");
            query.setParameter("drugid", drugid);
            Drug e = (Drug) query.uniqueResult();
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

    public static List getAllStaffbyId(){
        List result = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            String hql = "FROM Staff ";
            Query query = session.createQuery(hql);
            result = query.list();
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }
    public static List getAllDrugCategories(){
        List result = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            String hql = "FROM DrugCategory ";
            Query query = session.createQuery(hql);
            result = query.list();
        }
        catch (Exception ex){
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }
    public static Integer getLastDrugId(){
        Integer result = 0;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            String hql = "SELECT count(*) FROM Drug";
            Query query = session.createQuery(hql);
            Long e = (Long) query.iterate().next();
            System.out.println(e);
            if (e != null) {
                result = e.intValue();
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }

    public static Staff getStaffById(String staffid) {
        Staff staff = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String hql = "FROM Staff u where u.staffid =:staffid";
            Query query = session.createQuery(hql);
            query.setParameter("staffid", staffid);
            staff = (Staff) query.list().get(0);

            System.out.println("got here first");

        } catch (Exception ex) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }

        return staff;
    }
    public static Staff checkIfStaffExists(String staffid) {
        Staff result = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tnx = null;
        try {
            tnx = session.beginTransaction();
            Query query = session.createQuery("from Staff c where c.staffid=:staffid");
            query.setParameter("staffid", staffid);
            Staff c = (Staff) query.uniqueResult();
            System.out.println("I am : " + c);
            if (c != null) {
                result = c;
            }

        } catch (Exception ex) {
            if (tnx != null) {
                tnx.rollback();
            }

            ex.printStackTrace();
        } finally {
            session.close();
        }

        return result;

    }
}
