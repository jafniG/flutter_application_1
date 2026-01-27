import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final GlobalKey<FormState> updatePasswordKey = GlobalKey<FormState>();

  late TextEditingController newPasswordTxtController;
  late TextEditingController confirmPasswordTxtController;
  late TextEditingController currentPasswordTxtController;

  @override
  void initState() {
    // TODO: implement initState
    newPasswordTxtController = TextEditingController();
    confirmPasswordTxtController = TextEditingController();
    currentPasswordTxtController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Form(
          key: updatePasswordKey,
          child: Column(
            spacing: 20,
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
            children: [
              Text(
                "Update your password to keep your account secure.",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Enter your current Password:",
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                controller: currentPasswordTxtController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Current Password",
                ),
              ),
              TextFormField(
                controller: newPasswordTxtController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }
                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  RegExp regex = RegExp(pattern);

                  if (!regex.hasMatch(value.toString())) {
                    return 'Enter a Valid Password';
                  }
                  if (value.length < 8) {
                    return "Password must be atleast 8 characters";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "New Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              TextFormField(
                controller: confirmPasswordTxtController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }
                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  RegExp regex = RegExp(pattern);

                  if (!regex.hasMatch(value.toString())) {
                    return 'Enter a Valid Password';
                  }
                  if (value.length < 8) {
                    return "Password must be atleast 8 characters";
                  }
                  if (newPasswordTxtController !=
                      confirmPasswordTxtController) {
                    return "Password must be same";
                  }
                },

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Confirm Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(400, 20)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  final isValid =
                      updatePasswordKey.currentState?.validate() ?? false;
                  if (isValid) {
                    final userCredential = EmailAuthProvider.credential(
                      email: user?.email ?? '',
                      password: currentPasswordTxtController.text,
                    );
                    await user?.reauthenticateWithCredential(userCredential);

                    await user?.updatePassword(
                      confirmPasswordTxtController.text,
                    );
                    Fluttertoast.showToast(msg: "Updated Successfully");
                    Navigator.pop(context);
                  }
                },
                child: Text("Update Password", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
