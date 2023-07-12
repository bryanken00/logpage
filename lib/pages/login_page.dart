import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';
import '../components/my_button.dart';
import '../components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //Text editing Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void SignInUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // logo
              Image.asset(
                'lib/images/KBN_icon.png',
                height: 100,
              ),

              const SizedBox(height: 50),

              // Text
              Text('Welcome to KBN Skin Essentials!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16)),

              const SizedBox(height: 25),

              // username textfile
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfile
              MyTextField(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ]),
              ),

              const SizedBox(height: 25),

              // signin button
              MyButton(
                onTap: SignInUser,
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // other platform
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // guest
                  SquareTile(
                    imagePath: 'lib/images/guest.jpg',
                  ),
                  SizedBox(width: 10),
                  // google
                  SquareTile(
                    imagePath: 'lib/images/google.png',
                  ),
                  SizedBox(width: 10),
                  // facebook
                  SquareTile(
                    imagePath: 'lib/images/facebook.png',
                  ),
                ],
              ),

              const SizedBox(height: 50),

              // new Account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'not Registered?',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Pre-Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
