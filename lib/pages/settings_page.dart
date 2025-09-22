
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app1/pages/change_password_page.dart';
import 'package:flutter_ecommerce_app1/pages/edit_profile_page.dart';
import 'package:flutter_ecommerce_app1/pages/manage_email_page.dart';
import 'package:flutter_ecommerce_app1/pages/shop_page.dart';
import 'package:flutter_ecommerce_app1/themes/light_mode.dart';
import 'package:flutter_ecommerce_app1/themes/dark_mode.dart';
import 'package:flutter_ecommerce_app1/pages/cart_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce_app1/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 60, 94).withOpacity(0.8),
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ShopPage()),
            );
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [

          // ================= Dark Mode Card =================

          const SizedBox(height: 6),
         
          Card(
            color:const Color.fromARGB(255, 182, 113, 161).withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
            
            child: SwitchListTile(
              title: const Text("Dark Mode"),
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value); // toggles app theme globally
              },
              secondary: const Icon(Icons.dark_mode),
            ),
          ),

          const SizedBox(height: 20),

          // ================= Account & Profile =================
   const Text(
  "Account & Profile",
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
),

const SizedBox(height: 8),

Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    
  ),

  margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),

  color:const Color.fromARGB(255, 182, 113, 161).withOpacity(0.8),
  child: Column(
    children: [
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text("Edit Profile"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const EditProfilePage()),
          );
        },
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.lock),
        title: const Text("Change Password"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ChangePasswordPage()),
          );
        },
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.email),
        title: const Text("Manage Email"),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ManageEmailPage()),
          );
        },
      ),
    ],
  ),
),

const SizedBox(height: 20),


          // ================= App Preferences =================
          const Text(
            "App Preferences",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),

            color: const Color.fromARGB(255, 182, 113, 161).withOpacity(0.8),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text("Language"),
                  onTap: () {
                    // Navigate to Language settings
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text("Notifications"),
                  onTap: () {
                    // Navigate to Notification settings
                  },
                ),
                const Divider(),
                
                ListTile(
                  leading: const Icon(Icons.text_fields),
                  title: const Text("Font Size"),
                  onTap: () {
                    // Navigate to Font Size settings
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
