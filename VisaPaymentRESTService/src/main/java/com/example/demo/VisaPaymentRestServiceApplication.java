package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.example.demo.ui.dto.MerchantDto;
import com.visa.developer.sample.visa_alias_directory_api.ApiClient;

@SpringBootApplication
public class VisaPaymentRestServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(VisaPaymentRestServiceApplication.class, args);
	}
	

	@Bean
	public MerchantDto merchantDto() {
		return new MerchantDto();
	}
	
}
