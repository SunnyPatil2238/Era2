package com.example.Era.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Era.ProjectEraApplication;
import com.example.Era.model.Customer;
import com.example.Era.service.CustService;

@SpringBootApplication
@Controller
public class CustomerController extends SpringBootServletInitializer {

	@Override
	   protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	      return application.sources(ProjectEraApplication.class);
	   }
	
	public static void main(String[] args) {
		SpringApplication.run(ProjectEraApplication.class, args);
	}
	
	@Autowired
	private CustService CustService;

	@GetMapping(value = { "/" })
	public String homePageRequest() {

		// return "index";
		return "Home";
	}
	// Customer Calls

	@GetMapping(value = { "AllCustomer" })
	public String allClientRequest(HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			model.addAttribute("AllCust", CustService.findAll());
			model.addAttribute("mode", "Cust_View");
			return "Customer";
		}
		return "Error";
	}

	@GetMapping(value = "/delCust")
	public String delCust(@RequestParam Long id, HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			CustService.delCust(id);
			model.addAttribute("AllCust", CustService.findAll());
			model.addAttribute("mode", "Cust_View");
			return "Customer";
		}
		return "Error";
	}

	@GetMapping(value = "/updCust")
	public String updCust(@RequestParam Long id, HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			model.addAttribute("mode", "Cust_Mod");
			model.addAttribute("Customer", CustService.findCustById(id));
			return "Customer";
		}
		return "Error";
	}

	@PostMapping(value = "/custMod")
	public String Modrequest(@RequestParam String CustFirstName, String CustLastName, String CustMail, String CustId,
			String CustAddress1, String CustAddress2, String CustCity, String CustTelephone, String CustBalance,
			HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			Customer customer = new Customer();
			customer.setCustId(Integer.parseInt(CustId));
			customer.setCustFirstName(CustFirstName);
			customer.setCustLastName(CustLastName);
			customer.setCustMail(CustMail);
			customer.setCustAddress1(CustAddress1);
			customer.setCustAddress2(CustAddress2);
			customer.setCustCity(CustCity);
			customer.setCustTelephone((CustTelephone));
			customer.setCustBalance(Long.parseLong((CustBalance)));

			CustService.addCust(customer);
			model.addAttribute("mode", "Cust_View");
			model.addAttribute("AllCust", CustService.findAll());
			return "Customer";
		}
		return "Error";
	}

	@GetMapping(value = "/custItemVew")
	public String custItemVew(@RequestParam Long id, HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			model.addAttribute("mode", "Cust_Item_Vew");
			model.addAttribute("Customer", CustService.findCustById(id));
			return "Customer";
		}
		return "Error";
	}

	@GetMapping(value = "NewCustomer")
	public String custItemAddPage(HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			model.addAttribute("mode", "Cust_Item_Add");
			return "Customer";
		}
		return "Error";
	}

	@PostMapping(value = "custAdd")
	public String custItemAdd(@RequestParam String CustFirstName, String CustLastName, String CustMail,
			String CustAddress1, String CustAddress2, String CustCity, String CustTelephone, String CustBalance,
			HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {

			Customer customer = new Customer();

			customer.setCustFirstName(CustFirstName);
			customer.setCustLastName(CustLastName);
			customer.setCustMail(CustMail);
			customer.setCustAddress1(CustAddress1);
			customer.setCustAddress2(CustAddress2);
			customer.setCustCity(CustCity);
			if (CustTelephone.length() != 0) {
				customer.setCustTelephone((CustTelephone));
			}
			if (CustBalance.length() != 0) {
				customer.setCustBalance(Long.parseLong((CustBalance)));
			}
			CustService.addCust(customer);

			model.addAttribute("AllCust", CustService.findAll());
			model.addAttribute("mode", "Cust_View");
			return "Customer";
		}
		return "Error";
	}
}
