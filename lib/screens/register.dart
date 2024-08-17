import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learning_management_systemo_v01/constant/Routes.dart';
import 'package:learning_management_systemo_v01/controllers/RegisterController.dart';

import '../constant/app_colors.dart';
import '../utils/styles/font_style.dart';
import '../utils/styles/input_decorations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: CustomLabel().customLabel(
              text: 'Register', fontSize: 32, color: AppColors.appPurple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/loginimg.png',
                width: screenWidth * 0.6,
                height: screenHeight * 0.3,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: registerController.nameController,
                decoration: InputDec.inputDec(label: 'name'),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: registerController.emailController,
                decoration: InputDec.inputDec(label: 'email'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: registerController.passwordController,
                decoration: InputDec.inputDec(label: 'password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: registerController.roleController,
                decoration: InputDec.inputDec(label: 'role'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  registerController.registerUser();
                },
                child: const Text("Register"),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.LOGIN);
                },
                child: const Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
