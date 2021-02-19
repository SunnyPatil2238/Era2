package com.example.Era.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Era.model.Product;
import com.example.Era.repository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	ProductRepository productRepository;
	
	public void AddProduct(Product product ) {
		productRepository.save(product);
	}
	
	
	public HashMap<String,Product> getAllProductshmBarcode()
	{
		HashMap<String,Product> prodAllhm=new HashMap<String, Product>();
		for(Product product:productRepository.findAll())
		{
			if(product.getProductBarcode()!=null)
			prodAllhm.put(product.getProductBarcode(),product);
		}
		return prodAllhm;
	}
	
	public HashMap<Long,Product> getAllProductshmid()
	{
		HashMap<Long,Product> prodAllhm=new HashMap<Long, Product>();
		for(Product product:productRepository.findAll())
		{
			prodAllhm.put(product.getProductId(),product);
		}
		return prodAllhm;
	}
	
	
	public List<Product> getAllProducts()
	{
		List<Product> prodAllList=new ArrayList<Product>();
		for(Product product:productRepository.findAll())
		{
			prodAllList.add(product);
		}
		return prodAllList;
	}
	
	public void delProd(Long id) {
		productRepository.deleteById(id);
	}
	
	public Optional<Product> findProdById(Long id)
	{
		return productRepository.findById(id);
	}
	

}
