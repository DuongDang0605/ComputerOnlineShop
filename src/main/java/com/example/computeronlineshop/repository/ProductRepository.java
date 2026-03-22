package com.example.computeronlineshop.repository;

import com.example.computeronlineshop.modal.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    @Query("SELECT p FROM Product p " +
            "JOIN FETCH p.category c " +
            "JOIN FETCH c.brand b " +
            "JOIN FETCH c.component comp " +
            "WHERE p.status = 1 " +
            "AND (:key IS NULL OR :key = '' OR " +
            "      LOWER(p.productName) LIKE LOWER(CONCAT('%', :key, '%')) OR " +
            "      LOWER(b.brandName) LIKE LOWER(CONCAT('%', :key, '%')) OR " +
            "      LOWER(comp.componentName) LIKE LOWER(CONCAT('%', :key, '%')))")
    List<Product> searchProductsGlobal(@Param("key") String key);
}
