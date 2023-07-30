import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  String title;
  String description;
  double rating;
  String thumbnail;

  Products(
      {required this.title,
      required this.description,
      required this.rating,
      required this.thumbnail});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
