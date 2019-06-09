/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.rentacar.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 *
 * @author Alejandro
 */
@Entity
@Table(name = "car")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Car.findAll", query = "SELECT c FROM Car c")
    , @NamedQuery(name = "Car.findByIdCar", query = "SELECT c FROM Car c WHERE c.idCar = :idCar")
    , @NamedQuery(name = "Car.findByImageName", query = "SELECT c FROM Car c WHERE c.imageName = :imageName")
    , @NamedQuery(name = "Car.findByImagePath", query = "SELECT c FROM Car c WHERE c.imagePath = :imagePath")
    , @NamedQuery(name = "Car.findByEnrollment", query = "SELECT c FROM Car c WHERE c.enrollment = :enrollment")
    , @NamedQuery(name = "Car.findByReservado", query = "SELECT c FROM Car c WHERE c.reservado = :reservado")
    , @NamedQuery(name = "Car.findByPricePerDay", query = "SELECT c FROM Car c WHERE c.pricePerDay = :pricePerDay")})
public class Car implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idCar")
    private Integer idCar;
    @Size(max = 255)
    @Column(name = "imageName")
    private String imageName;
    @Size(max = 255)
    @Column(name = "imagePath")
    private String imagePath;
    @Size(max = 20)
    @Column(name = "enrollment")
    private String enrollment;
    @Basic(optional = false)
    @NotNull
    @Column(name = "reservado")
    private int reservado;
    @Basic(optional = false)
    @NotNull
    @Column(name = "pricePerDay")
    private double pricePerDay;
    @JoinColumn(name = "idModel", referencedColumnName = "idModelo")
    @ManyToOne
    private Model idModel;
    @JoinColumn(name = "idBrand", referencedColumnName = "idBrand")
    @ManyToOne
    private Brand idBrand;
    @JoinColumn(name = "idLocation", referencedColumnName = "idLocation")
    @ManyToOne
    private Location idLocation;
    @OneToMany(mappedBy = "idCar")
    private Collection<Reservation> reservationCollection;

    public Car() {
    }

    public Car(Integer idCar) {
        this.idCar = idCar;
    }

    public Car(Integer idCar, int reservado, double pricePerDay) {
        this.idCar = idCar;
        this.reservado = reservado;
        this.pricePerDay = pricePerDay;
    }

    public Integer getIdCar() {
        return idCar;
    }

    public void setIdCar(Integer idCar) {
        this.idCar = idCar;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getEnrollment() {
        return enrollment;
    }

    public void setEnrollment(String enrollment) {
        this.enrollment = enrollment;
    }

    public int getReservado() {
        return reservado;
    }

    public void setReservado(int reservado) {
        this.reservado = reservado;
    }

    public double getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(double pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public Model getIdModel() {
        return idModel;
    }

    public void setIdModel(Model idModel) {
        this.idModel = idModel;
    }

    public Brand getIdBrand() {
        return idBrand;
    }

    public void setIdBrand(Brand idBrand) {
        this.idBrand = idBrand;
    }

    public Location getIdLocation() {
        return idLocation;
    }

    public void setIdLocation(Location idLocation) {
        this.idLocation = idLocation;
    }

    @XmlTransient
    @JsonIgnore
    public Collection<Reservation> getReservationCollection() {
        return reservationCollection;
    }

    public void setReservationCollection(Collection<Reservation> reservationCollection) {
        this.reservationCollection = reservationCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idCar != null ? idCar.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Car)) {
            return false;
        }
        Car other = (Car) object;
        if ((this.idCar == null && other.idCar != null) || (this.idCar != null && !this.idCar.equals(other.idCar))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.rentacar.entities.Car[ idCar=" + idCar + " ]";
    }
    
}
