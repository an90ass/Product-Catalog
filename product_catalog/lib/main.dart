import 'package:flutter/material.dart';
import 'package:product_catalog/config/items/app_colors.dart';
import 'config/routes/app_router.dart';
import 'features/Screens/mainShopingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.accentColor,  
          foregroundColor: Colors.white,  
        ),
      ),
            onGenerateRoute: AppRouter.onGenerateRoute,

      title: 'Flutter Demo',
      home: MainShoppingScreen(),
    );
  }
}
