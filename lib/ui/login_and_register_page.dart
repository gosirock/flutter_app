import 'package:ai_flutter_app/ui/login_buton.dart';
import 'package:ai_flutter_app/ui/login_page.dart';
// import 'package:ai_flutter_app/ui/login_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';

class LoginAndRegisterPage extends StatefulWidget {

  final Function()? onTap;

  const LoginAndRegisterPage({super.key, required this.onTap});

  @override
  State<LoginAndRegisterPage> createState() => _LoginAndRegisterPageState();
}

class _LoginAndRegisterPageState extends State<LoginAndRegisterPage> {
  // id, pw 입력
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  

  void signUserUp() async {

    showDialog(context: context, builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }, 
    );

 try {

  if(passwordController.text == confirmPasswordController.text){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: usernameController.text, 
    password: passwordController.text,
  );
  }

  // 로그인 성공 시 이전 화면으로 돌아가기 위해 Builder 위젯 사용
  // ignore: use_build_context_synchronously
  Navigator.of(context).pop();
} on FirebaseAuthException catch (e) {
  Navigator.of(context).pop();
  if (e.code == 'user-not-found') { // 오타 수정
    wrongIdMessage(context);
  } else if (e.code == 'wrong-password') {
    wrongPwMessage(context);
  }
}
   
  }

  void wrongIdMessage(BuildContext context) {
  showDialog(
    context: context, 
    builder: (context) {
      return const AlertDialog(
        title: Text("이메일이 틀렸습니다."),
      );
    },
  );
}

  void wrongPwMessage(BuildContext context) {
  showDialog(
    context: context, 
    builder: (context) {
      return const AlertDialog(
        title: Text("비밀번호가 틀렸습니다."),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('윤재'),
      // ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(height: 50,),
                  Text('(ᓀ‸ᓂ)',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 25,),
                  LoginPage( // id
                    controller: usernameController,
                    hintText: '아이디',
                    obscureText: false,
                  ),
                  LoginPage( // pw
                    controller: passwordController,
                    hintText: '비밀번호',
                    obscureText: true,
                  ),
                  LoginPage( // pw
                    controller: confirmPasswordController,
                    hintText: '비밀번호 확인',
                    obscureText: true,
                  ),
                  // const SizedBox(height: 10,),
                  // const Row(
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.fromLTRB(20, 1, 1, 1),
                  //       child: Text('비밀번호를 잊으셨나요?',
                  //       style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 25,),
                  LoginButton(
                    text: "회원가입",
                    onTap: signUserUp,
                  ),
                  const SizedBox(height: 25,),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Divider(thickness: 0.5,
                  //         color: Colors.grey[400],
                  //         ),
                  //       ),
                  //       const Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: 8.0),
                  //         child: Text('다른 방법으로 로그인 (ᓀ‸ᓂ)',
                  //         style: TextStyle(color: Color.fromARGB(255, 61, 61, 61)),
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: Divider(thickness: 0.5,
                  //         color: Colors.grey[400],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     // 구글 버튼
                  //       LoginTile(imagePath: '구글 버튼(예정)'),
                  //       SizedBox(width: 20,),
                  //     // 카카오 버튼
                  //       LoginTile(imagePath: '카카오 버튼(예정)'),
                  //   ],
                  // ),
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text('이미 있는 계정입니다.',
                      // style: TextStyle(
                      //   color: Colors.grey[700],
                      //   ),
                      // ),
                      // const SizedBox(width: 5),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text('로그인 페이지로',
                        style: TextStyle(color: Colors.blue,
                        fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
