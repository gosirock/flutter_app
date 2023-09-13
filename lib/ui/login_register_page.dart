import 'package:ai_flutter_app/view/yoonjae.dart';
import 'package:flutter/material.dart';

import 'login_and_register_page.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {

  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Yoonjae(
        // onTap: togglePages,
      );
    }else{
      return LoginAndRegisterPage(
        onTap: togglePages,
      );
    }
  }
}