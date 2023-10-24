import 'package:flutter/material.dart';

/// Define the Category data model
class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  /// Category properties
  final String id;
  final String title;
  final Color color;
}