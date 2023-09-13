import 'package:ai_flutter_app/jihwanview/event_class.dart';
import 'package:ai_flutter_app/model/event.dart';
import 'package:ai_flutter_app/model/message.dart';
import 'package:ai_flutter_app/ui/event_classwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';

class ClassAndEventWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('eventclass')
            .orderBy('name', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final documnets = snapshot.data!.docs;
          return ListView(
            children: documnets.map((e) => _buildItemWidget(e)).toList(),
          );
        },
      );
  }





  // --- Functions---


  Widget _buildItemWidget(DocumentSnapshot doc) {
    final message = Message(
      opertaion_period: doc['operation_period'], 
      phone: doc['phone'], 
      state: doc['state'], 
      title1: doc["title1"], 
      title2: doc['title2'], 
      imagename: doc['imagename']
      );
    return FutureBuilder<String>(
       // FutureBuilder를 사용하여 getImageDownloadURL 함수를 비동기적으로 호출.
        future: getImageDownloadURL(message.imagename),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 데이터를 기다리는 동안에는 로딩 돌아감
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
             // 에러가 발생한 경우 에러 메시지 반환
            return Text('Error: ${snapshot.error}');
          }      
          String downloadURL = snapshot.data ?? '';
          return GestureDetector(
              onTap: () {
                EventwithClass.id = doc.id;
                EventwithClass.operation_period = doc['operation_period'];
                EventwithClass.imagename = doc['imagename'];
                EventwithClass.phone = doc['phone'];
                EventwithClass.title1 = doc['title1'];
                EventwithClass.title2 = doc['title2'];
                EventwithClass.state = doc['state'];
                Get.to(EventClass(), arguments: doc['title1']);
              },
              child: Card(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              downloadURL,
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(
                              width: 270,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${message.title1}",
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,0,0,8),
                                child: Text(message.title2),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                child: Row(
                                  children: [
                                    Text('운영기간: ${message.opertaion_period}'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,0,0,0),
                                child: Row(
                                  children: [
                                    Text('문의처: ${message.phone}'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,0,0,8),
                                child: Row(
                                  children: [
                                    Text('접수상태: ${message.state}'),
                                  ],
                                ),
                              ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
        }
          );
  }

  }

  Future<String> getImageDownloadURL(String imagePath) async {
    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref(imagePath)
        .getDownloadURL();

    return downloadURL;
    
}