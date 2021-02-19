package com.example.Era.controller;

import java.net.SocketException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Era.ProjectEraApplication;
import com.example.Era.model.App;
import com.example.Era.model.TrippleDes;
import com.example.Era.model.User;
import com.example.Era.repository.UserRepository;
import com.example.Era.service.ProductService;

@SpringBootApplication
@Controller
public class HomeController  extends SpringBootServletInitializer {

	@Override
	   protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	      return application.sources(ProjectEraApplication.class);
	   }
	
	public static void main(String[] args) {
		SpringApplication.run(ProjectEraApplication.class, args);
	}  

	@Autowired
	App app;

	@Autowired
	TrippleDes trippleDes;

	@Autowired
	UserRepository userRepository;
	
	@Autowired
	ProductService productService;

	@RequestMapping("/index")
	public String index(@RequestParam String login, String password, HttpSession session) throws SocketException {

		//System.out.println("Login" + login);
		//System.out.println("password" + password);

		//String addresses[] = app.getpcMacAddress();

		User user = userRepository.findById(trippleDes.encrypt(login)).orElse(null);

		if (user != null) {
			if (login.equals(trippleDes.decrypt(user.getUserName()))) {
				System.out.println("Username is correct");

				if (password.equals(trippleDes.decrypt(user.getPassword()))) {
					System.out.println("Password is correct");

					/*if (addresses[1].equals(trippleDes.decrypt(user.getVerify()))) {
						System.out.println("Verify verifierd");
					} else {

						System.out.println("Verify Failed");
						return "Error";
					}*/

				} else {
					System.out.println("Password is Incorrect");
					return "Error";
				}

			} else {
				System.out.println("Username is Incorrect");
				return "Error";
			}
		} else {
			return "Error";
		}

		//System.out.println("address =" + addresses[1]);
		//System.out.println("db address" + trippleDes.decrypt(user.getVerify()));
		/*
		 * String encryptAddress=trippleDes.encrypt(address);
		 * System.out.println("encryptAddress  ="+encryptAddress);
		 * 
		 * encryptAddress=trippleDes.encrypt(login);
		 * System.out.println(login+" "+encryptAddress);
		 * 
		 * encryptAddress=trippleDes.encrypt(password);
		 * System.out.println(password+" "+encryptAddress);
		 * 
		 * 
		 * String decryptAddress=trippleDes.decrypt(encryptAddress);
		 * System.out.println(decryptAddress);
		 */

		session.setAttribute("name", login);
		return "index";
	}

	@RequestMapping("/logo")
	public String logo(HttpSession session) {
		if (session.getAttribute("name") != null)
			return "index";

		return "Error";
	}
	
	@RequestMapping("/Billing")
	public String Billing(HttpSession session,Model model) {
		if (session.getAttribute("name") != null)
		{
						return "Billing";
		}

		
		return "Error";
		
	}
	
	@RequestMapping("/printBarcode")
	public String printBarcode(HttpSession session,Model model) {
		if (session.getAttribute("name") != null)
		{
						return "printBarcode";
		}

		
		return "Error";
		
	}
	
	@RequestMapping("/Convert")
	public String Convert(HttpSession session,Model model) {
		if (session.getAttribute("name") != null)
		{
						return "Convert";
		}

		
		return "Error";
		
	}
	
	
	
}
