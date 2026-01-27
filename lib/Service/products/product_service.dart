import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/Service/base_client.dart';
import 'package:flutter_application_1/constants/api_endpoints.dart';
import 'package:flutter_application_1/model/products/categories_data_model.dart';
import 'package:flutter_application_1/model/products/products_data_model.dart';

class ProductService {
  Future<CategoriesDataModel> getCategories({required String shopId}) async {
    final response = await BaseClient.get(
      "${ApiEndpoints.productCategories}$shopId-SHOP/0",
    );
    final result = response.data;
    // log(result.toString());
    return CategoriesDataModel.fromMap(result);
  }

  Future<ProductsDataModel> getProducts({
    required String shopID,
    required String categoryID,
  }) async {
    final response = await BaseClient.get(
      "${ApiEndpoints.products}$shopID/$categoryID/0/online",
    );
    final result = response.data;
    return ProductsDataModel.fromMap(result);
  }
}
