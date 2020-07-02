package com.example.demo.services;

import com.example.demo.ui.dto.PaymentDto;
import com.example.demo.ui.dto.PostPaymentDto;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

public interface MakePaymentsService 
{
	public PostPaymentDto makePayments(PaymentDto paymentDto) throws JsonMappingException, JsonProcessingException;

}
