import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOG IN'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertikal tengah
            crossAxisAlignment: CrossAxisAlignment.center, // Horizontal tengah
            children: [
              // TextField untuk nama lengkap
              TextField(
                controller: controller.cEmail,
                textAlign: TextAlign.center, // Memusatkan teks di dalam field
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16), // Jarak antara TextField
              // TextField untuk password
              TextField(
                controller: controller.cPass,
                textAlign: TextAlign.center, // Memusatkan teks di dalam field
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  cAuth.login(controller.cEmail.text, controller.cPass.text);
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 25),
              Text("Don't have account yet?"),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.SIGNUP);
                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 10),
              TextButton(
                child: Text("Reset Password"),
                onPressed: () {
                  Get.offAllNamed(Routes.RESET_PASSWORD);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
