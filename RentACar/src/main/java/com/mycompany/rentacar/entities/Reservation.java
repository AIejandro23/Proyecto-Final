/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.rentacar.entities;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Alejandro
 */
@Entity
@Table(name = "reservation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reservation.findAll", query = "SELECT r FROM Reservation r")
    , @NamedQuery(name = "Reservation.findByIdReservation", query = "SELECT r FROM Reservation r WHERE r.idReservation = :idReservation")
    , @NamedQuery(name = "Reservation.findByReservationDate", query = "SELECT r FROM Reservation r WHERE r.reservationDate = :reservationDate")
    , @NamedQuery(name = "Reservation.findByCollectionDate", query = "SELECT r FROM Reservation r WHERE r.collectionDate = :collectionDate")
    , @NamedQuery(name = "Reservation.findByReturnDate", query = "SELECT r FROM Reservation r WHERE r.returnDate = :returnDate")})
public class Reservation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idReservation")
    private Integer idReservation;
    @Column(name = "reservationDate")
    @Temporal(TemporalType.DATE)
    private Date reservationDate;
    @Column(name = "collectionDate")
    @Temporal(TemporalType.DATE)
    private Date collectionDate;
    @Column(name = "returnDate")
    @Temporal(TemporalType.DATE)
    private Date returnDate;
    @JoinColumn(name = "idCar", referencedColumnName = "idCar")
    @ManyToOne
    private Car idCar;
    @JoinColumn(name = "idUser", referencedColumnName = "idCustomer")
    @ManyToOne
    private Customer idUser;

    public Reservation() {
    }

    public Reservation(Integer idReservation) {
        this.idReservation = idReservation;
    }

    public Integer getIdReservation() {
        return idReservation;
    }

    public void setIdReservation(Integer idReservation) {
        this.idReservation = idReservation;
    }

    public Date getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate;
    }

    public Date getCollectionDate() {
        return collectionDate;
    }

    public void setCollectionDate(Date collectionDate) {
        this.collectionDate = collectionDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public Car getIdCar() {
        return idCar;
    }

    public void setIdCar(Car idCar) {
        this.idCar = idCar;
    }

    public Customer getIdUser() {
        return idUser;
    }

    public void setIdUser(Customer idUser) {
        this.idUser = idUser;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idReservation != null ? idReservation.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reservation)) {
            return false;
        }
        Reservation other = (Reservation) object;
        if ((this.idReservation == null && other.idReservation != null) || (this.idReservation != null && !this.idReservation.equals(other.idReservation))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.rentacar.entities.Reservation[ idReservation=" + idReservation + " ]";
    }
    
}
