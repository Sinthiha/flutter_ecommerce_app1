import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app1/pages/settings_page.dart';
import 'package:flutter_ecommerce_app1/pages/edit_profile_page.dart';
import 'package:flutter_ecommerce_app1/pages/change_password_page.dart';
import 'package:flutter_ecommerce_app1/pages/manage_email_page.dart';
import 'package:flutter_ecommerce_app1/pages/sign_in_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final isDark = Theme.of(context).brightness == Brightness.dark;

    
    final primaryColor = const Color.fromARGB(255, 4, 19, 36); // Background
    final secondaryColor = const Color.fromARGB(255, 182, 113, 161).withOpacity(0.9); // AppBar and buttons

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/shop_page');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile picture
            CircleAvatar(
              radius: 60,
              backgroundColor: secondaryColor,
              child: ClipOval(
                child: Image.asset(
                  "assets/images/profile.png",
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // User Name
            const Text(
              "Mahjabin Islam Sinthiha",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            // User Email
            const Text(
              "mahjabin@example.com",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 20),

            // Edit Profile Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfilePage()),
                );
              },
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Settings update options
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 4, 19, 36),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.white),
                    title: const Text("Change Password", style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ChangePasswordPage()),
                      );
                    },
                  ),

                  const Divider(height: 3, color: Colors.grey),

                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.white),
                    title: const Text("Manage Email", style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ManageEmailPage()),
                      );
                    },
                  ),

                  const Divider(height: 3, color: Colors.grey),

                  ListTile(
                    leading: const Icon(Icons.history, color: Colors.white),
                    title: const Text("Order History", style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                    onTap: () {},
                  ),

                  const Divider(height: 3, color: Colors.grey),
                  
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.white),
                    title: const Text("Settings", style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SettingsPage()),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Log Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SignInPage()),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Log Out",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
