import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _changePassword() {
    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords don't match!"),
          backgroundColor: Color.fromARGB(255, 182, 113, 161),
        ),
      );
      return;
    }

    // Implement your password change logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password changed successfully!"),
        backgroundColor: Color.fromARGB(255, 182, 113, 161),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Exact ProfilePage / CartPage colors
    final primaryColor = const Color.fromARGB(255, 4, 19, 36);
    final secondaryColor = const Color.fromARGB(255, 182, 113, 161).withOpacity(0.9);
    final textColor = Colors.white;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text(
          "Change Password",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200, color: Colors.white),
        ),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _oldPasswordController,
              obscureText: true,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                labelText: "Old Password",
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
              controller: _newPasswordController,
              obscureText: true,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                labelText: "New Password",
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
              controller: _confirmPasswordController,
              obscureText: true,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                labelText: "Confirm New Password",
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
              onPressed: _changePassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor,
                foregroundColor: textColor,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Update Password"),
            ),
          ],
        ),
      ),
    );
  }
}
