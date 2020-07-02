package com.example.demo.servicesImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.services.ResolveMerchantDetailsService;
import com.example.demo.ui.dto.MerchantDto;
import com.visa.developer.sample.visa_alias_directory_api.ApiClient;
import com.visa.developer.sample.visa_alias_directory_api.api.AliasApiApi;
import com.visa.developer.sample.visa_alias_directory_api.model.ResolvepostPayload;
import com.visa.developer.sample.visa_alias_directory_api.model.ResolvepostResponse;


@Service
public class ResolveMerchantDetailsServiceImpl implements ResolveMerchantDetailsService {


	ApiClient apiClient;
	
	AliasApiApi apiInstance;
	
	public ResolveMerchantDetailsServiceImpl() {
		apiClient = new ApiClient();
		apiClient.setUsername("LP17LJODA8KWE8R79TCB21xodi6rUyy23m05AEw9bG1yyZHy8");
        apiClient.setPassword("A4oZ42tS");
        apiClient.setKeystorePath("/home/saurabh/Documents/certificates/myProject_keyAndCertBundle.jks");
        apiClient.setKeystorePassword("testing");
        apiClient.setPrivateKeyPassword("testing");
		apiInstance = new AliasApiApi(apiClient);
	}

	@Override
	public MerchantDto getMerchantDetails(String merchantAlias) {
		MerchantDto returnValue = new MerchantDto();
		ResolvepostPayload resolvepostPayload = new ResolvepostPayload();
		resolvepostPayload.setAlias(merchantAlias);
		resolvepostPayload.setBusinessApplicationId("PP");
		try {
			
			ResolvepostResponse result = apiInstance.postResolve(resolvepostPayload);
			System.out.println(result);
			returnValue.setMerchantPrimaryAccountNumber(result.getRecipientPrimaryAccountNumber());
			returnValue.setMerchantName(result.getRecipientName());
			returnValue.setIssuerName(result.getIssuerName());
			returnValue.setCardType(result.getCardType());
			returnValue.setCity(result.getCity());
			returnValue.setCountry(result.getCountry());
			return returnValue;
		} catch(Exception e) {
			System.out.println("Exception when calling Resolve API");
			e.printStackTrace();
		}
		return null;
	}

}
