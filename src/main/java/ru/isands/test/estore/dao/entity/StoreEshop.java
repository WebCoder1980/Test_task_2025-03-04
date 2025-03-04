package ru.isands.test.estore.dao.entity;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@Entity
@Table(name = "store_eshop")
public class StoreEshop implements Serializable {

    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private StoreEshopId id;

    @ManyToOne
    @MapsId("electroId")
    @JoinColumn(name = "electroId", nullable = false)
    private ElectroItem electroItem;

    @ManyToOne
    @MapsId("shopId")
    @JoinColumn(name = "shopId", nullable = false)
    private Shop shop;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;
}

@Embeddable
public class StoreEshopId implements Serializable {

    private static final long serialVersionUID = 1L;

    @Column(name = "electroId")
    private Long electroId;

    @Column(name = "shopId")
    private Long shopId;
}