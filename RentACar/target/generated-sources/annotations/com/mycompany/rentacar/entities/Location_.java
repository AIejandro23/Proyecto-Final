package com.mycompany.rentacar.entities;

import com.mycompany.rentacar.entities.Car;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-04-26T01:07:33")
@StaticMetamodel(Location.class)
public class Location_ { 

    public static volatile SingularAttribute<Location, Integer> idLocation;
    public static volatile SingularAttribute<Location, String> name;
    public static volatile CollectionAttribute<Location, Car> carCollection;

}