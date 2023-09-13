import 'package:ai_flutter_app/home.dart';
import 'package:ai_flutter_app/ui/classandeventwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Jihwan extends StatelessWidget {
  const Jihwan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('교육프로그램'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(Home());
            }, 
            icon: Icon(Icons.home))
        ],
      ),
      body: ClassAndEventWidget(),
    );
  }
}