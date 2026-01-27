import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/shop/shop_service.dart';
import 'package:flutter_application_1/model/shop/shop_data_model.dart';
import 'package:flutter_application_1/model/shop/shop_details_data_model.dart';

class ShopProvider extends ChangeNotifier {
  final shopService = ShopService();
  final shopDetailsService = ShopService();
  ShopDataModel? shopdata;
  ShopDetailsDataModel? shopdetailsdata;

  List<ShopListDataModel> get listOfShops => shopdata?.data?.shopList ?? [];

  bool isLoading = false;
  bool isShopLoading = false;

  Future<void> getShops() async {
    try {
      isLoading = true;
      notifyListeners();
      final result = await shopService.getShops();
      shopdata = result;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getShopDetails({required String shopID}) async {
    try {
      isShopLoading = true;
      notifyListeners();
      final result = await shopDetailsService.getShopDetails(shopID: shopID);
      shopdetailsdata = result;
      // await Future.delayed(Duration(seconds: 2));
      notifyListeners();
    } catch (e) {
      log(e.toString());
    } finally {
      isShopLoading = false;
      notifyListeners();
    }
  }
}
