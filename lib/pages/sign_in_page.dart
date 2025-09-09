import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_ecommerce_app1/pages/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  Future<void> _signIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login Successful!")),
        );
        Navigator.pushReplacementNamed(context, '/shop_page');
      }
    } on AuthException catch (e) {
      if (mounted) {
        if (e.message.contains("Invalid login credentials")) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password is Incorrect!")),
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error: ${e.message}")));
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Unexpected error: $e")));
      }
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
                  padding: const EdgeInsets.only(top: 99, bottom: 60),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/diVpgg9AQr/u4jex3py_expires_30_days.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 93),
                          child: const Text(
                            "Welcome Back!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(bottom: 22, left: 24),
                        child: const Text(
                          "Sign In To Your Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),


                      // Email Field

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF00D4FF),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 19),
                        margin: const EdgeInsets.only(
                            bottom: 30, left: 24, right: 24),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 25,
                              height: 25,
                              child: Image.network(
                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/diVpgg9AQr/uiyh8m3f_expires_30_days.png",
                                fit: BoxFit.fill,
                              ),
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

                      // Password Field

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF00D4FF),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 21),
                        margin: const EdgeInsets.only(
                            bottom: 37, left: 24, right: 24),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 16,bottom: 10),
                              width: 15,
                              height: 15,
                              child: Image.network(
                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/diVpgg9AQr/oafggsip_expires_30_days.png",
                                fit: BoxFit.fill,
                              ),
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


                      // Sign In Button


                      Center(
                        child: InkWell(
                          onTap: _signIn,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF4DAACC),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, 
                                horizontal: 46,
                                ),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 70),


                      // "Or sign in with" text

                      const Center(
                        child: Text(
                          "Or sign in With",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Google icon

                      const Center(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Image(
                            image: NetworkImage(
                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/diVpgg9AQr/1x23dd65_expires_30_days.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      const SizedBox(height: 60),


                      // Sign Up Button

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpPage()),
                              );
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                              ),
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
