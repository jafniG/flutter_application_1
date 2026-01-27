import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/Service/base_client.dart';
import 'package:flutter_application_1/constants/api_endpoints.dart';
import 'package:flutter_application_1/model/shop/shop_data_model.dart';
import 'package:flutter_application_1/model/shop/shop_details_data_model.dart';

class ShopService {
  final dio = Dio();

  Future<ShopDataModel> getShops() async {
    // Response response;
    final response = await dio.get(
      "https://development.foodpage.co.uk/v2/shop/home/shoplist/0/0",
      options: Options(headers: {"Content-Type": "application/json"}),
    );
    final result = response.data;
    log(result.toString());
    return ShopDataModel.fromMap(result);
  }

  Future<ShopDetailsDataModel> getShopDetails({required String shopID}) async {
    final response = await BaseClient.get("${ApiEndpoints.shopDetails}$shopID");

    //do the changes
    // bkdjbkndcn

    final result = response.data;
    return ShopDetailsDataModel.fromMap(result);
  }
}
