import 'package:ecommercial_app/constants/app_images_path.dart';
import 'package:ecommercial_app/model/splash_intro_data.dart';

class AppConstants {
  static final List<SplashIntroData> splashIntroData = [
    SplashIntroData(
      image: AppImagesPath.firstSplashImg,
      title: "Choose Products",
      subtitle:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
    SplashIntroData(
      image: AppImagesPath.secondSplashImg,
      title: "Make Payment",
      subtitle:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
    SplashIntroData(
      image: AppImagesPath.thirdSplashImg,
      title: "Get Your Order",
      subtitle:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
  ];
}
