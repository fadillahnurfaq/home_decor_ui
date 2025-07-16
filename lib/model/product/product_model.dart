import 'package:home_decor/utils/utils.dart';

class ProductModel {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      price: ModelParser.doubleFromJson(json["price"] ?? "") ?? 0.0,
      imagePath: json["image_path"] ?? "",
    );
  }
}
