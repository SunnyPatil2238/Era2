package com.example.Era;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ProjectEraApplication  extends SpringBootServletInitializer  {

	@Override
	   protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	      return application.sources(ProjectEraApplication.class);
	   }
	
	public static void main(String[] args) {
		SpringApplication.run(ProjectEraApplication.class, args);
	}

}

//version
