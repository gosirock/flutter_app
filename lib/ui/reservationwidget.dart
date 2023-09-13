import 'package:ai_flutter_app/view/jihwan.dart';
import 'package:ai_flutter_app/viewmodel/increasenumver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationWidget extends StatelessWidget {
  final Map<String, dynamic> finalData;
  final String selectedDate; // Corrected parameter name here

  ReservationWidget({required this.finalData, required this.selectedDate});
  @override
  Widget build(BuildContext context) {
    String lastTwoChars = selectedDate.substring(selectedDate.length - 2);
    int lastTwoCharsAsInt = int.parse(lastTwoChars);
    int modifiedValue = lastTwoCharsAsInt - 1;
    String modifiedDate = selectedDate.substring(0, selectedDate.length - 2) +
        modifiedValue.toString().padLeft(2, '0');
    return GetBuilder<ReservationController>(
      builder: (controller) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    color: const Color.fromARGB(59, 112, 212, 255),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Row(
                                children: [
                                  Text(
                                    '나의 예약 정보',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Divider(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    finalData["title"],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 7, 93, 243)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("-이용회차 "),
                                  Text(
                                    "$selectedDate",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('-취소기간 '),
                                  Text(
                                    '${modifiedDate}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('-취소수수료 : '),
                                  Text(
                                    '없음',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 250,
                            )
                          ],
                        ),
                        Positioned(
                          top: 250,
                          right: 10,
                          child: SizedBox(
                            width: 350,
                            child: Positioned(
                              top: 250,
                              right: 140,
                              child: Card(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '결제금액',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Text('-이용인원'),
                                        SizedBox(width: 255),
                                        Text(
                                            "${controller.number.toString()}명"),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('-이용요금'),
                                        SizedBox(
                                          width: 255,
                                        ),
                                        Text('0원')
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('-할인/할증'),
                                        SizedBox(
                                          width: 251,
                                        ),
                                        Text('0원')
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(260, 0, 0, 0),
                                      child: Text(
                                        '총결제금액',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(300, 0, 0, 0),
                                      child: Text(
                                        '0원',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 425,
                          right: 133,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              onPressed: () async{
                                if(controller.number==0){
                                  Get.defaultDialog(
                                    title:'오류',
                                    middleText: '최소 한명 이상이어야합니다',
                                    backgroundColor: Colors.white,
                                    barrierDismissible: false,
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text('확인'))
                                    ]
                                  );
                                }else{
                              await controller.reservation(finalData["title"],controller.number.toString());
                                Get.defaultDialog(
                                    title: '완료',
                                    middleText: "예약이 완료되었습니다.",
                                    backgroundColor: Colors.white,
                                    barrierDismissible: false,
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                            Get.back();
                                            Get.back();
                                            Get.back();
                                          },
                                          child: const Text('확인'))
                                    ]);
                                    }
                              },
                              child: const Text(
                                '예약하기',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ),
                  ),
                  const Text('이용인원'),
                  Container(
                      color: Color.fromARGB(59, 112, 212, 255),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text('일반'),
                                const SizedBox(
                                  width: 180,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  onPressed: () {
                                    controller.decrementNumber();
                                  },
                                  child: const Text('-'),
                                ),
                                Container(
                                  height: 40,
                                  width: 20,
                                  color: Colors.blue,
                                  child: Obx(
                                    () => Center(
                                        child:
                                            Text(controller.number.toString())),
                                  ),
                                ),
                                const SizedBox(
                                  width: 1,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (controller.number <
                                        int.parse(finalData['limitation'])) {
                                      controller.incrementNumber();
                                    } else {
                                      Get.snackbar(
                                        'Limit Reached',
                                        '예약 신청 최대값을 초과 하였습니다.',
                                        duration: Duration(seconds: 2),
                                        snackPosition: SnackPosition.TOP,
                                      );
                                    }
                                  },
                                  child: const Text('+'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
