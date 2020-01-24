package com.example.library;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.example.library.domain.User;

/*
 *  Disable spring-security login screen
 *  @SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
 */

@SpringBootApplication
@ComponentScan({"com.example.library"})
public class LibraryApplication {

	public static void main(String[] args) {
		SpringApplication.run(LibraryApplication.class, args);

		User user = new User();
		user.setId(1);
		user.setName("Igor");
		user.setAge(23);
		user.setEmail("iwanyshyn@gmail.com");
		user.setPassword("password");

		System.out.println(user);
	}
}
