import 'dart:convert';
import 'package:ai_flutter_app/ui/jong.dart';
import 'package:ai_flutter_app/view/jong2.dart';
import 'package:ai_flutter_app/view/jonguk%20copy.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:xml/xml.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Jonguk extends StatefulWidget {
  const Jonguk({super.key});

  @override
  State<Jonguk> createState() => _JongukState();
}

class _JongukState extends State<Jonguk> {
  
  late String result;
  late String selectDate;
  late String weather;
  late String temp;
  late DateTime initialDate;
  @override
  void initState() {
    super.initState();
    result = '';
    weather ='';
    temp = '';
    initialDate = DateTime.now();
    selectDate = DateTime.now().toString().split(' ')[0];
    fn(DateTime.now());
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text(
          ''
        ),
        // backgroundColor: Colors.blue[400],
        // foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Container(
              width: 400,
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage('http://localhost:8080/uk.png'))
              ),
              child: Column(
                children: [
                  const SizedBox(height: 100,),
                  Text(
                    selectDate,
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(
                    '$result',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weather} ${temp}',
                        style: const TextStyle(
                          fontSize: 20
                        ),
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 30,),
            TableCalendar(
              focusedDay: initialDate,
              firstDay: DateTime.now(), 
              lastDay: DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day+5),
              calendarFormat: CalendarFormat.twoWeeks,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: T,
                rightChevronVisible: F,
                leftChevronVisible: F,
              ),
              selectedDayPredicate: (day) {
                return isSameDay(initialDate, day);
                
              },
              onDaySelected: (selectedDay, focusedDay) {
                initialDate = selectedDay;
                selectDate = selectedDay.toString().split(' ')[0];
                fn(selectedDay);
                setState(() {
                  
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // ---- Functions -----
  fn(selectedDay) async {

    String weekend = '0'; // 주말여부
    String month1 = '0'; // 12개월
    String month2 = '0';
    String month3 = '0';
    String month4 = '0';
    String month5 = '0';
    String month6 = '0';
    String month7 = '0';
    String month8 = '0';
    String month9 = '0';
    String month10 = '0';
    String month11 = '0';
    String month12 = '0';
    String rain = '0';  // 비
    String temp1 = '0'; // 기온 0미만
    String temp2 = '0'; // 0이상10미만
    String temp3 = '0'; // 10이상20미만
    String temp4 = '0'; // 20이상30미만
    String temp5 = '0'; // 30이상 40미만
    String holiday = '0'; // 공휴일 여부
    String season1 = '0'; // 간절기
    String season2 = '0'; // 동절기
    String season3 = '0'; // 하절기
    String festival = '1';  // 축제여부

    // 오늘날짜와 선택날짜 - 하여 원하는 날짜 숫자구하기
    var num = (int.parse(selectedDay.toString().split(" ")[0].substring(8,10))-int.parse(DateTime.now().toString().split(" ")[0].substring(8,10)));
    if(num >= 6){
      Get.snackbar('Error', '무료버전은 최대 5일까지 검색 가능합니다.',backgroundColor: Colors.red,colorText: Colors.white,snackPosition: SnackPosition.BOTTOM,duration: Duration(seconds: 2),);
      initialDate = DateTime.now();
      setState(() {
        
      });
    }else{

    
    // 주말여부확인
    selectedDay.weekday == DateTime.sunday||selectedDay.weekday == DateTime.saturday?weekend='1':weekend='0';
    // openweatherAPI 접근 및 기온,날씨 받아오기
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=37.4306&lon=127.0172&units=metric&appid=7d514160a5cdb20c4844f6e05faaa4ac');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List day = [];
    day = dataConvertedJSON['list'];
    print(int.parse(selectedDay.toString().split(" ")[0].substring(8,10)));
    print(day[num]['main']['temp']); // 기온
    print(day[num]['weather'][0]['main']); // 비
    temp = day[num]['main']['temp'].toString();
    temp = '${temp}℃';
    switch(day[num]['weather'][0]['main']){
      case 'Rain' : weather = '🌧️'; break;
      case 'Clouds' : weather = '☁️'; break;
      case 'Snow' : weather = '☃️'; break;
      
    }
    // temp 기온 데이터넣기
    if(day[num]['main']['temp'] < 0){
      temp1 = '1';
    }else if(day[num]['main']['temp'] < 10){
      temp2 = '1';
    }else if(day[num]['main']['temp'] < 20){
      temp3 = '1';
    }else if(day[num]['main']['temp'] < 30){
      temp4 = '1';
    }else{
      temp5 = '1';
    }

    // 비 유무 체크
    if(day[num]['weather'][0]['main'].toString() == 'Rain'){
      rain = '1';
    }
    print(rain);

    // 공휴일 체크
    String year = (selectedDay.toString().split(" ")[0].substring(0,4));
    String month = (selectedDay.toString().split(" ")[0].substring(5,7));
    final xmlresponse = await http.get(Uri.parse("http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?solYear=${year}&solMonth=${month}&ServiceKey=%2BfTjvlQ%2BphppNczXsmMOUOaHAo5EjSC7P%2FuMXBvR%2Fc7Sh2fkaFIQMOMi9sRhRSRxV7oVGMl9iGbC67eL4qgKJA%3D%3D"));
    final document = XmlDocument.parse(xmlresponse.body);
    final locdate = document.findAllElements('locdate');
    for(var i in locdate){

      //공휴일 데이터 넣기
    i.toString().substring(15,17) == selectedDay.toString().split(" ")[0].substring(8,10)?holiday='1':holiday='0';
    print(i.toString().substring(15,17));
    print(selectedDay.toString().split(" ")[0].substring(8,10));
  }

    // 계절 체크
    String season = '';
    switch(int.parse(month)){
      case (01||02||11||12)
      : season = '동절기';
      season2 = '1';
      break;
      case (03||04||09||10)
      : season = '간절기';
      season1 = '1';
      break;
      default
      : season = '하절기';
      season3 = '1';
      break;
    }
    print(season);
    
    //12개월 넣기.....
    switch(int.parse(month)){
      case 01: month1 = '1'; break;
      case 02: month2 = '1'; break;
      case 03: month3 = '1'; break;
      case 04: month4 = '1'; break;
      case 05: month5 = '1'; break;
      case 06: month6 = '1'; break;
      case 07: month7 = '1'; break;
      case 08: month8 = '1'; break;
      case 09: month9 = '1'; break;
      case 10: month10 = '1'; break;
      case 11: month11 = '1'; break;
      case 12: month12 = '1'; break;
    }

    // 가져오기
    var resulturl = Uri.parse(
      'http://localhost:8080/Rserve/rf.jsp?weekend=$weekend&rain=$rain&holiday=$holiday&festival=$festival&month1=$month1&month2=$month2&month3=$month3&month4=$month4&month5=$month5&month6=$month6&month7=$month7&month8=$month8&month9=$month9&month10=$month10&month11=$month11&month12=$month12&season1=$season1&season2=$season2&season3=$season3&temp1=$temp1&temp2=$temp2&temp3=$temp3&temp4=$temp4&temp5=$temp5'
    );
    var resultResponse = await http.get(resulturl);
    var ResultdataConvertedJSON = json.decode(utf8.decode(resultResponse.bodyBytes));
    result = ResultdataConvertedJSON['result'];
    print(result);
    if(result == '작음'){
      result = '1500명 미만으로 적음';
    }else if(result == '보통'){
      result = '4000명 미만으로 보통';
    }else{
      result = '4000명 이상으로 많음';
    }
    setState(() {
    
    });
    }
  }

} // END