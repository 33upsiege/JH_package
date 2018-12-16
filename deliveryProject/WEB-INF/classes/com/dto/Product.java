package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Product")
public class Product {

   private String menu_code;
   private String menu_img;
   private String menu_category;   
   private String menu_name;
   private int menu_price;
   private String menu_content_1;
   private String menu_content_2;
   private String menu_recipe;
   private String menu_total_sales_amount;
   public Product() {
      super();
      // TODO Auto-generated constructor stub
   }
   public Product(String menu_code, String menu_img, String menu_category, String menu_name, int menu_price,
         String menu_content_1, String menu_content_2, String menu_recipe, String menu_total_sales_amount) {
      super();
      this.menu_code = menu_code;
      this.menu_img = menu_img;
      this.menu_category = menu_category;
      this.menu_name = menu_name;
      this.menu_price = menu_price;
      this.menu_content_1 = menu_content_1;
      this.menu_content_2 = menu_content_2;
      this.menu_recipe = menu_recipe;
      this.menu_total_sales_amount = menu_total_sales_amount;
   }
   public String getMenu_code() {
      return menu_code;
   }
   public void setMenu_code(String menu_code) {
      this.menu_code = menu_code;
   }
   public String getMenu_img() {
      return menu_img;
   }
   public void setMenu_img(String menu_img) {
      this.menu_img = menu_img;
   }
   public String getMenu_category() {
      return menu_category;
   }
   public void setMenu_category(String menu_category) {
      this.menu_category = menu_category;
   }
   public String getMenu_name() {
      return menu_name;
   }
   public void setMenu_name(String menu_name) {
      this.menu_name = menu_name;
   }
   public int getMenu_price() {
      return menu_price;
   }
   public void setMenu_price(int menu_price) {
      this.menu_price = menu_price;
   }
   public String getMenu_content_1() {
      return menu_content_1;
   }
   public void setMenu_content_1(String menu_content_1) {
      this.menu_content_1 = menu_content_1;
   }
   public String getMenu_content_2() {
      return menu_content_2;
   }
   public void setMenu_content_2(String menu_content_2) {
      this.menu_content_2 = menu_content_2;
   }
   public String getMenu_recipe() {
      return menu_recipe;
   }
   public void setMenu_recipe(String menu_recipe) {
      this.menu_recipe = menu_recipe;
   }
   public String getMenu_total_sales_amount() {
      return menu_total_sales_amount;
   }
   public void setMenu_total_sales_amount(String menu_total_sales_amount) {
      this.menu_total_sales_amount = menu_total_sales_amount;
   }
   @Override
   public String toString() {
      return "Product [menu_code=" + menu_code + ", menu_img=" + menu_img + ", menu_category=" + menu_category
            + ", menu_name=" + menu_name + ", menu_price=" + menu_price + ", menu_content_1=" + menu_content_1
            + ", menu_content_2=" + menu_content_2 + ", menu_recipe=" + menu_recipe + ", menu_total_sales_amount="
            + menu_total_sales_amount + "]";
   }
   
   
   
}