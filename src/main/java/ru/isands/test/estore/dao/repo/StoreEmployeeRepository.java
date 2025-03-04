package ru.isands.test.estore.dao.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.isands.test.estore.dao.entity.StoreEmployee;

public interface StoreEmployeeRepository extends JpaRepository<StoreEmployee, Long> {
}