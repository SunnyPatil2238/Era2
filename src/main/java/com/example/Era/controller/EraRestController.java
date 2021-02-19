package com.example.Era.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.Era.ProjectEraApplication;
import com.example.Era.model.Customer;
import com.example.Era.model.Product;
import com.example.Era.service.CustService;
import com.example.Era.service.ProductService;

@SpringBootApplication
@RestController
public class EraRestController extends SpringBootServletInitializer {

	@Override
	   protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	      return application.sources(ProjectEraApplication.class);
	   }
	
	public static void main(String[] args) {
		SpringApplication.run(ProjectEraApplication.class, args);
	} 

	@Autowired
	private CustService CustService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/Rall")
	private List<Customer> lstAllCust(){
		return (List<Customer>) CustService.findAll(); 
	}
	
	@GetMapping("/Rid")
	private Optional<Customer> byId()
	{
		long l=1;
	return CustService.findCustById(l);
	}
	
	@RequestMapping("/BillingRestBarCode")
	public HashMap<String, Product> BillingRestBarCode(@RequestParam String id,HttpSession session) {
		
		return productService.getAllProductshmBarcode();
		
	}
	
	@RequestMapping("/BillingRestId")
	public HashMap<Long, Product> BillingRestId(@RequestParam String id,HttpSession session) {
		
		return productService.getAllProductshmid();
	
	}
	
	@RequestMapping("/saveBill")
	public String savebills(HttpSession session) {
		if (session.getAttribute("name") != null)
		{
			System.out.println("inside saveBill");
		return "inside saveBill";
		}
		System.out.println("Outside saveBill");
		return "Outside saveBill";
		
	}
	
	
}
