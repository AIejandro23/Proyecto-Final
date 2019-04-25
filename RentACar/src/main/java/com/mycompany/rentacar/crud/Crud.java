/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.rentacar.crud;

import com.mycompany.rentacar.datamodel.HibernateUtil;
import com.mycompany.rentacar.entities.Brand;
import com.mycompany.rentacar.entities.Car;
import com.mycompany.rentacar.entities.Customer;
import com.mycompany.rentacar.entities.Location;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Alejandro
 */
public class Crud {
    public void insertCar(String matricula,String marca,String localizacion,String modelo){
         try{
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();   
        Session session = sessionFactory.openSession();       
        session.beginTransaction();

        Car car = new Car();
        car.setEnrollment(matricula);
        
        if(marca.equals("Renault")){
            Brand brand = new Brand(1);
            car.setIdBrand(brand);
        }else if(marca.equals("Fiat")){
            Brand brand = new Brand(2);
            car.setIdBrand(brand);
        }else if(marca.equals("Opel")){
            Brand brand = new Brand(3);
            car.setIdBrand(brand);
        }else if(marca.equals("Nissan")){
            Brand brand = new Brand(4);
            car.setIdBrand(brand);
        }
        
        if(localizacion.equals("Palma")){
            Location location = new Location(1);
            car.setIdLocation(location);
        }else if(localizacion.equals("Ibiza")){
            Location location = new Location(2);
            car.setIdLocation(location);
        }
        
        session.save(car);
        
        session.getTransaction().commit();
        session.close();
        
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void insertUser(String nombre,String apellidos,String password, String email, String pais, int telefono, Date aniversario){
        
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();   
        Session session = sessionFactory.openSession();       
        session.beginTransaction();
        
       Customer usuario = new Customer();
       usuario.setName(nombre);
       usuario.setSurnames(apellidos);
       usuario.setPassword(password);
       usuario.setEmail(email);
       usuario.setCountry(pais);
       usuario.setPhone(telefono);
       usuario.setBirthDate(aniversario);
       
       session.save(usuario);
        
       session.getTransaction().commit();
       session.close();
    }
    
     public Customer login(String email, String password){
        
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        
        String hql = "FROM Customer WHERE email = '" + email + "' and password = '" + password + "'";
        Query query = session.createQuery(hql);
        List<Customer> usuarios = query.list();
        
        if(usuarios.isEmpty()){
            
            session.close();
            return null;
        }else{
             
            session.close();
            return usuarios.get(0);
        }
        
        
    }
}
