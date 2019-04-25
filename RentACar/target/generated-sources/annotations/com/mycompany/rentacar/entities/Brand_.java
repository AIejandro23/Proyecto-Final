package com.mycompany.rentacar.entities;

import com.mycompany.rentacar.entities.Car;
import com.mycompany.rentacar.entities.Model;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-04-26T01:07:33")
@StaticMetamodel(Brand.class)
public class Brand_ { 

    public static volatile SingularAttribute<Brand, Integer> idBrand;
    public static volatile SingularAttribute<Brand, String> name;
    public static volatile CollectionAttribute<Brand, Car> carCollection;
    public static volatile CollectionAttribute<Brand, Model> modelCollection;

}