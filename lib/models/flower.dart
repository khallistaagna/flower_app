// import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flower_app/theme/app_theme.dart';
import 'package:flower_app/models/flower.dart';
import 'package:flutter/material.dart';

class Flower {
  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final String description;
  final String imageUrl;
  final IconData icon;
  final Color color;

  Flower({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.description,
    required this.imageUrl,
    required this.icon,
    required this.color,
  });
}