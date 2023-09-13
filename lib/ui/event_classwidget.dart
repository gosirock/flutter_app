import 'package:ai_flutter_app/jihwanview/event_class.dart';
import 'package:ai_flutter_app/model/event.dart';
import 'package:ai_flutter_app/view/subscription.dart';
import 'package:ai_flutter_app/viewmodel/class_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventClassWidget extends StatelessWidget {
  TextEditingController tf1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GetBuilder<ClassEvent>(
        builder: (controller) {
          controller.getJSONData();
          List data = controller.data;
          List filteredData = data
              .where((item) => item['title'] == EventwithClass.title1)
              .toList();
          return filteredData.isEmpty
              ? const Text('데이터가 비어있습니다')
              : ListView.builder(
                  itemCount: filteredData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              '${filteredData[index]['title']}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 30,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Text(
                                      '${EventwithClass.state} ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 0,
                                    left: 40,
                                    child: Text(
                                      '운영기간 | ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 98,
                                    child: Text(
                                      '${filteredData[index]['operation_period']} ',
                                    ),
                                  ),
                                  const Positioned(
                                    top: 0,
                                    left: 273,
                                    child: Text(
                                      '장소 | ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 305,
                                    child: Text(
                                      '${filteredData[index]['location']}',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Get.to(Subscription(),
                                      arguments: filteredData[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0)),
                                    backgroundColor: const Color.fromARGB(
                                        255, 105, 105, 105),
                                    foregroundColor: Colors.white),
                                child: const Text(
                                  '신청하기',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            Image.network(
                              filteredData[index]['imagename'] != null
                                  ? 'http://localhost:8080/Flutter/images/${filteredData[index]['imagename']}'
                                  : 'http://localhost:8080/Flutter/images/noimage.png', // 빈 값인 경우 기본 이미지 URL을 설정
                              width: 300,
                              height: 300,
                            ),
                            Row(
                              children: [
                                Text(
                                  '• 일 시:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                    width: 310,
                                    child: Text(
                                        '${filteredData[index]['content1']}')),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '• 장소:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('${filteredData[index]['content2']}'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '• 대상:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('${filteredData[index]['content3']}'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '• 인원:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('${filteredData[index]['content4']}'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '• 만남장소:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('${filteredData[index]['content5']}'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '• 입장료:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('${filteredData[index]['content6']}'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '• 교육비:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('${filteredData[index]['content7']}'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '• 신청기간:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    '${filteredData[index]['application_period']}'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '• 문의처:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('${filteredData[index]['content8']}'),
                              ],
                            ),
                            Text(
                              '${filteredData[index]['limitation']}',
                              style: TextStyle(color: Colors.transparent),
                            )
                          ],
                        ),
                        // TextField(
                        //   controller: tf1,
                        //   keyboardType: TextInputType.text,
                        //   decoration:
                        //       const InputDecoration(labelText: '댓글을 입력해주세요'),
                        // ),
                        // ElevatedButton(
                        //   onPressed: () async {
                        //     String comment = tf1.text; // 텍스트 필드에서 텍스트 가져오기
                        //     if (comment.isNotEmpty) {
                        //       // 입력된 댓글이 비어있지 않은지 확인
                        //       await controller.writeForum(comment);
                        //       Get.snackbar('확인', '댓글이 입력되었습니다.');
                        //       tf1=TextEditingController();
                        //     }
                        //   },
                        //   child: const Text("등록"),
                        // )
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
