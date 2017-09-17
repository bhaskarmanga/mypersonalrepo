package com.omniwyse.booklibrary;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.SecurityAutoConfiguration;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class BookLibrary {

    private static final Logger LOGGER = LoggerFactory.getLogger(BookLibrary.class);

    public static void main(String ar[]) throws IOException {
    	
        LOGGER.info("Starting BookLibrary");
        
        SpringApplication.run(BookLibrary.class, ar);
    }
}
