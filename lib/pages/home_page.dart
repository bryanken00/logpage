import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [IconButton(onPressed: signOut, icon: Icon(Icons.logout))]),
      body: Center(
          child: Text(
        'Welcome to my Page ' + user.email!,
        style: const TextStyle(
          fontSize: 16,
        ),
      )),
    );
  }
}
