package com.packt.webstore.service.impl;

import com.packt.webstore.domain.Product;
import com.packt.webstore.domain.repository.ProductRepository;
import com.packt.webstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductRepository repository;

    @Override
    public List<Product> getAllProducts() {
        return repository.getAllProducts();
    }

    @Override
    public void updateAllStock() {
        List<Product> allProducts = repository.getAllProducts();
        for (Product product : allProducts) {
            if (product.getUnitsInStock() < 500) {
                repository.updateStock(product.getProductId(), product.getUnitsInStock() + 1000);
            }
        }
    }

    @Override
    public List<Product> getProductsByCategory(String category) {
        return repository.getProductsByCategory(category);
    }

    @Override
    public List<Product> getProductsByFilter(Map<String, List<String>> filterParams) {
        return repository.getProductsByFilter(filterParams);
    }

    @Override
    public Product getProductById(String productID) {
        return repository.getProductById(productID);
    }

    @Override
    public void addProduct(Product product) {
        repository.addProduct(product);
    }
}
