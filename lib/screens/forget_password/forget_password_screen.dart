import 'package:flutter/material.dart';
import '../../components/app_text_field.dart';
import '../../components/app_button.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_images_path.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                _buildForgetPasswordTitleWidget(),
                const SizedBox(height: 40),
                _buildEmailFieldWidget(),
                const SizedBox(height: 20),
                _buildInfoTextWidget(),
                const SizedBox(height: 30),
                _buildSubmitButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildForgetPasswordTitleWidget() {
    return const Text(
      'Forgot\npassword?',
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
        height: 1.2,
      ),
    );
  }

  AppTextField _buildEmailFieldWidget() {
    return AppTextField(
      hintText: 'Enter your email address',
      prefixIconPath: AppImagesPath.icMail,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email address';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  Padding _buildInfoTextWidget() {
    return const Padding(
      padding: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Text(
            '*',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              'We will send you a message to set or reset your new password',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.gray,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppButton _buildSubmitButtonWidget() {
    return AppButton(
      text: 'Submit',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Handle password reset logic
          // You can add navigation back to sign in screen after showing success message
        }
      },
      height: 55,
    );
  }
}
