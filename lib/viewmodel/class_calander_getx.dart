import 'package:get/get.dart';

class Classfication_getx extends GetxController{

  
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxBool isSelected = false.obs;
  DateTime changeday(now1){
    DateTime now = now1;
    update();
    return now;
  }
}