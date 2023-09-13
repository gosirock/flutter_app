import 'package:ai_flutter_app/view/ms_info.dart';
import 'package:flutter/material.dart';

class Minsung extends StatelessWidget {
  const Minsung({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('심혈관질환 자가진단'),
      ),
      body: InfoCardio(),
    );
  }
}