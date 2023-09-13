import 'package:ai_flutter_app/home.dart';
import 'package:ai_flutter_app/ui/event_classwidget.dart';
import 'package:ai_flutter_app/viewmodel/class_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class EventClass extends StatelessWidget {
  
  var value = Get.arguments ?? "";

  @override
  Widget build(BuildContext context) {
    final ClassEvent controller = Get.put(ClassEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('서울대공원'),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
              Get.back();
            }, 
            icon: Icon(Icons.home))
        ],
      ),
      body: EventClassWidget(),
    );
  }
}