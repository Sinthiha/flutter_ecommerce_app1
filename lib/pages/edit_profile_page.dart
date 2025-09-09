import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Use the same colors as ProfilePage / CartPage
    final primaryColor = const Color.fromARGB(255, 4, 19, 36); // Background
    final secondaryColor = const Color.fromARGB(255, 182, 113, 161).withOpacity(0.9); // AppBar & buttons
    final textColor = Colors.white;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200, color: Colors.white),
        ),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                labelText: "Full Name",
                labelStyle: TextStyle(color: textColor),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: textColor.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(color: textColor),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: textColor.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      "Profile updated!",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: secondaryColor,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
