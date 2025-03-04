package ru.isands.test.estore.dao.entity;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@Entity
@Table(name = "electro_employee")
public class ElectroEmployee implements Serializable {

    private static final long serialVersionUID = 1L;

    @EmbeddedId
    private ElectroEmployeeId id;

    @ManyToOne
    @MapsId("electroItemTypeId")
    @JoinColumn(name = "electro_item_typeId", nullable = false)
    private ElectroItemType electroItemType;

    @ManyToOne
    @MapsId("employeeId")
    @JoinColumn(name = "employeeId", nullable = false)
    private StoreEmployee employee;
}

@Embeddable
public class ElectroEmployeeId implements Serializable {

    private static final long serialVersionUID = 1L;

    @Column(name = "electro_item_typeId")
    private Long electroItemTypeId;

    @Column(name = "employeeId")
    private Long employeeId;
}