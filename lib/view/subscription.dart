import 'package:ai_flutter_app/home.dart';
import 'package:ai_flutter_app/ui/subscription_widget.dart';
import 'package:ai_flutter_app/viewmodel/class_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Subscription extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final eventData = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('신청하기'),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
              Get.back();
              Get.back();
            }, 
            icon: Icon(Icons.home))
        ],
      ),
      body: SubscriptionWidget(eventData: eventData),
    );
  }
}