// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _supabase = Supabase.instance.client;
  bool _isLoading = false;

  bool _showOldPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    final oldPassword = _oldPasswordController.text.trim();
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword != confirmPassword) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords don't match!")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final currentUser = _supabase.auth.currentUser;
      if (currentUser == null) throw 'No user logged in!';

      final reAuthResponse = await _supabase.auth.signInWithPassword(
        email: currentUser.email!,
        password: oldPassword,
      );

      if (reAuthResponse.user == null) throw 'Old password is incorrect!';

      final updateResponse =
          await _supabase.auth.updateUser(UserAttributes(password: newPassword));

      if (updateResponse.user != null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                "Password changed successfully! Please log in again."),
            backgroundColor: Color.fromARGB(255, 182, 113, 161),
          ),
        );

        await _supabase.auth.signOut();

        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(context, '/sign_in_page', (r) => false);
      } else {
        throw 'Password update failed!';
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = const Color.fromARGB(255, 4, 19, 36);
    final secondaryColor =
        const Color.fromARGB(255, 182, 113, 161).withOpacity(0.9);
    final textColor = Colors.white;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text(
          "Change Password",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPasswordField(
                controller: _oldPasswordController,
                label: "Old Password",
                showPassword: _showOldPassword,
                onToggle: () {
                  setState(() {
                    _showOldPassword = !_showOldPassword;
                  });
                },
                textColor: textColor,
                borderColor: secondaryColor),
            const SizedBox(height: 16),
            _buildPasswordField(
                controller: _newPasswordController,
                label: "New Password",
                showPassword: _showNewPassword,
                onToggle: () {
                  setState(() {
                    _showNewPassword = !_showNewPassword;
                  });
                },
                textColor: textColor,
                borderColor: secondaryColor),
            const SizedBox(height: 16),
            _buildPasswordField(
                controller: _confirmPasswordController,
                label: "Confirm New Password",
                showPassword: _showConfirmPassword,
                onToggle: () {
                  setState(() {
                    _showConfirmPassword = !_showConfirmPassword;
                  });
                },
                textColor: textColor,
                borderColor: secondaryColor),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _isLoading ? null : _changePassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor,
                foregroundColor: textColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text("Update Password"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool showPassword,
    required VoidCallback onToggle,
    required Color textColor,
    required Color borderColor,
  }) {
    return TextField(
      controller: controller,
      obscureText: !showPassword,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: textColor),
        suffixIcon: IconButton(
          icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off,
              color: textColor),
          onPressed: onToggle,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textColor.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
