import 'package:ecommercial_app/constants/app_images_path.dart';
import 'package:ecommercial_app/model/shopping_list_item.dart';
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

  // Mock data for shopping list items
  static final List<ShoppingListItem> shoppingListItems = [
    ShoppingListItem(
      id: '1',
      name: "Women's Casual Wear",
      image: AppImagesPath.girlImg,
      price: 34.00,
      originalPrice: 64.00,
      discount: 33,
      rating: 4.8,
      variations: ['Black', 'Red'],
      selectedVariation: 'Black',
    ),
    ShoppingListItem(
      id: '2',
      name: "Men's Jacket",
      image: AppImagesPath.boyImg,
      price: 45.00,
      originalPrice: 67.00,
      discount: 28,
      rating: 4.7,
      variations: ['Green', 'Grey'],
      selectedVariation: 'Green',
    ),
    ShoppingListItem(
      id: '3',
      name: "Women's Casual Wear",
      image: AppImagesPath.girlImg,
      price: 34.00,
      originalPrice: 64.00,
      discount: 33,
      rating: 4.8,
      variations: ['Black', 'Red'],
      selectedVariation: 'Black',
    ),
    ShoppingListItem(
      id: '4',
      name: "Women's Casual Wear",
      image: AppImagesPath.girlImg,
      price: 34.00,
      originalPrice: 64.00,
      discount: 33,
      rating: 4.8,
      variations: ['Black', 'Red'],
      selectedVariation: 'Black',
    ),
  ];
}
