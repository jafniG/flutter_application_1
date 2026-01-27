import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/shop_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopPage()),
              
            );
          },
          child: Text("Enter", style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
