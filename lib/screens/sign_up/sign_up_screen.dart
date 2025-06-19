import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/app_text_field.dart';
import '../../components/app_button.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_images_path.dart';
import '../sign_in/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                _buildCreateAccountTitleWidget(),
                const SizedBox(height: 40),
                _buildEmailFieldWidget(),
                const SizedBox(height: 20),
                _buildPasswordFieldWidget(),
                const SizedBox(height: 20),
                _buildConfirmPasswordFieldWidget(),
                const SizedBox(height: 20),
                _buildTermsAndConditionsWidget(),
                const SizedBox(height: 30),
                _buildCreateAccountButtonWidget(),
                const SizedBox(height: 40),
                _buildContinueWithTextWidget(),
                const SizedBox(height: 30),
                _buildSocialButtonsWidget(),
                const SizedBox(height: 40),
                _buildAlreadyHaveAccountWidget(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildCreateAccountTitleWidget() {
    return const Text(
      'Create an\naccount',
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
      hintText: 'Username or Email',
      prefixIconPath: AppImagesPath.icUser,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email or username';
        }
        if (value.contains('@') &&
            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  AppTextField _buildPasswordFieldWidget() {
    return AppTextField(
      hintText: 'Password',
      prefixIconPath: AppImagesPath.icPassword,
      isPassword: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  AppTextField _buildConfirmPasswordFieldWidget() {
    return AppTextField(
      hintText: 'ConfirmPassword',
      prefixIconPath: AppImagesPath.icPassword,
      isPassword: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        // Note: In a real implementation, you'd compare with the password field
        return null;
      },
    );
  }

  Padding _buildTermsAndConditionsWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: RichText(
        textAlign: TextAlign.left,
        text: const TextSpan(
          style: TextStyle(
            fontSize: 12,
            color: AppColors.gray,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(text: 'By clicking the '),
            TextSpan(
              text: 'Register',
              style: TextStyle(
                color: AppColors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(text: ' button, you agree\nto the public offer'),
          ],
        ),
      ),
    );
  }

  AppButton _buildCreateAccountButtonWidget() {
    return AppButton(
      text: 'Create Account',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Handle create account logic
        }
      },
      height: 55,
    );
  }

  Center _buildContinueWithTextWidget() {
    return const Center(
      child: Text(
        '- OR Continue with -',
        style: TextStyle(
          fontSize: 12,
          color: AppColors.gray,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  GestureDetector _buildSocialButton({
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        width: 60,
        height: 60,
      ),
    );
  }

  Row _buildSocialButtonsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppImagesPath.googleImg,
          width: 60,
          height: 60,
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          iconPath: AppImagesPath.appleImg,
          onTap: () {},
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          iconPath: AppImagesPath.facebookImg,
          onTap: () {},
        ),
      ],
    );
  }

  Row _buildAlreadyHaveAccountWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'I Already Have an Account ',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.gray,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate back to sign in screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            );
          },
          child: const Text(
            'Login',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.red,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.red,
            ),
          ),
        ),
      ],
    );
  }
}
