import 'package:ecommercial_app/constants/app_colors.dart';
import 'package:ecommercial_app/constants/app_constants.dart';
import 'package:ecommercial_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommercial_app/screens/splash_intro/widgets/splash_intro_content_widgets.dart';
import 'package:flutter/material.dart';

class SplashIntroScreen extends StatefulWidget {
  const SplashIntroScreen({super.key});

  @override
  State<SplashIntroScreen> createState() => _SplashIntroScreenState();
}

class _SplashIntroScreenState extends State<SplashIntroScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBarWidget(),
      body: Column(
        children: [
          _buildBodyWidget(),
          _buildBottomWidget(),
        ],
      ),
    );
  }

  AppBar _buildAppBarWidget() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Align(
          child: Text(
            '${currentPage + 1}/${AppConstants.splashIntroData.length}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            );
          },
          child: const Text(
            'Skip',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }

  Expanded _buildBodyWidget() {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemCount: AppConstants.splashIntroData.length,
        itemBuilder: (context, index) {
          return SplashIntroContentWidget(
            image: AppConstants.splashIntroData[index].image,
            title: AppConstants.splashIntroData[index].title,
            subtitle: AppConstants.splashIntroData[index].subtitle,
          );
        },
      ),
    );
  }

  Padding _buildBottomWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPreviousBottomWidget(),
          Row(
            children: List.generate(AppConstants.splashIntroData.length,
                (index) => _buildDotWidget(index)),
          ),
          _buildNextBottomWidget(),
        ],
      ),
    );
  }

  Widget _buildPreviousBottomWidget() {
    return currentPage > 0
        ? TextButton(
            onPressed: () {
              pageController.previousPage(
                  duration: const Duration(microseconds: 300),
                  curve: Curves.ease);
            },
            child: const Text(
              'Prev',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.gray,
              ),
            ),
          )
        : const SizedBox(width: 60);
  }

  TextButton _buildNextBottomWidget() {
    return currentPage == AppConstants.splashIntroData.length - 1
        ? TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.red,
              ),
            ),
          )
        : TextButton(
            onPressed: () {
              pageController.nextPage(
                  duration: const Duration(microseconds: 300),
                  curve: Curves.ease);
            },
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.red,
              ),
            ),
          );
  }

  AnimatedContainer _buildDotWidget(int index) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: currentPage == index ? 32 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? AppColors.black : AppColors.gray03,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
