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
import com.mycompany.rentacar.entities.Model;
import com.mycompany.rentacar.entities.Reservation;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import static sun.security.krb5.Confounder.bytes;

/**
 *
 * @author Alejandro
 */
public class Crud {
    public void insertCar(String imagenNombre,String imagenRuta,String matricula,String marca,String localizacion,String modelo,String descripcion,String precioDia){
         try{
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();   
        Session session = sessionFactory.openSession();       
        session.beginTransaction();
        
        Double precioDia2 = Double.parseDouble(precioDia);
        
        Car car = new Car();
       
        car.setEnrollment(matricula);
        car.setImageName(imagenNombre);
        car.setImagePath(imagenRuta);
        car.setPricePerDay(precioDia2);
        
        Model model = new Model();
        
        if(marca.equals("Renault")){
            Brand brand = new Brand(1);
            car.setIdBrand(brand);
            model.setName(modelo);
            model.setIdBrand(brand);
            model.setDescripcion(descripcion);
            car.setIdModel(model);

        }else if(marca.equals("Fiat")){
            Brand brand = new Brand(2);
            car.setIdBrand(brand);
            model.setName(modelo);
            model.setIdBrand(brand);
            model.setDescripcion(descripcion);
            car.setIdModel(model);

        }else if(marca.equals("Opel")){
            Brand brand = new Brand(3);
            car.setIdBrand(brand);
            model.setName(modelo);
            model.setIdBrand(brand);
            model.setDescripcion(descripcion);
            car.setIdModel(model);

        }else if(marca.equals("Nissan")){
            Brand brand = new Brand(4);
            car.setIdBrand(brand);
            model.setName(modelo);
            model.setIdBrand(brand);
            model.setDescripcion(descripcion);
            car.setIdModel(model);
        }
        
        if(localizacion.equals("1")){
            Location location = new Location(1);
            car.setIdLocation(location);
        }else if(localizacion.equals("2")){
            Location location = new Location(2);
            car.setIdLocation(location);
        }else if(localizacion.equals("3")){
            Location location = new Location(3);
            car.setIdLocation(location);
        }else if(localizacion.equals("4")){
            Location location = new Location(4);
            car.setIdLocation(location);
        }
        
        car.setReservado(0);
        session.save(model);
        session.save(car);
        
        session.getTransaction().commit();
        session.close();
        
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void insertUser(String nombre,String apellidos,String password, String email, String pais, int telefono, Date aniversario,String dni){
        
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();   
        Session session = sessionFactory.openSession();       
        session.beginTransaction();
        
       Customer usuario = new Customer();
       usuario.setName(nombre);
       usuario.setSurnames(apellidos);
       
       String contrasenya = getMD5(password);
       
       usuario.setPassword(contrasenya);
       usuario.setEmail(email);
       usuario.setCountry(pais);
       usuario.setPhone(telefono);
       usuario.setBirthDate(aniversario);
       usuario.setDni(dni);
       
       session.save(usuario);
        
       session.getTransaction().commit();
       session.close();
    }
    
     public Customer login(String email, String password){
        
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        
        if(!email.equals("admin") && !password.equals("admin")){
            String hql = "FROM Customer WHERE email = '" + email + "' and password = '" + getMD5(password) + "'";
            Query query = session.createQuery(hql);
            List<Customer> usuarios = query.list();

            if(usuarios.isEmpty()){

                session.close();
                return null;
            }else{

                session.close();
                return usuarios.get(0);
            }
        }else{
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
     
    public List<Car> getAllVehiculos(){
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        
 
            String hql = "FROM Car";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();
            
            return coches;
    }
    public List<Car> consultaVehiculo(int idLugar, int idMarca){
        
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        
        if(idLugar == 0 && idMarca == 0){
            String hql = "FROM Car Where reservado = 0";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();

            if(coches.isEmpty()){

                //session.close();
                return null;
            }else{

                //session.close();
                return coches;
            }
        }
        
        // Cualquier marca
        if(idMarca == 0){
            String hql = "FROM Car WHERE idLocation = " + idLugar + " and reservado = 0";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();

            if(coches.isEmpty()){

                //session.close();
                return null;
            }else{

                //session.close();
                return coches;
            }
        }
        // Cualquier lugar
        if(idLugar == 0){
             String hql = "FROM Car WHERE idBrand = " + idMarca + " and reservado = 0";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();

            if(coches.isEmpty()){

                //session.close();
                return null;
            }else{
                
                session.close();
                return coches;

            }
        }
        
        
        
        String hql = "FROM Car WHERE reservado = 0 and idLocation = '" + idLugar + "' and idBrand = '" + idMarca + "'";
        Query query = session.createQuery(hql);
        List<Car> coches = query.list();
        
        if(coches.isEmpty()){
            
            //session.close();
            return null;
        }else{
             
            //session.close();
            return coches;
        }
    }
    
    public void deleteCar(int idVehiculo, int idModelo){
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        
        String hql = "DELETE FROM Car WHERE idCar = '" + idVehiculo + "'";
        Query query = session.createQuery(hql);
        System.out.println(query.executeUpdate());
        
         String hql2 = "DELETE FROM Model WHERE idModelo = '" + idModelo + "'";
        Query query2 = session.createQuery(hql2);
        System.out.println(query2.executeUpdate());
        
        transaction.commit();
        

    }
    
    public void editCar(int idVehiculo,String imagenNombre,String imagenRuta,String matricula,String marca,String localizacion,String modelo,String descripcion){
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        
        String hql = "FROM Car WHERE idCar = '" + idVehiculo + "'";
        Query query = session.createQuery(hql);
        List<Car> coche = query.list();
          
        
       
        coche.get(0).setEnrollment(matricula);
        coche.get(0).setImageName(imagenNombre);
        coche.get(0).setImagePath(imagenRuta);
       
        Model model = new Model();
        
        if(marca.equals("Renault")){
            Brand brand = new Brand(1);
            coche.get(0).setIdBrand(brand);
            model.setName(modelo);
            model.setIdBrand(brand);
            model.setDescripcion(descripcion);
            coche.get(0).setIdModel(model);

        }else if(marca.equals("Fiat")){
            Brand brand = new Brand(2);
            coche.get(0).setIdBrand(brand);
            model.setName(modelo);
            model.setIdBrand(brand);
            model.setDescripcion(descripcion);
            coche.get(0).setIdModel(model);

        }else if(marca.equals("Opel")){
            Brand brand = new Brand(3);
            coche.get(0).setIdBrand(brand);
            model.setName(modelo);
            model.setIdBrand(brand);
            model.setDescripcion(descripcion);
            coche.get(0).setIdModel(model);

        }else if(marca.equals("Nissan")){
            Brand brand = new Brand(4);
            coche.get(0).setIdBrand(brand);
            model.setName(modelo);
            model.setIdBrand(brand);
            model.setDescripcion(descripcion);
            coche.get(0).setIdModel(model);
        }
        
        if(localizacion.equals("Palma")){
            Location location = new Location(1);
            coche.get(0).setIdLocation(location);
        }else if(localizacion.equals("Ibiza")){
            Location location = new Location(2);
            coche.get(0).setIdLocation(location);
        }
        
        session.save(model);
        session.save(coche.get(0));
        
        session.getTransaction().commit();
        session.close();
        
    }
    
    public void bookCar(int idCar){
        
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        
        String hql = "FROM Car where idCar = '" + idCar + "'";
        Query query = session.createQuery(hql);
        List<Car> coche = query.list();
        
        int estadoReserva = coche.get(0).getReservado();
        
        if(estadoReserva == 1){
           coche.get(0).setReservado(0);
        }else{
           coche.get(0).setReservado(1);
        }
        
        session.save(coche.get(0));
        
        session.getTransaction().commit();
        session.close();
        
    }
     
    public void bookCarCustomer(int idCar,int posicionCoche, int idUsuario, String reservationDate, String collectionDate, Double precioFinal) throws ParseException{
        
        bookCar(idCar);
        
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        
        String hql = "FROM Car where idCar = '" + idCar + "'";
        Query query = session.createQuery(hql);
        List<Car> coche = query.list();
        
        Car car = coche.get(0);
        
        car.setReservado(1);
        
        String hql2 = "FROM Customer where idCustomer = '" + idUsuario +"'";
        Query query2 = session.createQuery(hql2);
        List<Customer> customer = query2.list();
        
        Customer cliente = customer.get(0);
        
        
        Reservation reservation = new Reservation();
        reservation.setIdCar(car);
        reservation.setIdUser(cliente);
        reservation.setFinalPrice(precioFinal);
        
        
        SimpleDateFormat formatter1=new SimpleDateFormat("MMM dd, yyyy");  
        Date dateReservation = formatter1.parse(reservationDate);  
        Date dateCollection = formatter1.parse(collectionDate); 
        
        reservation.setReservationDate(dateReservation);
        reservation.setCollectionDate(dateCollection);
        
        session.save(car);
        session.save(reservation);
        
        session.getTransaction().commit();
        session.close();
    }
    
    public List<Car> searchCar(String matricula,String marca,String localizacion, String estadoReserva){
       
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
     
        // CAMPOS DE BUSQUEDA VACIOS DEVUELVE TODOS LOS COCHES DE LA BD
        if(matricula.equals("") && marca.equals("") && localizacion.equals("") && estadoReserva.equals("")){
            
            String hql = "FROM Car";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();
            
            return coches;
        }
        
        // SI RELLENA MATRICULA SOLO SE BUSCA POR MATRICULA YA QUE ES IDENTIFICADOR DE CADA COCHE
        if(!matricula.equals("")){
            String hql = "FROM Car Where enrollment = '" + matricula + "'";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();
            
            return coches;
        }
        
        // BUSQUEDAS SINGULARES
        if(!matricula.equals("") && marca.equals("") && localizacion.equals("") && estadoReserva.equals("")){
            
            String hql = "FROM Car Where enrollment = '" + matricula + "'";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();
            
            return coches;
        }else if(!marca.equals("") && matricula.equals("") && localizacion.equals("") && estadoReserva.equals("")){
            
            String hql = "FROM Car Where idBrand = '" + marca + "'";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();
            
            return coches;
        }else if(!localizacion.equals("") && marca.equals("") && matricula.equals("") && estadoReserva.equals("")){
            
            String hql = "FROM Car Where idLocation = '" + localizacion + "'";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();
            
            return coches;
        }else if(!estadoReserva.equals("") && marca.equals("") && matricula.equals("") && localizacion.equals("")){
            
            String hql = "FROM Car Where reservado = '" + estadoReserva + "'";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();
            
            return coches;
        }
        
        // BUSQUEDAS MULTIPLES
        
        if(!marca.equals("") && matricula.equals("") && !localizacion.equals("") && estadoReserva.equals("")){
            
            String hql = "FROM Car Where idBrand = '" + marca + "' and idLocation = '" + localizacion + "'";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();
            
            return coches;
        }else if(!marca.equals("") && matricula.equals("") && localizacion.equals("") && !estadoReserva.equals("")){
            
            String hql = "FROM Car Where idBrand = '" + marca + "' and reservado = '" + estadoReserva + "'";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();
            
            return coches;
        }else if(!localizacion.equals("") && marca.equals("") && matricula.equals("") && !estadoReserva.equals("")){
            
            String hql = "FROM Car Where idLocation = '" + localizacion + "' and reservado = '" + estadoReserva + "'";
            Query query = session.createQuery(hql);
            List<Car> coches = query.list();
            
            return coches;
        }
        
     
        
        return null;
    } 
    
    public List<Reservation> historialUsuario(int idUsuario){
        
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        
        String hql = "FROM Reservation where idUser = '" + idUsuario + "'";
        Query query = session.createQuery(hql);
        List<Reservation> reservas = query.list();
        
        if(reservas != null){
            return reservas;
        }else{
           return null;
        }
    }
    
    public int getCantidadModelos (String modelo){
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        
        String hql = "select count(idCar) from car, model where car.idModel = model.idModelo and model.name = '" + modelo + "'";
        Query query = session.createQuery(hql);
        List modelos = query.list();
        
        return (int) modelos.get(0);
    }
    public static String getMD5(String input) {
        try {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] messageDigest = md.digest(input.getBytes());
        BigInteger number = new BigInteger(1, messageDigest);
        String hashtext = number.toString(16);

        while (hashtext.length() < 32) {
        hashtext = "0" + hashtext;
        }
        return hashtext;
        }
        catch (NoSuchAlgorithmException e) {
        throw new RuntimeException(e);
        }
    }
    
    public Customer editUser(String nombre,String apellidos,String password, String email, String pais, int telefono,String dni,String imagen,String savePath){
        
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();   
        Session session = sessionFactory.openSession();       
        session.beginTransaction();
        
         
        String hql = "FROM Customer where email = '" + email + "'";
        Query query = session.createQuery(hql);
        List<Customer> usuario = query.list();
        
       usuario.get(0).setName(nombre);
       usuario.get(0).setSurnames(apellidos);
       
       String contrasenya = getMD5(password);
       
       usuario.get(0).setPassword(contrasenya);
       usuario.get(0).setEmail(email);
       usuario.get(0).setCountry(pais);
       usuario.get(0).setPhone(telefono);
       usuario.get(0).setDni(dni);
       usuario.get(0).setImagePath(savePath);
       usuario.get(0).setImageName(imagen);
       
       session.save(usuario.get(0));
        
       session.getTransaction().commit();
       session.close();
       
       return usuario.get(0);
    }
}
    