class ProductModel {
  final String image;
  final String name;
  final double price;
  final String description;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
  static List<ProductModel> products = [
    ProductModel(
      image: "assets/product/product1.png",
      name: "Urban Sole",
      price: 59.99,
      description: "reversible angora cardigan",
    ),
    ProductModel(
      image: "assets/product/product2.png",
      name: "Bold Shades",
      price: 29.99,
      description: "Look sharp & stylish",
    ),
    ProductModel(
      image: "assets/product/product3.png",
      name: "Mini Hoops",
      price: 19.99,
      description: "Everyday sparkle",
    ),
    ProductModel(
      image: "assets/product/product4.png",
      name: "Gold Twist	",
      price: 24.99,
      description: "Simple & elegant",
    ),
    ProductModel(
      image: "assets/product/product5.png",
      name: "Charm Link",
      price: 27.99,
      description: "Delicate design",
    ),
    ProductModel(
      image: "assets/product/product6.png",
      name: "Luna Dress",
      price: 79.99,
      description: "Light & breezy feel",
    ),
  ];
}
