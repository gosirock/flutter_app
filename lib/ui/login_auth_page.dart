import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_home_page.dart';
import 'login_register_page.dart';

class LoginAuthPage extends StatelessWidget {
  const LoginAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // 유저 로그인
          if(snapshot.hasData){
            return LoginHomePage();
          }
          // 유저 로그인 실패
          else{
            return const LoginRegisterPage();
          }
        },
      ),
    );
  }
}