import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app1/pages/sign_in_page.dart';
import 'package:flutter_ecommerce_app1/pages/sign_up_page.dart';
import 'package:flutter_ecommerce_app1/pages/splash_screen.dart';
import 'package:flutter_ecommerce_app1/pages/shop_page.dart';
import 'package:flutter_ecommerce_app1/pages/cart_page.dart';
import 'package:flutter_ecommerce_app1/pages/settings_page.dart';
import 'package:flutter_ecommerce_app1/pages/profile_page.dart';
import 'package:flutter_ecommerce_app1/pages/manage_email_page.dart';
import 'package:flutter_ecommerce_app1/pages/edit_profile_page.dart';
import 'package:flutter_ecommerce_app1/pages/change_password_page.dart';
import 'package:flutter_ecommerce_app1/models/shop.dart';
import 'package:flutter_ecommerce_app1/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://bztcsspikuntfmktczhy.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ6dGNzc3Bpa3VudGZta3Rjemh5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTcyMjA5NjAsImV4cCI6MjA3Mjc5Njk2MH0.HiqpqFLvzp5fFF4BSIliogeqWq2Z0RTF4vGLqVMq1PQ",
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Shop()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          home: const SplashScreen(), 
          
          
          routes: {
            '/sign_in_page': (context) => const SignInPage(),
            '/sign_up_page': (context) => const SignUpPage(),
            '/shop_page': (context) => const ShopPage(),
            '/cart_page': (context) => const CartPage(),
            '/settings_page': (context) => const SettingsPage(),
            '/profile_page': (context) => const ProfilePage(),
            '/manage_email_page': (context) => const ManageEmailPage(),
            '/edit_profile_page': (context) => const EditProfilePage(),
            '/change_password_page': (context) => const ChangePasswordPage(),
          },
        );
      },
    );
  }
}
