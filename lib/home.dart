import 'package:ai_flutter_app/ui/login_auth_service.dart';
import 'package:ai_flutter_app/view/jihwan.dart';
import 'package:ai_flutter_app/view/jonguk.dart';
import 'package:ai_flutter_app/view/minsung.dart';
import 'package:ai_flutter_app/view/nakyung.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
            "https://grandpark.seoul.go.kr/asset/images/common/logo.png"),
        centerTitle: true,
        shape: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(''),
              accountEmail: Text('${'user.email'}'),
              decoration: BoxDecoration(color: Colors.black54),
            ),
            ListTile(
              leading: Icon(
                Icons.login_outlined,
                color: Colors.black,
              ),
              title: const Text('Login'),
              onTap: () {
                Get.to(LoginAuthService());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_month_outlined,
                color: Colors.black,
              ),
              title: const Text('Audience Prediction'),
              onTap: () {
                Get.to(Jonguk());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.emoji_events_rounded,
                color: Colors.black,
              ),
              title: const Text('To Experience'),
              onTap: () {
                Get.to(Jihwan());
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () => Get.to(Jihwan()),
                  child: Image.network(
                      'https://grandpark.seoul.go.kr/upload/editorImg/edu/20390e3fed054a9bad86adb2dcc0d8f7.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () => Get.to(Jonguk()),
                  child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBvygsyF0s5ogQAQ16ZQDuG1Pn_NUUVhTzXw&usqp=CAU'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: () => Get.to(Minsung()),
                    child: Image.network(
                        'https://cdn.imweb.me/thumbnail/20201210/19517c02aaddc.png')),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: () => Get.to(Nakyung()),
                    child: Image.network(
                        'https://grandpark.seoul.go.kr/asset/images/sub/Experience/img_5_1_2_course_fir_02.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
