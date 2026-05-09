import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controllers/signup_controller.dart';
import 'package:login/widgets/loginui.dart';

class SignupUI extends StatelessWidget {
  SignupUI({super.key});

  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
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
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
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
                          'Signup',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 253, 111, 168),
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Icon(
                          Icons.person_add,
                          size: 100,
                          color: Color.fromARGB(255, 253, 229, 111),
                        ),

                        const SizedBox(height: 16),

                        TextField(
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

                        const SizedBox(height: 12),

                        TextField(
                          controller: controller.emailController,
                          style: TextStyle(color: textColor),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: textColor),
                            prefixIcon: Icon(Icons.email, color: textColor),
                            filled: true,
                            fillColor: fieldColor,
                            border: const OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 12),

                        TextField(
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
                                onPressed: controller.signup,
                                child: const Text('Signup'),
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
                                  Get.to(() => LoginUI());
                                },
                                child: const Text('Back Login'),
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
      }),
    );
  }
}
