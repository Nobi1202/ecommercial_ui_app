import 'package:ecommercial_app/constants/app_colors.dart';
import 'package:ecommercial_app/constants/app_constants.dart';
import 'package:ecommercial_app/constants/app_images_path.dart';
import 'package:ecommercial_app/model/shopping_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white01,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildDeliveryTextWidget(),
            const SizedBox(height: 15),
            _buildDeliveryAddressSection(),
            const SizedBox(height: 30),
            _buildShoppingListTitleWidget(),
            const SizedBox(height: 15),
            _buildShoppingListSection(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Checkout',
        style: TextStyle(
          color: AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.black,
          size: 20,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Row _buildDeliveryTextWidget() {
    return Row(
      children: [
        SvgPicture.asset(
          AppImagesPath.icLocation,
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            AppColors.black,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Delivery Address',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  IntrinsicHeight _buildDeliveryAddressSection() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildAdressSectionWidget(),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              // Handle add new address
            },
            child: Container(
              padding: const EdgeInsets.all(27),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppImagesPath.icCirclePlus,
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                    AppColors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildAdressSectionWidget() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '216 St Paul\'s Rd, London N1 2LL, UK Contact : +44-784232',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.gray04,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                // Handle edit address
              },
              child: SvgPicture.asset(
                AppImagesPath.icEdit,
                width: 20,
                height: 20,
                colorFilter: const ColorFilter.mode(
                  AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildShoppingListTitleWidget() {
    return const Text(
      'Shopping List',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    );
  }

  Expanded _buildShoppingListSection() {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        radius: const Radius.circular(10),
        thickness: 6,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: AppConstants.shoppingListItems.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
            itemBuilder: (context, index) {
              return _buildShoppingItemCard(
                AppConstants.shoppingListItems[index],
              );
            },
          ),
        ),
      ),
    );
  }

  Container _buildShoppingItemCard(ShoppingListItem item) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.gray03,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Row(
                        children: [
                          const Text(
                            'Variations : ',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: SizedBox(
                              height: 40,
                              child: ListView.builder(
                                itemCount: item.variations.length,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.gray02),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        item.variations[index],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: item.variations[index] ==
                                                  item.selectedVariation
                                              ? AppColors.black
                                              : AppColors.gray,
                                          fontWeight: item.variations[index] ==
                                                  item.selectedVariation
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          item.rating.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(width: 5),
                        _buildRatingStars(item.rating),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.gray02),
                          ),
                          child: Text(
                            '\$ ${item.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$${item.originalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.gray,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              'upto ${item.discount}% off',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Order (1) :',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildRatingStars(double rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating.floor()
              ? Icons.star
              : index < rating
                  ? Icons.star_half
                  : Icons.star_border,
          color: Colors.amber,
          size: 16,
        );
      }),
    );
  }
}
