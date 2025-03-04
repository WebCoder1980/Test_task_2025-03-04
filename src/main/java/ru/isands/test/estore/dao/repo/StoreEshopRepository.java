package ru.isands.test.estore.dao.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.isands.test.estore.dao.entity.StoreEshop;
import ru.isands.test.estore.dao.entity.StoreEshopId;

public interface StoreEshopRepository extends JpaRepository<StoreEshop, StoreEshopId> {
}