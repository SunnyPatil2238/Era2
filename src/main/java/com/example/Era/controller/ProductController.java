package com.example.Era.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Era.ProjectEraApplication;
import com.example.Era.model.Product;
import com.example.Era.service.ProductService;

@SpringBootApplication
@Controller
public class ProductController  extends SpringBootServletInitializer {

	@Override
	   protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	      return application.sources(ProjectEraApplication.class);
	   }
	
	public static void main(String[] args) {
		SpringApplication.run(ProjectEraApplication.class, args);
	} 

	@Autowired
	ProductService productService;

	@RequestMapping(value = { "AllProducts" })
	public String allProductRequest(HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			model.addAttribute("AllProd", productService.getAllProducts());
			model.addAttribute("mode", "Product_View");
			return "Product";
		}
		return "Error";
	}

	@GetMapping(value = "NewProduct")
	public String ProdItemAddPage(HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			model.addAttribute("mode", "Product_Item_Add");
			return "Product";
		}
		return "Error";
	}

	@PostMapping(value = "ProdAdd")
	public String ProdAdd(@RequestParam String Name, String Barcode, String Category, String Category_Info,
			String Quantity, String MRP, String Buying_Price, String Selling_Price, String profit, String Damage_Count,
			String sGst, String cGst, String iGst, String FreeProductid1, String FreeProductid2, HttpSession session,
			Model model) {
		if (session.getAttribute("name") != null) {
			Product product = new Product();
			product.setProductName(Name);
			product.setProductBarcode(Barcode);
			product.setProductCategory(Category);
			product.setProductCategoryDesc(Category_Info);
			if (Quantity.length() != 0)
				product.setQuantity(Integer.parseInt(Quantity));

			if (MRP.length() != 0)
				product.setProductMRP(Double.parseDouble(MRP));

			if (Buying_Price.length() != 0)
				product.setProductBuyingPrice(Double.parseDouble(Buying_Price));

			if (Selling_Price.length() != 0)
				product.setProductSellingPrice(Double.parseDouble(Selling_Price));

			if (profit.length() != 0)
				product.setProductProfit(Double.parseDouble(profit));

			if (Damage_Count.length() != 0)
				product.setProductDamageCount(Integer.parseInt(Damage_Count));

			if (sGst.length() != 0)
				product.setProductsGst(Double.parseDouble(sGst));

			if (cGst.length() != 0)
				product.setProductcGst(Double.parseDouble(cGst));

			if (iGst.length() != 0)
				product.setProductiGst(Double.parseDouble(iGst));

			if (FreeProductid1.length() != 0)
				product.setProductFreeProductid1(Double.parseDouble(FreeProductid1));

			if (FreeProductid2.length() != 0)
				product.setProductFreeProductid2(Double.parseDouble(FreeProductid2));

			System.out.println(Name + " " + Barcode + " " + Category + " " + Quantity + " " + MRP + " " + Buying_Price
					+ " " + Selling_Price + " " + profit + " " + Damage_Count + " " + sGst + " " + cGst + " " + iGst
					+ " " + FreeProductid1 + " " + FreeProductid2);

			productService.AddProduct(product);

			model.addAttribute("AllProd", productService.getAllProducts());
			model.addAttribute("mode", "Product_View");
			return "Product";
		}
		return "Error";
	}

	@PostMapping(value = "ProdModify")
	public String ProdModify(@RequestParam String Name, String Id, String Barcode, String Category,
			String Category_Info, String Quantity, String MRP, String Buying_Price, String Selling_Price, String profit,
			String Damage_Count, String sGst, String cGst, String iGst, String FreeProductid1, String FreeProductid2,
			HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			Product product = new Product();

			System.out.println(Id);
			if (Id.length() != 0)
				product.setProductId(Long.parseLong(Id));

			product.setProductName(Name);
			product.setProductBarcode(Barcode);
			product.setProductCategory(Category);
			product.setProductCategoryDesc(Category_Info);
			if (Quantity.length() != 0)
				product.setQuantity(Integer.parseInt(Quantity));

			if (MRP.length() != 0)
				product.setProductMRP(Double.parseDouble(MRP));

			if (Buying_Price.length() != 0)
				product.setProductBuyingPrice(Double.parseDouble(Buying_Price));

			if (Selling_Price.length() != 0)
				product.setProductSellingPrice(Double.parseDouble(Selling_Price));

			if (profit.length() != 0)
				product.setProductProfit(Double.parseDouble(profit));

			if (Damage_Count.length() != 0)
				product.setProductDamageCount(Integer.parseInt(Damage_Count));

			if (sGst.length() != 0)
				product.setProductsGst(Double.parseDouble(sGst));

			if (cGst.length() != 0)
				product.setProductcGst(Double.parseDouble(cGst));

			if (iGst.length() != 0)
				product.setProductiGst(Double.parseDouble(iGst));

			if (FreeProductid1.length() != 0)
				product.setProductFreeProductid1(Double.parseDouble(FreeProductid1));

			if (FreeProductid2.length() != 0)
				product.setProductFreeProductid2(Double.parseDouble(FreeProductid2));

			productService.AddProduct(product);

			model.addAttribute("AllProd", productService.getAllProducts());
			model.addAttribute("mode", "Product_View");
			return "Product";
		}
		return "Error";
	}

	@RequestMapping(value = "prodItemVew")
	public String prodItemVew(@RequestParam Long id, HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			model.addAttribute("mode", "Product_Item_Vew");
			model.addAttribute("Product", productService.findProdById(id).orElse(null));
			return "Product";
		}
		return "Error";
	}

	@RequestMapping(value = "updProd")
	public String uplProd(@RequestParam Long id, HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			model.addAttribute("mode", "Product_Item_Mod");
			model.addAttribute("Product", productService.findProdById(id).orElse(null));
			return "Product";
		}
		return "Error";
	}

	@RequestMapping(value = "delProd")
	public String delProd(@RequestParam Long id, HttpSession session, Model model) {

		if (session.getAttribute("name") != null) {
			productService.delProd(id);
			model.addAttribute("AllProd", productService.getAllProducts());
			model.addAttribute("mode", "Product_View");
			return "Product";
		}
		return "Error";
	}
}
