import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/products/product_provider.dart';
import 'package:flutter_application_1/controller/shop_provider.dart';
import 'package:flutter_application_1/storage/user_preference.dart';
import 'package:flutter_application_1/view/editprofile_page.dart';
import 'package:flutter_application_1/view/login_page.dart';
import 'package:flutter_application_1/view/products_page.dart';
import 'package:flutter_application_1/view/shop_details_page.dart';
import 'package:flutter_application_1/view/update_password.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ShopProvider>(context, listen: false).getShops();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final shopListener = context.watch<ShopProvider>();
    final shopProvider = context.read<ShopProvider>();
    final productProvider = context.read<ProductProvider>();
    final productListener = context.watch<ProductProvider>();

    return Scaffold(
      drawer: FutureBuilder(
        future: FirebaseAuth.instance.currentUser?.reload(),
        builder: (context, asyncSnapshot) {
          return Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 231, 229, 236),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                        child: Image.network(
                          "https://img.freepik.com/free-psd/3d-rendered-user-icon-blue-circle_84443-55891.jpg?t=st=1768805606~exp=1768809206~hmac=7f309999fa0245c17796d771e69cc2c9f715748820ccef513f6ee3a5f1e1b940",
                        ),
                      ),
                    ),
                    title: Text(
                      FirebaseAuth.instance.currentUser?.displayName ?? 'N/A',
                    ),
                    subtitle: Text(
                      FirebaseAuth.instance.currentUser?.email ?? 'N/A',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditprofilePage(),
                      ),
                    );
                  },
                  icon: Row(
                    spacing: 10,
                    children: [Icon(Icons.edit), Text("Edit Profile")],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdatePassword()),
                    );
                  },
                  icon: Row(
                    spacing: 10,
                    children: [Icon(Icons.lock), Text("Update Password")],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        // title: Text("Alert"),
                        content: Text(
                          "Are you sure?",
                          style: TextStyle(fontSize: 18),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              UserPreference.clearUserData().then((value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              });
                            },
                            child: Text("Yes", style: TextStyle(fontSize: 18)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No", style: TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Row(
                    spacing: 10,
                    children: [Icon(Icons.logout), Text("Logout")],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      appBar: AppBar(title: Text("ShopList"), actions: [
         
        ],
      ),

      body: Consumer<ShopProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,

              crossAxisCount: 2,
            ),
            itemCount: shopListener.listOfShops.length,

            itemBuilder: (context, index) {
              final shops = shopListener.listOfShops.elementAt(index);

              final status = shops.shopStatus == "open" ? true : false;
              return InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsPage(
                        shopName: shops.shopName ?? 'N/A',
                        shopID: shops.id ?? '',
                        shopDetailsID:
                            shopListener.shopdetailsdata?.data.id ?? '',
                      ),
                    ),
                  );
                  await productProvider.getCategories(
                    shopId: shops.id ?? 'N/A',
                  );
                  await productProvider.getProducts(
                    shopID: shops.id ?? '',
                    categoryID:
                        productListener.listOfCategoriesItems.first.cID ?? '',
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 231, 229, 236),
                    borderRadius: .circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.fill,
                          height: 100,
                          width: 170,
                          imageUrl: shops.photo ?? 'N/A',
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Image.network(
                            "https://user-images.githubusercontent.com/47315479/81145216-7fbd8700-8f7e-11ea-9d49-bd5fb4a888f1.png",
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: .topLeft,
                          child: Text(
                            shops.shopName ?? "N/A",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(shops.town ?? 'N/A'),
                            Text(
                              shops.shopStatus ?? 'N/A',
                              style: TextStyle(
                                fontSize: 16,
                                color: status
                                    ? Colors.green.shade800
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
