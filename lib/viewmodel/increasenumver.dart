import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ReservationController extends GetxController {
  RxInt number = 0.obs; // Create a reactive variable using obs().

  void incrementNumber() {
    number.value++;
    update();
  }

  void decrementNumber() {
    if (number.value > 0) {
      number.value--;
      update();
    }
  }


  Future<void> reservation(String classfication,String pcount) async {
  var url = Uri.parse('http://localhost:8080/Flutter/reservation.jsp');
  var response = await http.post(
    url,
    body: {'classfication': classfication, 'pcount': pcount},
  );
}
}