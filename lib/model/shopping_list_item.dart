class ShoppingListItem {
  final String id;
  final String name;
  final String image;
  final double price;
  final double originalPrice;
  final int discount;
  final double rating;
  final List<String> variations;
  final String selectedVariation;

  ShoppingListItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.rating,
    required this.variations,
    required this.selectedVariation,
  });
}
