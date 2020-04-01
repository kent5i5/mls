package com.yinkin.mls;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@SpringBootApplication
@RestController
public class MlsApplication {

	public static void main(String[] args) {
		SpringApplication.run(MlsApplication.class, args);
	}
	
	@GetMapping("/home")
		public String hello(@RequestParam(value = "name", defaultValue = "ying") String name) {
		return String.format("This is the CI/CD project created by %s!", name);
	}
	
}