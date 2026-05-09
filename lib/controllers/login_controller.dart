import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/widgets/signui.dart' as signupui;

class LoginController extends GetxController {
  final usernameController = TextEditingController();
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

  void login() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill username and password');
      return;
    }

    print('Username: $username');
    print('Password: $password');
  }

  void goToSignup() {
    Get.to(() => signupui.SignupUI());
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
