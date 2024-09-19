import 'package:flutter/widgets.dart';
import 'package:mystore/core/services/api_service.dart';
import 'package:mystore/models/product/product_model.dart';

class CartProvider with ChangeNotifier{

  List<ProductModel> cartList=[];

  Future<void> addToCart() async {
    // cartList=await ApiService
  }
}