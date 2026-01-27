import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/products/categories_data_model.dart';
import 'package:flutter_application_1/model/products/products_data_model.dart';

class ProductService {
  final dio = Dio();
  Future<CategoriesDataModel> getCategories({required String shopId}) async {
    final response = await dio.get(
      'https://development.foodpage.co.uk/v2/shop/categories/$shopId-SHOP/0',
      options: Options(headers: {"Content-Type": "application/json"}),
    );
    final result = response.data;
    // log(result.toString());
    return CategoriesDataModel.fromMap(result);
  }

  Future<ProductsDataModel> getProducts({
    required String shopID,
    required String categoryID,
  }) async {
    final response = await dio.get(
      "https://development.foodpage.co.uk/v2/shop/products/$shopID/$categoryID/0/online",
      options: Options(headers: {"Content-Type": "application/json"}),
    );
    final result = response.data;
    return ProductsDataModel.fromMap(result);
  }
}
