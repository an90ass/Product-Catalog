import 'package:flutter/material.dart';
import 'package:product_catalog/config/items/app_colors.dart';
import 'package:product_catalog/providers/cart_provider/cartProvider.dart';
import 'package:provider/provider.dart';
import 'config/routes/app_router.dart';
import 'features/Screens/mainShopingScreen.dart';
import 'providers/products_provider/productsProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context)=>Cart())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.darkRed,  
            foregroundColor: Colors.white,  
          ),
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        title: 'Flutter Demo',
        home: MainShoppingScreen(),
      ),
    );
  }
}
