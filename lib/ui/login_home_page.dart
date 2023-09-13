import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginHomePage extends StatelessWidget {
  LoginHomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

    void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
          IconButton(
          onPressed: signUserOut, 
          icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text("로그인 성공!!${user.email!}"),
      ),
    );
  }
}