import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../components/app_text_field.dart';
import '../../components/app_button.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_images_path.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                _buildWelcomeBackTitleWidget(),
                const SizedBox(height: 40),
                _buildEmailFieldWidget(),
                const SizedBox(height: 20),
                _buildPasswordFieldWidget(),
                const SizedBox(height: 30),
                _buildForgotPasswordWidget(),
                const SizedBox(height: 30),
                _buildLoginButtonWidget(),
                const SizedBox(height: 40),
                _buildContinueWithTextWidget(),
                const SizedBox(height: 30),
                _buildSocialButtonsWidget(),
                const SizedBox(height: 40),
                _buildCreateAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildWelcomeBackTitleWidget() {
    return const Text(
      'Welcome\nBack!',
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

  Align _buildForgotPasswordWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Handle forgot password
        },
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.red,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  AppButton _buildLoginButtonWidget() {
    return AppButton(
      text: 'Login',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Handle login logic
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

  Row _buildCreateAccountWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Create An Account ',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.gray,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to sign up screen
          },
          child: const Text(
            'Sign Up',
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
