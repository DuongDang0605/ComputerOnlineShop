package com.example.computeronlineshop.service;

import com.example.computeronlineshop.modal.entity.Product;
import com.example.computeronlineshop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    public List<Product> listProducts(String key) {
        if (key == null || key.trim().isEmpty() || key.equals("null")) {
            return productRepository.searchProductsGlobal("");
        }
        return productRepository.searchProductsGlobal(key.trim());
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Sản phẩm không tồn tại với ID: " + id));
    }
}
