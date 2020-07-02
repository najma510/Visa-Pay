package com.example.demo.ui.dto;

public class MerchantDto {
	
	private String merchantPrimaryAccountNumber;
	private String merchantName;
	private String issuerName;
	private String cardType;
	private String city;
	private String country;
	private String postalCode;
	public String getMerchantPrimaryAccountNumber() {
		return merchantPrimaryAccountNumber;
	}
	public void setMerchantPrimaryAccountNumber(String merchantPrimaryAccountNumber) {
		this.merchantPrimaryAccountNumber = merchantPrimaryAccountNumber;
	}
	public String getMerchantName() {
		return merchantName;
	}
	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}
	public String getIssuerName() {
		return issuerName;
	}
	public void setIssuerName(String issuerName) {
		this.issuerName = issuerName;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	@Override
	public String toString() {
		return "MerchantDto [merchantPrimaryAccountNumber=" + merchantPrimaryAccountNumber + ", merchantName="
				+ merchantName + ", issuerName=" + issuerName + ", cardType=" + cardType + ", city=" + city
				+ ", country=" + country + ", postalCode=" + postalCode + "]";
	}
	
	
}
