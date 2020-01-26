package com.example.library;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/*
 *  Disable spring-security login screen
 *  @SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
 */

@SpringBootApplication
@ComponentScan({"com.example.library"})
public class LibraryApplication {

	public static void main(String[] args) {
		SpringApplication.run(LibraryApplication.class, args);
	}
}
