import 'package:ai_flutter_app/model/event.dart';
import 'package:ai_flutter_app/ui/login_page.dart';
import 'package:ai_flutter_app/view/reservation.dart';
import 'package:ai_flutter_app/viewmodel/class_calander_getx.dart';
import 'package:ai_flutter_app/viewmodel/class_getx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class SubscriptionWidget extends StatelessWidget {
  // final user = FirebaseAuth.instance.currentUser!; 
  final Map<String, dynamic> eventData;
  final Classfication_getx controller = Get.put(Classfication_getx());
  String selectDate = DateTime.now().toString().split(' ')[0];
  DateTime currentDate = DateTime.now(); // 현재 날짜
  bool isSelected = false; // 선택한 날짜에 대한 표시 여부
  DateTime now = DateTime.now();
  SubscriptionWidget({required this.eventData});
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              '${eventData['title']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.network(
              eventData['imagename'] != null
                  ? 'http://localhost:8080/Flutter/images/${eventData['imagename']}'
                  : 'http://localhost:8080/Flutter/images/noimage.png', // 빈 값인 경우 기본 이미지 URL을 설정
              width: 300,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text('대상 : ', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('${eventData['content3']}')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text('장소 : ', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('${eventData['content2']}')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text('이용기간 : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('${eventData['operation_period']}',),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text('접수기간 : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('${eventData['application_period']}'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text('선별방법 : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('선착순'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text('모집정원 : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('${eventData['content4']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  const Text('신청제한 : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('1회에 1 ~ ${eventData['limitation']}명 까지 신청가능'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text('취소기간 : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('이용일 2일 전까지'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Text('예약방법 : ',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('인터넷'),
                ],
              ),
            ),
            Text(
              '문의전화 : 서울대공원/${eventData['content8']}',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            TableCalendar(
              headerStyle: HeaderStyle(formatButtonVisible: false),
              firstDay: DateTime.now(),
              lastDay: DateTime(2023, 12, 31),
              focusedDay: now, // 변경된 부분
              onDaySelected: (selectedDay, focusedDay) {
                now=controller.changeday(selectedDay);
                controller.selectedDate.value = selectedDay; // 상태 변경
                controller.isSelected.value = true; // 선택 여부 변경
                selectDate = selectedDay.toString().split(" ")[0];
              },
              // ... (다른 속성들)
            ),
            Obx(() => controller.isSelected.value
                ? Text('선택한 날짜: ${controller.selectedDate.value.toString().split(" ")[0]}')
                : SizedBox.shrink()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(5),
                        ),
                      ),
                    onPressed: () {
                    if(controller.isSelected.value==false){
                      Get.defaultDialog(
                        title: '경고',
                        middleText: '날짜를 선택해주세요',
                        actions: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('닫기'))
                        ]
                      );
                    // }else if(user.email==null){
                    //     Get.defaultDialog(
                    //     title: '경고',
                    //     middleText: '로그인이 필요한 화면입니다.',
                    //     actions: [
                    //           TextButton(
                    //             onPressed: () {
                    //               Get.to(LoginPage(hintText: hintText, obscureText: obscureText))
                    //             }, 
                    //             child: const Text('로그인 페이지로 이동')),
                    //           TextButton(
                    //               onPressed: () {
                    //                 Get.back();
                    //               },
                    //               child: const Text('닫기'))
                    //     ]
                    //   );
                    }else{
                    Get.to(Reservation(),arguments:{  
                    'eventData': eventData,
                    'selectedDate': controller.selectedDate.value.toString().split(" ")[0]
                    },
                    );
                    }
                  }, 
                  child: const Text('예약하기', style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(5)
                          ),
                        ),
                      onPressed: () {
                        Get.defaultDialog(
                            title: '공지사항',
                            middleText:
                                "동물원 입장료 별도,\n프로그램은 무료\n'${eventData['content5']}' \n앞에서 시작합니다",
                            middleTextStyle: TextStyle(fontWeight: FontWeight.bold),
                            backgroundColor: Colors.white,
                            barrierDismissible: false,
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('닫기'))
                            ]);
                      },
                      child: const Text('공지사항')),
                )
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
