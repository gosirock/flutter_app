import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ClassEvent extends GetxController{
  List data=[];
  List imagepath=[];
  String content="";
  String title="";
  getJSONData() async{
  var url = Uri.parse('http://localhost:8080//Flutter/event_class.jsp');
  var response = await http.get(url);
  data.clear();
  var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
  List result = dataConvertedJSON['results'];
  data.addAll(result);
  update();
}


  Future<void> writeForum(String comment) async {
  var url = Uri.parse('http://localhost:8080/Flutter/writeforum.jsp');
  var response = await http.post(
    url,
    body: {'ftitle': comment, 'fcontent': comment}, // 댓글 관련 데이터 전송
  );
}

  

}