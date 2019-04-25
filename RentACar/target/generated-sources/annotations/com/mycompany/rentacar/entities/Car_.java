package com.mycompany.rentacar.entities;

import com.mycompany.rentacar.entities.Brand;
import com.mycompany.rentacar.entities.Location;
import com.mycompany.rentacar.entities.Reservation;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-04-26T01:07:33")
@StaticMetamodel(Car.class)
public class Car_ { 

    public static volatile SingularAttribute<Car, Location> idLocation;
    public static volatile SingularAttribute<Car, Brand> idBrand;
    public static volatile CollectionAttribute<Car, Reservation> reservationCollection;
    public static volatile SingularAttribute<Car, Integer> idCar;
    public static volatile SingularAttribute<Car, String> enrollment;

}