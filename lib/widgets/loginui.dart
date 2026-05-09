import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controllers/login_controller.dart';
import 'package:login/widgets/google_sign_in_divider_section.dart';
import 'package:login/widgets/signui.dart';

class LoginUI extends StatelessWidget {
  LoginUI({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDarkMode = controller.isDarkMode.value;
      final obscureText = controller.obscureText.value;

      final backgroundColor = isDarkMode
          ? Colors.black
          : const Color.fromARGB(255, 255, 252, 194);

      final textColor = isDarkMode ? Colors.white : Colors.black;
      final fieldColor = isDarkMode ? Colors.grey[850] : Colors.white;

      return SafeArea(
        child: Container(
          color: backgroundColor,
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            isDarkMode ? Icons.dark_mode : Icons.light_mode,
                            color: textColor,
                          ),
                          Switch(
                            value: isDarkMode,
                            onChanged: controller.toggleDarkMode,
                          ),
                        ],
                      ),

                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 253, 111, 168),
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Icon(
                        Icons.handshake,
                        size: 100,
                        color: Color.fromARGB(255, 253, 229, 111),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(250, 122, 173, 1),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: TextField(
                          controller: controller.usernameController,
                          style: TextStyle(color: textColor),
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(color: textColor),
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: textColor,
                            ),
                            filled: true,
                            fillColor: fieldColor,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: TextField(
                          controller: controller.passwordController,
                          obscureText: obscureText,
                          style: TextStyle(color: textColor),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: textColor),
                            prefixIcon: Icon(Icons.lock, color: textColor),
                            filled: true,
                            fillColor: fieldColor,
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              color: textColor,
                              onPressed: controller.togglePasswordVisibility,
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      GoogleSignInDividerSection(isDarkMode: isDarkMode),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(
                                  250,
                                  122,
                                  173,
                                  1,
                                ),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: controller.login,
                              child: const Text('Login'),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(
                                  250,
                                  122,
                                  173,
                                  1,
                                ),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                Get.to(() => SignupUI());
                              },
                              child: const Text('Signup'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
