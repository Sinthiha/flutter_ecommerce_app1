import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  Future<void> _signUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration Successful!")),
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const SignInPage()));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: height),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 98, bottom: 60),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/diVpgg9AQr/y56ovbty_expires_30_days.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 92),
                          child: const Text(
                            "Get Started!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(bottom: 24, left: 28),
                        child: const Text(
                          "Create Your Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      // Email
                      
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF00D4FF), width: 2),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 19),
                        margin:
                            const EdgeInsets.only(bottom: 20, left: 24, right: 24),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 25,
                              height: 25,
                              child: Image.network(
                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/diVpgg9AQr/2pmiyufj_expires_30_days.png"),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: "Enter your email address",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      // Password

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF00D4FF), width: 2),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 21),
                        margin:
                            const EdgeInsets.only(bottom: 20, left: 24, right: 24),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 16,bottom: 10),
                              width: 21,
                              height: 21,
                              child: Image.network(
                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/diVpgg9AQr/w0qdwllx_expires_30_days.png"),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                decoration: InputDecoration(
                                  hintText: "Enter your password",
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Confirm Password

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF00D4FF), width: 2),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 21),
                        margin:
                            const EdgeInsets.only(bottom: 37, left: 24, right: 24),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 16,bottom: 10),
                              width: 21,
                              height: 21,
                              child: Image.network(
                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/diVpgg9AQr/w0qdwllx_expires_30_days.png"),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _confirmPasswordController,
                                obscureText: _obscureConfirmPassword,
                                decoration: InputDecoration(
                                  hintText: "Confirm your password",
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obscureConfirmPassword = !_obscureConfirmPassword;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      // Sign Up Button

                      Center(
                        child: InkWell(
                          onTap: _signUp,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF4DAACC),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 46),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Already have account? Sign In

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SignInPage()),
                              );
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
