import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mystore/core/services/api_service.dart';
import 'package:mystore/models/category/category.dart';

class CategoryProvider with ChangeNotifier{
   List<CategoryModel> categoryList=[];
  Future<void> getAllCategory() async {
    categoryList= await ApiService.fetchCategoriesData();
    log(categoryList.toString());
    notifyListeners();
  }
}