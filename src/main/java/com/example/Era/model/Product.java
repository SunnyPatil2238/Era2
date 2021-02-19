package com.example.Era.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="Product")
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="id")
	private long ProductId;
	
	@Column(name ="barcode")
	private String ProductBarcode;
	
	@Column(name ="category")
	private String ProductCategory;
	
	@Column(name ="categoryDesc")
	private String ProductCategoryDesc;
	
	@Column(name ="name")
	private String ProductName;
	
	@Column(name ="mRP")
	private double ProductMRP;
	
	@Column(name ="buyingPrice")
	private double ProductBuyingPrice;
	
	@Column(name ="quantity")
	private int Quantity;
	
	@Column(name ="sellingPrice")
	private double ProductSellingPrice;
	
	@Column(name ="profit")
	private double ProductProfit;
	
	@Column(name ="damageCount")
	private int ProductDamageCount;
	
	@Column(name ="cGst")
	private double ProductcGst;
	
	@Column(name ="sGst")
	private double ProductsGst;
	
	@Column(name ="iGst")
	private double ProductiGst;
	
	@Column(name ="freeProductid1")
	private double  ProductFreeProductid1;
	
	@Column(name ="freeProductid2")
	private double  ProductFreeProductid2;

	public long getProductId() {
		return ProductId;
	}

	public void setProductId(long productId) {
		ProductId = productId;
	}

	public String getProductBarcode() {
		return ProductBarcode;
	}

	public void setProductBarcode(String productBarcode) {
		ProductBarcode = productBarcode;
	}

	public String getProductCategory() {
		return ProductCategory;
	}

	public void setProductCategory(String productCategory) {
		ProductCategory = productCategory;
	}
	
	public String getProductCategoryDesc() {
		return ProductCategoryDesc;
	}

	public void setProductCategoryDesc(String productCategoryDesc) {
		ProductCategoryDesc = productCategoryDesc;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public double getProductMRP() {
		return ProductMRP;
	}

	public void setProductMRP(double productMRP) {
		ProductMRP = productMRP;
	}

	public double getProductBuyingPrice() {
		return ProductBuyingPrice;
	}

	public void setProductBuyingPrice(double productBuyingPrice) {
		ProductBuyingPrice = productBuyingPrice;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public double getProductSellingPrice() {
		return ProductSellingPrice;
	}

	public void setProductSellingPrice(double productSellingPrice) {
		ProductSellingPrice = productSellingPrice;
	}

	public double getProductProfit() {
		return ProductProfit;
	}

	public void setProductProfit(double productProfit) {
		ProductProfit = productProfit;
	}

	public int getProductDamageCount() {
		return ProductDamageCount;
	}

	public void setProductDamageCount(int productDamageCount) {
		ProductDamageCount = productDamageCount;
	}

	public double getProductcGst() {
		return ProductcGst;
	}

	public void setProductcGst(double productcGst) {
		ProductcGst = productcGst;
	}

	public double getProductsGst() {
		return ProductsGst;
	}

	public void setProductsGst(double productsGst) {
		ProductsGst = productsGst;
	}

	public double getProductiGst() {
		return ProductiGst;
	}

	public void setProductiGst(double productiGst) {
		ProductiGst = productiGst;
	}

	public double getProductFreeProductid1() {
		return ProductFreeProductid1;
	}

	public void setProductFreeProductid1(double productFreeProductid1) {
		ProductFreeProductid1 = productFreeProductid1;
	}

	public double getProductFreeProductid2() {
		return ProductFreeProductid2;
	}

	public void setProductFreeProductid2(double productFreeProductid2) {
		ProductFreeProductid2 = productFreeProductid2;
	}


	
}
