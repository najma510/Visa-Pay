package com.example.demo.ui.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashSet;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpSession;

import org.bouncycastle.util.encoders.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.yaml.snakeyaml.util.UriEncoder;

import com.example.demo.services.MakePaymentsService;
import com.example.demo.services.ResolveMerchantDetailsService;
import com.example.demo.servicesImpl.ResolveMerchantDetailsServiceImpl;
import com.example.demo.ui.dto.MerchantDto;
import com.example.demo.ui.dto.PaymentDto;
import com.example.demo.ui.dto.PostPaymentDto;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.visa.developer.sample.visa_alias_directory_api.ApiClient;
import org.apache.commons.codec.DecoderException;

@Controller
public class PaymentController {	

	@Autowired
	MerchantDto merchantDto;
	
	@Autowired
	ResolveMerchantDetailsService resolveMerchantDetailsService;
	
	@Autowired
	MakePaymentsService makePaymentsService;
	
		
	@GetMapping(path = "payments/{field}")
	public ModelAndView renderPaymentPage(@PathVariable String field) throws UnsupportedEncodingException {
		System.out.println(field);
		String merchantAlias = "";
		double amount = 0.0d;
		String key = field.substring(field.length() - 10);
		field = field.substring(0, field.length() - 10);
		byte[] s = Hex.decode(field);
		String decryptedField = decrypt(s, key);
		int idx = decryptedField.lastIndexOf(':');
		long timeOfCreation = Long.parseLong(decryptedField.substring(idx + 1));
		int idx2 = decryptedField.indexOf(':');
		merchantAlias = decryptedField.substring(0, idx2);
		amount = Double.parseDouble(decryptedField.substring(idx2 + 1, idx));
		long currentTime = System.currentTimeMillis();
		long diff = (currentTime - timeOfCreation) / 600000L;
		if(diff > 0) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("linkexpired");
			return modelAndView;
		}
		merchantDto = resolveMerchantDetailsService.getMerchantDetails(merchantAlias);
		System.out.println(merchantDto);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("paymentGateway");
		modelAndView.addObject("obj", merchantDto);
		modelAndView.addObject("amountToBePaid", amount);
		return modelAndView;
	}
	
	@PostMapping(path = "payments/confirm")
	public ModelAndView makePayment() throws JsonMappingException, JsonProcessingException {
		System.out.println("yes I am here");
		PostPaymentDto postPaymentDto = makePaymentsService.makePayments(new PaymentDto());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("confirmation");
		modelAndView.addObject("obj", postPaymentDto);
		return modelAndView;
	}
	
	public static SecretKeySpec setKey(String myKey) {
		byte[] key;
		SecretKeySpec secretKey;
        MessageDigest sha = null;
        try {
            key = myKey.getBytes("UTF-8");
            sha = MessageDigest.getInstance("SHA-1");
            key = sha.digest(key);
            key = Arrays.copyOf(key, 16); 
            secretKey = new SecretKeySpec(key, "AES");
            return secretKey;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
	public static String decrypt(byte[] strToDecrypt, String secret) {
        try {
            SecretKeySpec secretKey = setKey(secret);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            return new String(cipher.doFinal(strToDecrypt));
        } catch (Exception e) {
            System.out.println("Error while decrypting: " + e.toString());
        }
        return null;
    }
	public static long computeHash(String s)
	{
		long M = (long)(1e9 + 7);
		int n = s.length();
		long ans = 0L;
		long alpha = 64L;
		long vv = 1L;
		for(int i=0;i<n;i++) {
			vv = (vv * alpha) % M; 
			int x = s.charAt(i) - '0';
			ans = (ans + (vv * x) % M) % M;
		}
		return ans;
	}
}
