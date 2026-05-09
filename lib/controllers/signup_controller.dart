import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/screens/loginpage.dart';

class SignupController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isDarkMode = false.obs;
  final obscureText = true.obs;
  final RxString message = ''.obs;

  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
  }

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void signup() {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      message.value = 'Please fill all fields';
      return;
    }

    message.value = 'Signup successful';

    Get.to(() => LoginPage());
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
