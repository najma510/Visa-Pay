package com.example.demo.servicesImpl;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Service;

import com.example.demo.services.MakePaymentsService;
import com.example.demo.ui.dto.PaymentDto;
import com.example.demo.ui.dto.PostPaymentDto;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.visa.developer.sample.funds_transfer_api.ApiClient;
import com.visa.developer.sample.funds_transfer_api.api.FundsTransferApi;
import com.visa.developer.sample.funds_transfer_api.model.PullfundspostPayload;
import com.visa.developer.sample.funds_transfer_api.model.PullfundspostResponse;
import com.visa.developer.sample.funds_transfer_api.model.PullfundstransactionsgetResponse;
import com.visa.developer.sample.funds_transfer_api.model.PushfundspostPayload;
import com.visa.developer.sample.funds_transfer_api.model.PushfundspostResponse;
import com.visa.developer.sample.funds_transfer_api.model.PushfundstransactionsgetResponse;
import com.visa.developer.sample.visa_alias_directory_api.api.AliasApiApi;

@Service
public class MakePaymentsServiceImpl implements MakePaymentsService {

	ApiClient apiClient;
	
	FundsTransferApi apiInstance;
	
	public MakePaymentsServiceImpl() {
		apiClient = new ApiClient();
		apiClient.setUsername("LP17LJODA8KWE8R79TCB21xodi6rUyy23m05AEw9bG1yyZHy8");
        apiClient.setPassword("A4oZ42tS");
        apiClient.setKeystorePath("/home/saurabh/Documents/certificates/myProject_keyAndCertBundle.jks");
        apiClient.setKeystorePassword("testing");
        apiClient.setPrivateKeyPassword("testing");
		apiInstance = new FundsTransferApi(apiClient);
	}
	
	@Override
	public PostPaymentDto makePayments(PaymentDto paymentDto) throws JsonMappingException, JsonProcessingException {
		PostPaymentDto returnValue = new PostPaymentDto();
		returnValue.setStatus("Success");
		returnValue.setTransactionId(6034325830L);
		return returnValue;
//		String jsonPayload = " \n" + 
//				"{\n" + 
//				"\"acquirerCountryCode\": \"840\",\n" + 
//				"\"acquiringBin\": \"408999\",\n" + 
//				"\"amount\": \"124.02\",\n" + 
//				"\"businessApplicationId\": \"AA\",\n" + 
//				"\"cardAcceptor\": {\n" + 
//				"\"address\": {\n" + 
//				"\"country\": \"USA\",\n" + 
//				"\"county\": \"081\",\n" + 
//				"\"state\": \"CA\",\n" + 
//				"\"zipCode\": \"94404\"\n" + 
//				"},\n" + 
//				"\"idCode\": \"ABCD1234ABCD123\",\n" + 
//				"\"name\": \"Visa Inc. USA-Foster City\",\n" + 
//				"\"terminalId\": \"ABCD1234\"\n" + 
//				"},\n" + 
//				"\"cavv\": \"0700100038238906000013405823891061668252\",\n" + 
//				"\"foreignExchangeFeeTransaction\": \"11.99\",\n" + 
//				"\"localTransactionDateTime\": \"2020-06-26T05:47:50\",\n" + 
//				"\"retrievalReferenceNumber\": \"330000550000\",\n" + 
//				"\"senderCardExpiryDate\": \"2015-10\",\n" + 
//				"\"senderCurrencyCode\": \"USD\",\n" + 
//				"\"senderPrimaryAccountNumber\": \"4895142232120006\",\n" + 
//				"\"surcharge\": \"11.99\",\n" + 
//				"\"systemsTraceAuditNumber\": \"451001\",\n" + 
//				"\"nationalReimbursementFee\": \"11.22\",\n" + 
//				"\"cpsAuthorizationCharacteristicsIndicator\": \"Y\",\n" + 
//				"\"addressVerificationData\": {\n" + 
//				"\"street\": \"XYZ St\",\n" + 
//				"\"postalCode\": \"12345\"\n" + 
//				"},\n" + 
//				"\"settlementServiceIndicator\": \"9\",\n" + 
//				"\"colombiaNationalServiceData\": {\n" + 
//				"\"countryCodeNationalService\": \"170\",\n" + 
//				"\"nationalReimbursementFee\": \"20.00\",\n" + 
//				"\"nationalNetMiscAmountType\": \"A\",\n" + 
//				"\"nationalNetReimbursementFeeBaseAmount\": \"20.00\",\n" + 
//				"\"nationalNetMiscAmount\": \"10.00\",\n" + 
//				"\"addValueTaxReturn\": \"10.00\",\n" + 
//				"\"taxAmountConsumption\": \"10.00\",\n" + 
//				"\"addValueTaxAmount\": \"10.00\",\n" + 
//				"\"costTransactionIndicator\": \"0\",\n" + 
//				"\"emvTransactionIndicator\": \"1\",\n" + 
//				"\"nationalChargebackReason\": \"11\"\n" + 
//				"},\n" + 
//				"\"riskAssessmentData\": {\n" + 
//				"\"delegatedAuthenticationIndicator\": true,\n" + 
//				"\"lowValueExemptionIndicator\": true,\n" + 
//				"\"traExemptionIndicator\": true,\n" + 
//				"\"trustedMerchantExemptionIndicator\": true,\n" + 
//				"\"scpExemptionIndicator\": true\n" + 
//				"},\n" + 
//				"\"visaMerchantIdentifier\": \"73625198\"\n" + 
//				"}";
//		ObjectMapper mapper = new ObjectMapper();
//        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
//        PullfundspostPayload body = mapper.readValue(jsonPayload, PullfundspostPayload.class);
//        PullfundspostResponse response = apiInstance.postpullfunds(body, new ParameterizedTypeReference<PullfundspostResponse>() {}, PullfundspostResponse.class, false);	
//        String statusIdentifier = response.getStatusIdentifier();
//        String actionCode = getPullFundsTransactionStatus(statusIdentifier);
//        if(actionCode.equals("00"))
//        {
//        	String pushActionCode = doPushFundsTransaction(paymentDto);
//        	if(pushActionCode.equals("00"))
//        	{
//        		returnValue.setStatus("Success");
//        		returnValue.setTransactionId(response.getTransactionIdentifier());
//        	}
//        }
//        else
//        {
//        	returnValue.setStatus("Unsuccessful");
//        }
//        return returnValue;
	}
	
	public String doPushFundsTransaction(PaymentDto paymentDto) throws JsonMappingException, JsonProcessingException {
		PostPaymentDto returnValue = new PostPaymentDto();
		String jsonPayload = " \n" + 
				"{\n" + 
				"\"acquirerCountryCode\": \"840\",\n" + 
				"\"acquiringBin\": \"408999\",\n" + 
				"\"amount\": \"124.05\",\n" + 
				"\"businessApplicationId\": \"AA\",\n" + 
				"\"cardAcceptor\": {\n" + 
				"\"address\": {\n" + 
				"\"country\": \"USA\",\n" + 
				"\"county\": \"San Mateo\",\n" + 
				"\"state\": \"CA\",\n" + 
				"\"zipCode\": \"94404\"\n" + 
				"},\n" + 
				"\"idCode\": \"CA-IDCode-77765\",\n" + 
				"\"name\": \"Visa Inc. USA-Foster City\",\n" + 
				"\"terminalId\": \"TID-9999\"\n" + 
				"},\n" + 
				"\"localTransactionDateTime\": \"2020-06-26T06:58:45\",\n" + 
				"\"merchantCategoryCode\": \"6012\",\n" + 
				"\"pointOfServiceData\": {\n" + 
				"\"motoECIIndicator\": \"0\",\n" + 
				"\"panEntryMode\": \"90\",\n" + 
				"\"posConditionCode\": \"00\"\n" + 
				"},\n" + 
				"\"recipientName\": \"rohan\",\n" + 
				"\"recipientPrimaryAccountNumber\": \"4957030420210496\",\n" + 
				"\"retrievalReferenceNumber\": \"412770451018\",\n" + 
				"\"senderAccountNumber\": \"4653459515756154\",\n" + 
				"\"senderAddress\": \"901 Metro Center Blvd\",\n" + 
				"\"senderCity\": \"Foster City\",\n" + 
				"\"senderCountryCode\": \"124\",\n" + 
				"\"senderName\": \"Mohammed Qasim\",\n" + 
				"\"senderReference\": \"\",\n" + 
				"\"senderStateCode\": \"CA\",\n" + 
				"\"sourceOfFundsCode\": \"05\",\n" + 
				"\"systemsTraceAuditNumber\": \"451018\",\n" + 
				"\"transactionCurrencyCode\": \"USD\",\n" + 
				"\"transactionIdentifier\": \"381228649430015\",\n" + 
				"\"settlementServiceIndicator\": \"9\",\n" + 
				"\"colombiaNationalServiceData\": {\n" + 
				"\"countryCodeNationalService\": \"170\",\n" + 
				"\"nationalReimbursementFee\": \"20.00\",\n" + 
				"\"nationalNetMiscAmountType\": \"A\",\n" + 
				"\"nationalNetReimbursementFeeBaseAmount\": \"20.00\",\n" + 
				"\"nationalNetMiscAmount\": \"10.00\",\n" + 
				"\"addValueTaxReturn\": \"10.00\",\n" + 
				"\"taxAmountConsumption\": \"10.00\",\n" + 
				"\"addValueTaxAmount\": \"10.00\",\n" + 
				"\"costTransactionIndicator\": \"0\",\n" + 
				"\"emvTransactionIndicator\": \"1\",\n" + 
				"\"nationalChargebackReason\": \"11\"\n" + 
				"}\n" + 
				"}";
		ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        PushfundspostPayload body = mapper.readValue(jsonPayload, PushfundspostPayload.class);
        PushfundspostResponse response = apiInstance.postpushfunds(body, new ParameterizedTypeReference<PushfundspostResponse>() {}, PushfundspostResponse.class, false);
        PushfundstransactionsgetResponse getResponse = apiInstance.getpushfundstransactions(response.getStatusIdentifier());
		return getResponse.getActionCode();
	}
	
	public String getPullFundsTransactionStatus(String statusIdentifier) throws JsonMappingException, JsonProcessingException {
        PullfundstransactionsgetResponse response = apiInstance.getpullfundstransactions(statusIdentifier);
        return response.getActionCode();
	}
	
	public String editLocalTime(String payload) {
        ZoneId zoneId = ZoneId.of("America/Los_Angeles");
        LocalDateTime localDateTime = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS);
        ZonedDateTime laDateTime = ZonedDateTime.of(localDateTime, zoneId);
        payload = payload.replaceAll("\"localTransactionDateTime\":\\s+\".{19}\"",
                "\"localTransactionDateTime\": \"" + DateTimeFormatter.ISO_LOCAL_DATE_TIME.format(laDateTime) + "\"");
        payload = payload.replaceAll("\"dateTimeLocal\":\\s+\".{10}\"",
                "\"dateTimeLocal\": \"" + DateTimeFormatter.ofPattern("MMddHHmmss").format(laDateTime) + "\"");
        return payload;
    }

    public String addRandomValue(String payload) {
        String randomAlphaNumericValue = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 8);
        SecureRandom rand = new SecureRandom();
        Integer randomNumber = rand.nextInt(90000) + 10000;
        payload = payload.replaceAll("random_string", randomAlphaNumericValue);
        payload = payload.replaceAll("random_integer", randomNumber.toString());
        payload = payload.replaceAll("random", randomAlphaNumericValue);
        return payload;
    }
    
    public String transformPayload(String payload) {
        payload = editLocalTime(payload);
        payload = addRandomValue(payload);
        return payload;
    }


}
