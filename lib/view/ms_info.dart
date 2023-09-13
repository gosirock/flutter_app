import 'package:ai_flutter_app/view/ms_info2.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class InfoCardio extends StatefulWidget {
  @override
  _InfoCardioState createState() => _InfoCardioState();
}

class _InfoCardioState extends State<InfoCardio> {
  late int drinkValue;
  late int smokeValue;
  late int activityValue;
  late int total = drinkValue + smokeValue + activityValue;
  late Gender _selectedGender = Gender.none;
  late DrinkOption _selectedDrinkOption = DrinkOption.none;
  late SmokeOption _selectedSmokeOption = SmokeOption.none;
  late ActivityOption _selectedActivityOption = ActivityOption.none;
  late int c_cage;
  late int bmi;
  late int getlow;
  late int gethigh;
  late TextEditingController age;
  late TextEditingController height;
  late TextEditingController weight;
  late TextEditingController ap_low;
  late TextEditingController ap_high;

  @override
  void initState() {
    super.initState();
    age = TextEditingController();
    height = TextEditingController();
    weight = TextEditingController();
    ap_low = TextEditingController();
    ap_high = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('성별'),
            Radio<Gender>(
              value: Gender.male,
              groupValue: _selectedGender,
              onChanged: (value) {
                value = _selectedGender;
                _selectedGender = Gender.male;
                setState(() {
                  
                });
              },
            ),
            const Text('남성'),
            Radio<Gender>(
              value: Gender.female,
              groupValue: _selectedGender,
              onChanged: (value) {
                value = _selectedGender;
                _selectedGender = Gender.female;
                setState(() {

                });
              },
            ),
            const Text('여성'),
          ],
        ),
        Text('음주 여부'),
        RadioListTile<DrinkOption>(
          title: const Text('음주함'),
          value: DrinkOption.drinks,
          groupValue: _selectedDrinkOption,
          onChanged: (value) {
            value = _selectedDrinkOption;
            _selectedDrinkOption = DrinkOption.drinks;
            drinkValue = value == DrinkOption.drinks ? 1 : 0;
            setState(() {
              
            });
          },
        ),
        RadioListTile<DrinkOption>(
          title: const Text('음주하지 않음'),
          value: DrinkOption.noDrinks,
          groupValue: _selectedDrinkOption,
          onChanged: (value) {
            value = _selectedDrinkOption;
            _selectedDrinkOption = DrinkOption.noDrinks;
            drinkValue = value == DrinkOption.drinks ? 1 : 0;
            setState(() {

            });
          },
        ),
        Text('흡연 여부'),
        RadioListTile<SmokeOption>(
          title: const Text('흡연함'),
          value: SmokeOption.smokes,
          groupValue: _selectedSmokeOption,
          onChanged: (value) {
            value = _selectedSmokeOption;
            _selectedSmokeOption = SmokeOption.smokes;
            smokeValue = value == SmokeOption.smokes ? 1 : 0;
            setState(() {

            });
          },
        ),
        RadioListTile<SmokeOption>(
          title: const Text('흡연하지 않음'),
          value: SmokeOption.noSmokes,
          groupValue: _selectedSmokeOption,
          onChanged: (value) {
            value = _selectedSmokeOption;
            _selectedSmokeOption = SmokeOption.noSmokes;
            smokeValue = value == SmokeOption.smokes ? 1 : 0;
            setState(() {

            });
          },
        ),
        Text('신체활동 여부'),
        RadioListTile<ActivityOption>(
          title: const Text('활동함'),
          value: ActivityOption.doing,
          groupValue: _selectedActivityOption,
          onChanged: (value) {
            value = _selectedActivityOption;
            _selectedActivityOption = ActivityOption.doing;
            activityValue = value == ActivityOption.doing ? 0 : 1;
            setState(() {

            });
          },
        ),
        RadioListTile<ActivityOption>(
          title: const Text('활동하지 않음'),
          value: ActivityOption.doNot,
          groupValue: _selectedActivityOption,
          onChanged: (value) {
            value = _selectedActivityOption;
            _selectedActivityOption = ActivityOption.doNot;
            activityValue = value == ActivityOption.doing ? 0 : 1;
            setState(() {

            });
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextField(
            controller: age,
            decoration: const InputDecoration(labelText: '나이를 입력하세요!'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextField(
            controller: height,
            decoration: const InputDecoration(labelText: '키(cm)를 입력하세요!'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextField(
            controller: weight,
            decoration: const InputDecoration(labelText: '몸무게(kg)를 입력하세요!'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 50,
                child: TextField(
                  controller: ap_low,
                  decoration: const InputDecoration(
                    labelText: '최저 혈압' 
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 50,
                child: TextField(
                  controller: ap_high,
                  decoration: const InputDecoration(
                    labelText: '최고 혈압' 
                  ),
                ),
              ),
              IconButton(
                onPressed: () => go_cholesterol(age.text, height.text, weight.text, ap_high.text, ap_low.text), 
                icon: const Icon(Icons.navigate_next_outlined),
              )
            ],
          ),
        )
      ],
    );
  }

  // ---- functions ----
  // ignore: non_constant_identifier_names
  go_cholesterol(String c_age, String c_height, String c_weight, String c_high, String c_low){
    if(c_age.trim().isEmpty | c_height.trim().isEmpty | c_weight.trim().isEmpty | c_high.trim().isEmpty | c_low.trim().isEmpty){
      showDialog(
        context: context,
        barrierDismissible: false, 
        builder: (context) {
          return AlertDialog(
            title: const Text('Error!'),
            content: const Text('입력을 확인하세요!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), 
                child: const Text('확인'))
            ],
          );
        },
      );
    }else{
      c_cage = (int.parse(c_age) ~/ 10);

      double bmi_calc = (int.parse(c_weight) / (int.parse(c_height) * int.parse(c_height) / 10000)) as double;
      if(bmi_calc < 18.5){
        bmi = 0;
      }else if(bmi_calc >= 18.5 && bmi_calc < 23){
        bmi = 1;
      }else if(bmi_calc >= 23 && bmi_calc < 25){
        bmi = 2;
      }else if(bmi_calc >= 25 && bmi_calc < 30){
        bmi = 3;
      }else if(bmi_calc >= 30){
        bmi = 4;
      }

      if(int.parse(ap_high.text) >= 140 || int.parse(ap_low.text) >= 90){
        gethigh = 1;
      }else{
        gethigh = 0;
      }

      if(int.parse(ap_high.text) <= 90 || int.parse(ap_low.text) <= 60){
        getlow = 1;
      }else{
        getlow = 0;
      }

      Get.to(const Cholesterol(), 
      arguments: [c_cage, bmi, gethigh, getlow, total] 
      );
    }
  }
}

enum Gender { male, female, none }

enum DrinkOption { drinks, noDrinks, none }

enum SmokeOption { smokes, noSmokes, none }

enum ActivityOption { doing, doNot, none }