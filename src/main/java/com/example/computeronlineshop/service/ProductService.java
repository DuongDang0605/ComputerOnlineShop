package com.example.computeronlineshop.service;

import com.example.computeronlineshop.modal.entity.Product;
import com.example.computeronlineshop.repository.BrandRepository;
import com.example.computeronlineshop.repository.ComponentRepository;
import com.example.computeronlineshop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private BrandRepository brandRepository;
    @Autowired
    private ComponentRepository componentRepository;

    public List<Product> searchProducts(String name, String brandName, String typeName) {
        return productRepository.searchProducts(name, brandName, typeName);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Sản phẩm không tồn tại với ID: " + id));
    }
}
