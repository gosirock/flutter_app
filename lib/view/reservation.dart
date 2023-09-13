import 'package:ai_flutter_app/home.dart';
import 'package:ai_flutter_app/ui/reservationwidget.dart';
import 'package:ai_flutter_app/viewmodel/increasenumver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reservation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ReservationController controller = Get.put(ReservationController());
    final Map<String, dynamic> args = Get.arguments;
    final finalData = args['eventData'];
    final selectedDate = args['selectedDate'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('예약날짜'),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
              Get.back();
              Get.back();
              Get.back();
            }, 
            icon: Icon(Icons.home))
        ],
      ),
      body: ReservationWidget(finalData: finalData, selectedDate: selectedDate),
    );
  }
}