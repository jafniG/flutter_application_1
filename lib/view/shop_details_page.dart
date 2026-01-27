import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/shop_provider.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/view/shop_page.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShopDetailsPage extends StatefulWidget {
  const ShopDetailsPage({super.key, required this.shopID});
  final String shopID;

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ShopProvider>(
        context,
        listen: false,
      ).getShopDetails(shopID: widget.shopID);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final shopListener = context.read<ShopProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ShopProvider>(
        builder: (context, value, child) {
          final shopDetails = value.shopdetailsdata?.data;
          final bool status = shopDetails?.shopStatus == "open" ? true : false;

          return Skeletonizer(
            enabled: value.isShopLoading,
            child: Stack(
              children: [
                Column(
                  spacing: 10,
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        fit: .fill,
                        imageUrl: shopDetails?.photo ?? '',
                        errorWidget: (context, url, error) => Image.network(
                          "https://t4.ftcdn.net/jpg/06/57/37/01/360_F_657370150_pdNeG5pjI976ZasVbKN9VqH1rfoykdYU.jpg",
                        ),
                      ),
                    ),
                  ],
                ),

                Positioned(
                  top: 30,
                  left: 20,
                  child: IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      final canPop =
                          navigatorKey.currentState?.canPop() ?? false;
                      if (canPop) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ShopPage()),
                        );
                      }
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Positioned(
                  top: 250,
                  left: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 5),
                    ),
                    height: 100,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: CachedNetworkImage(
                        fit: .fill,
                        imageUrl: shopDetails?.photo ?? '',
                        errorWidget: (context, url, error) => Image.network(
                          "https://t4.ftcdn.net/jpg/06/57/37/01/360_F_657370150_pdNeG5pjI976ZasVbKN9VqH1rfoykdYU.jpg",
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 360,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        shopDetails?.shopName ?? 'N/A',
                        style: TextStyle(fontSize: 22, fontWeight: .bold),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.grey.shade700,
                            size: 20,
                          ),
                          Text(
                            shopDetails?.address1 ?? 'N/A',
                            style: TextStyle(fontSize: 14),
                          ),
                          // Text(
                          //   maxLines: 2,
                          //   "${shopDetails?.address1 ?? 'N/A'},${shopDetails?.address2 ?? 'N/A'},${shopDetails?.town ?? 'N/A'},${shopDetails?.country ?? 'N/A'}",
                          // ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 370,
                        decoration: BoxDecoration(
                          borderRadius: .circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            spacing: 10,
                            children: [
                              Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  Text(
                                    "OpeningHours:",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    shopDetails?.shopStatus ?? 'N/A',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: status ? Colors.green : Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              Wrap(
                                children:
                                    shopDetails?.openingHours
                                        .map(
                                          (e) => Row(
                                            spacing: 10,
                                            children: [
                                              Icon(Icons.timelapse, size: 20),
                                              Text(
                                                " ${e.start_time ?? 'N/A'}   -   ${e.end_time ?? 'N/A'}",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        )
                                        .toList() ??
                                    [],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Available Cuisine",
                        style: TextStyle(fontSize: 18, fontWeight: .bold),
                      ),
                      Wrap(
                        spacing: 10,
                        children:
                            shopDetails?.shopCategories
                                ?.map(
                                  (e) => Chip(
                                    color: WidgetStatePropertyAll(
                                      Colors.grey.shade200,
                                    ),
                                    label: Text(e),
                                  ),
                                )
                                .toList() ??
                            [],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
