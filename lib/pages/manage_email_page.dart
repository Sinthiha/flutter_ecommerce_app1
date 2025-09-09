import 'package:flutter/material.dart';

class ManageEmailPage extends StatefulWidget {
  const ManageEmailPage({super.key});

  @override
  State<ManageEmailPage> createState() => _ManageEmailPageState();
}

class _ManageEmailPageState extends State<ManageEmailPage> {
  final TextEditingController _emailController = TextEditingController();

  void _updateEmail() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Email updated successfully!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 182, 113, 161),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Matching ProfilePage / CartPage colors
    final primaryColor = const Color.fromARGB(255, 4, 19, 36); // Background
    final secondaryColor = const Color.fromARGB(255, 182, 113, 161).withOpacity(0.9); // AppBar & buttons
    final textColor = Colors.white;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text(
          "Manage Email",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                labelText: "New Email",
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
              onPressed: _updateEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Update Email"),
            ),
          ],
        ),
      ),
    );
  }
}
