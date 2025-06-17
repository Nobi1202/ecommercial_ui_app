import 'package:ecommercial_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashIntroContentWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const SplashIntroContentWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const Spacer(),
          // Image
          SizedBox(
            height: 300,
            child: SvgPicture.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Subtitle
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.gray,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
