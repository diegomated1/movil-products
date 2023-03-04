import 'package:flutter/material.dart';
import 'package:products/providers/userProvider.dart';
import 'package:products/screens/favorites/favoriteProducts.dart';
import 'package:products/screens/login/login.dart';
import 'package:products/screens/products/productsPage.dart';
import 'package:products/screens/profile/profile.dart';
import 'package:products/screens/register/register.dart';
import 'package:provider/provider.dart';
import 'screens/auth/auth.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/auth',
        getPages: [
          GetPage(
            name: '/', page: () => const Auth()
          ),
          GetPage(
            name: '/login', page: () => const Login()
          ),
          GetPage(
            name: '/register', page: () => const Register()
          ),
          GetPage(
            name: '/products', page: () => const ProductsPage()
          ),
          GetPage(
            name: '/favorites', page: () => const FavoriteProducts()
          ),
          GetPage(
            name: '/profile', page: () => const Profile()
          ),
        ],
      )
    );
  }
}