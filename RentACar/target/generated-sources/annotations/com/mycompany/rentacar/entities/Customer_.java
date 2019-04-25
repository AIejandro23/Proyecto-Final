package com.mycompany.rentacar.entities;

import com.mycompany.rentacar.entities.Reservation;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-04-26T01:07:33")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, String> country;
    public static volatile SingularAttribute<Customer, String> password;
    public static volatile SingularAttribute<Customer, Integer> phone;
    public static volatile SingularAttribute<Customer, String> name;
    public static volatile CollectionAttribute<Customer, Reservation> reservationCollection;
    public static volatile SingularAttribute<Customer, String> surnames;
    public static volatile SingularAttribute<Customer, Date> birthDate;
    public static volatile SingularAttribute<Customer, String> email;
    public static volatile SingularAttribute<Customer, Integer> idCustomer;

}