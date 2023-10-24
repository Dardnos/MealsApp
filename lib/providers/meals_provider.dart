import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/data/dummy_data.dart';

/// Create a Riverpod provider for meals
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
