package com.example.Era.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.Era.model.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{

}
