import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Service/products/product_service.dart';
import 'package:flutter_application_1/model/products/categories_data_model.dart';
import 'package:flutter_application_1/model/products/products_data_model.dart';

class ProductProvider extends ChangeNotifier {
  final productService = ProductService();

  ProductsDataModel? productsdata;
  CategoriesDataModel? categoriesdata;
  List<ItemsDataModel> get listOfCategoriesItems =>
      categoriesdata?.data.items ?? [];
  List<ProductItemsDataModel> get listOfProductItems =>
      productsdata?.data.items ?? [];

  bool isLoading = false;
  bool isProductLoading = false;

  Future<void> getCategories({required String shopId}) async {
    try {
      isLoading = true;
      notifyListeners();

      final result = await productService.getCategories(shopId: shopId);
      categoriesdata = result;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getProducts({
    required String shopID,
    required String categoryID,
  }) async {
    try {
      isProductLoading = true;
      notifyListeners();
      final result = await productService.getProducts(
        categoryID: categoryID,
        shopID: shopID,
      );
      productsdata = result;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    } finally {
      isProductLoading = false;
      notifyListeners();
    }
  }
}
