import 'package:flutter/material.dart';
import 'package:product_catalog/config/routes/route_name.dart';

import '../../features/Screens/productDetailsScreen.dart';
import '../../main.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.productDetails:
        final productId = settings.arguments as String; // Fetch the passed ID

        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(),
          settings: RouteSettings(arguments: productId), // Pass the ID
        );
      default:
        return MaterialPageRoute(builder: (_) => MyApp());
    }
  }
}
