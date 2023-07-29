// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      title: json['title'] as String,
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'rating': instance.rating,
    };
