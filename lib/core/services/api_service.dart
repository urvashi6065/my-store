

import 'dart:convert';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:mystore/models/product/product_model.dart';

import '../../models/category/category.dart';

class ApiService{


  static final  fire=FirebaseFirestore.instance;

  static  Future<List<CategoryModel>> fetchCategoriesData() async{
    List<CategoryModel> categoryList=[];
    final apiResponse = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
    final categoryData = jsonDecode(apiResponse.body) as List<dynamic>;
    for(int i = 0;i<categoryData.length;i++){
      categoryList.add(CategoryModel(id: categoryData[i].toString(), name: categoryData[i].toString().toUpperCase()));
    }
    return categoryList;
  }
  //
  static  Future<List<ProductModel>> fetchProductData({required String id}) async{
    List<ProductModel> productList=[];
    final apiResponse = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$id'));
    final productData = jsonDecode(apiResponse.body) as List<dynamic>;
    for(var e in productData){
      productList.add(ProductModel.fromJson(e));
    }

    return productList;
  }

}

