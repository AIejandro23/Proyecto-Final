package com.mycompany.rentacar.entities;

import com.mycompany.rentacar.entities.Car;
import com.mycompany.rentacar.entities.Customer;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-04-26T01:07:33")
@StaticMetamodel(Reservation.class)
public class Reservation_ { 

    public static volatile SingularAttribute<Reservation, Integer> idReservation;
    public static volatile SingularAttribute<Reservation, Customer> idUser;
    public static volatile SingularAttribute<Reservation, Date> returnDate;
    public static volatile SingularAttribute<Reservation, Date> reservationDate;
    public static volatile SingularAttribute<Reservation, Date> collectionDate;
    public static volatile SingularAttribute<Reservation, Car> idCar;

}