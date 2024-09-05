import 'package:flutter/material.dart';
import 'package:mystore/core/services/api_service.dart';
import 'package:mystore/models/product/product_model.dart';


class ProductProvider with ChangeNotifier{
  List<ProductModel> productList=[];
  Future<void> getAllProduct({required String id}) async {
    productList=await ApiService.fetchProductData(id: id);
    notifyListeners();
  }
}