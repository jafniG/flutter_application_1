
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditprofilePage extends StatefulWidget {
  const EditprofilePage({super.key});

  @override
  State<EditprofilePage> createState() => _EditprofilePageState();
}

class _EditprofilePageState extends State<EditprofilePage> {
  late TextEditingController displaynameTxtController;
  @override
  void initState() {
    displaynameTxtController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              controller: displaynameTxtController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Username",
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () async {
                await FirebaseAuth.instance.currentUser?.updateDisplayName(
                  displaynameTxtController.text,
                );
                await FirebaseAuth.instance.currentUser?.reload();

                Fluttertoast.showToast(msg: "Username changed successfully");
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
