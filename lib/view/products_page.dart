// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/shop_provider.dart';
import 'package:flutter_application_1/view/shop_details_page.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/controller/products/product_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:collection/collection.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsPage extends StatefulWidget {
  final String shopName;
  final String shopID;
  final String shopDetailsID;
  const ProductsPage({
    Key? key,
    required this.shopName,
    required this.shopID,
    required this.shopDetailsID,
  }) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int? selectedVariationValue = -1;

  @override
  Widget build(BuildContext context) {
    final productListener = context.watch<ProductProvider>();
    final productProvider = context.read<ProductProvider>();
    final shopProvider = context.watch<ShopProvider>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: ListTile(
                    onTap: () async {
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShopDetailsPage(shopID: widget.shopID,),
                        ),
                      );
                      // shopProvider.getShopDetails(shopID: widget.shopID);
                    },
                    title: Text("View details"),
                  ),
                ),
              ];
            },
          ),
        ],
        title: Text(widget.shopName),
      ),
      body: productListener.isLoading
          ? Center(child: CircularProgressIndicator())
          : DefaultTabController(
              length: productListener.listOfCategoriesItems.length,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.purple.shade900,
                    labelColor: Colors.deepPurple,
                    isScrollable: true,
                    onTap: (val) {
                      productProvider.getProducts(
                        shopID: widget.shopID,
                        categoryID:
                            productListener.listOfCategoriesItems
                                .elementAt(val)
                                .cID ??
                            '',
                      );
                    },
                    tabAlignment: .start,
                    tabs: productListener.listOfCategoriesItems
                        .map((element) => Tab(text: "${element.name}"))
                        .toList(),
                  ),
                  Expanded(child: buildProductList(context)),
                ],
              ),
            ),
    );
  }

  Widget buildProductList(BuildContext context) {
    final productListener = context.watch<ProductProvider>();

    return Scaffold(
      body: productListener.isProductLoading
          ? buildShimmerWidget()
          : ListView.separated(
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final products = productListener.listOfProductItems.elementAt(
                  index,
                );
                // bool hasVariation = products.hasMultipleVariation == true;
                // bool hasAddons = products.hasAddons == true;
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => StatefulBuilder(
                        builder: (context, modalState) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            padding: EdgeInsets.all(10).copyWith(top: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisSize: .min,
                              children: [
                                ClipRRect(
                                  borderRadius: .circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: products.photo ?? 'N/A',
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: .spaceBetween,

                                  children: [
                                    Text(
                                      products.name ?? 'N/A',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          padding: EdgeInsets.all(0),
                                          constraints: BoxConstraints(
                                            minHeight: 10,
                                            minWidth: 10,
                                          ),
                                          style: ButtonStyle(
                                            shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusGeometry.circular(
                                                      10,
                                                    ),
                                              ),
                                            ),
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                  Colors.black,
                                                ),
                                          ),
                                          color: Colors.white,
                                          onPressed: () {},
                                          icon: Icon(Icons.remove),
                                        ),
                                        Text("1"),
                                        IconButton(
                                          padding: EdgeInsets.all(0),
                                          constraints: BoxConstraints(
                                            minHeight: 10,
                                            minWidth: 10,
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                  Colors.black,
                                                ),
                                            shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusGeometry.circular(
                                                      10,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          color: Colors.white,
                                          onPressed: () {},
                                          icon: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Column(
                                  mainAxisSize: .min,
                                  children: products.variations
                                      .mapIndexed(
                                        (index, e) => RadioListTile(
                                          onChanged: (value) {
                                            modalState(() {
                                              selectedVariationValue = value;
                                            });
                                          },
                                          value: index,
                                          groupValue: selectedVariationValue,
                                          title: Column(
                                            crossAxisAlignment: .start,
                                            children: [
                                              Text(
                                                e.name ??
                                                    products.name ??
                                                    'N/A',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                e.displayPrice ?? 'N/A',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),

                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.black,
                                    ),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(10),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 100,
                        width: 100,
                        child: CachedNetworkImage(
                          imageUrl: products.photo ?? 'N/A',
                          errorWidget: (context, url, error) => Image.network(
                            "https://user-images.githubusercontent.com/47315479/81145216-7fbd8700-8f7e-11ea-9d49-bd5fb4a888f1.png",
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                products.name ?? 'N/A',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                products.description ?? 'N/A',
                                maxLines: 2,
                                overflow: .ellipsis,
                              ),
                              Text(products.price ?? 'N/A'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: productListener.listOfProductItems.length,
            ),
    );
  }

  Widget buildShimmerWidget() {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.all(15),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Row(
            spacing: 10,
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 100,
                  width: 100,
                  color: Colors.grey,
                ),
              ),

              Flexible(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 10,
                      width: 100,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 10,
                      width: 150,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 10,
                      width: 200,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
