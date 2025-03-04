package ru.isands.test.estore.dao.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.isands.test.estore.dao.entity.ElectroEmployee;
import ru.isands.test.estore.dao.entity.ElectroEmployeeId;

public interface ElectroEmployeeRepository extends JpaRepository<ElectroEmployee, ElectroEmployeeId> {
}