package com.example.demo.ui.controllers;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;


import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class justkidding {
	public static void main(String[] args) throws UnsupportedEncodingException, DecoderException
	{
		long currentTime = System.currentTimeMillis();
		System.out.println(currentTime);
		String x = "254711333888:200:" + Long.toString(currentTime);
//		String xx = Base64.getUrlEncoder().encodeToString(x.getBytes("utf-8"));
//		System.out.println(xx);
//		byte[] ans = Base64.getUrlDecoder().decode(xx);
//		String ans1 = new String(ans, "utf-8");
//		System.out.println(ans1);
//		
		String ss = encrypt(x, "1a2f4d3s2d");
		System.out.println(ss + "1a2f4d3s2d");
		byte[] xx = Hex.decodeHex(ss);
		String s1 = decrypt(xx,  "1a2f4d3s2d");
		System.out.println(s1);
		
		
	}
	public static SecretKeySpec setKey(String myKey) 
    {
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
        } 
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } 
        catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
	public static String decrypt(byte[] strToDecrypt, String secret) 
    {
        try
        {
            SecretKeySpec secretKey = setKey(secret);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKey);
            return new String(cipher.doFinal(strToDecrypt));
        } 
        catch (Exception e) 
        {
            System.out.println("Error while decrypting: " + e.toString());
        }
        return null;
    }
	public static String encrypt(String strToEncrypt, String secret) 
    {
        try
        {
            SecretKeySpec secretKey = setKey(secret);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            return Hex.encodeHexString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
        } 
        catch (Exception e) 
        {
            System.out.println("Error while encrypting: " + e.toString());
        }
        return null;
    }

}