import 'dart:convert';

import 'package:ai_flutter_app/view/ms_result.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class Gluc extends StatefulWidget {
  const Gluc({super.key});

  @override
  State<Gluc> createState() => _GlucState();
}

class _GlucState extends State<Gluc> {
  var rvalue = Get.arguments ?? '__';
  late String bmi;
  late String age_range;
  late String ap_high;
  late String ap_low;
  late String result;
  late int score;
  late int peeValue;
  late int waterValue;
  late int hungerValue;
  late int decreaseValue;
  late int tiredValue;
  late int hazyValue;
  late int skinValue;
  late int cureValue;
  late int sexualValue;
  late int total_calc = peeValue + waterValue + hungerValue + decreaseValue + tiredValue + hazyValue + skinValue + cureValue + sexualValue;
  late int total;
  late PeeOption _selectedPee = PeeOption.none;
  late WaterOption _selectedWater = WaterOption.none;
  late HungerOption _selectedHunger = HungerOption.none;
  late DecreaseOption _selectedDecrease = DecreaseOption.none;
  late TiredOption _selectedTired = TiredOption.none;
  late HazyOption _selectedHazy = HazyOption.none;
  late SkinOption _selectedSkin = SkinOption.none;
  late CureOption _selectedCure = CureOption.none;
  late SexualOption _selectedSexual = SexualOption.none;
  late String resultText;

  @override
  void initState() {
    super.initState();
    bmi = '';
    result = '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('혈당 자가진단'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('1) 소변을 자주 본다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<PeeOption>(
                        value: PeeOption.Yes,
                        groupValue: _selectedPee,
                        onChanged: (value) {
                          value = _selectedPee;
                          _selectedPee = PeeOption.Yes;
                          peeValue = value == PeeOption.Yes ? 1 : 0;
                          setState(() {});
                        },
                      ),
                      const Text('예'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 155,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<PeeOption>(
                          value: PeeOption.No,
                          groupValue: _selectedPee,
                          onChanged: (value) {
                            value = _selectedPee;
                            _selectedPee = PeeOption.No;
                            peeValue = value == PeeOption.Yes ? 1 : 0;
                            setState(() {});
                          },
                        ),
                        const Text('아니오'),
                      ],
                    ),
                  ),
                ),
              ],
            ), // 1번
            const Text('2) 갈증이 심하고 물을 많이 마신다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<WaterOption>(
                        value: WaterOption.Yes,
                        groupValue: _selectedWater,
                        onChanged: (value) {
                          value = _selectedWater;
                          _selectedWater = WaterOption.Yes;
                          waterValue = value == WaterOption.Yes ? 1 : 0;
                          setState(() {});
                        },
                      ),
                      const Text('예'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 155,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<WaterOption>(
                          value: WaterOption.No,
                          groupValue: _selectedWater,
                          onChanged: (value) {
                            value = _selectedWater;
                            _selectedWater = WaterOption.No;
                            waterValue = value == WaterOption.Yes ? 1 : 0;
                            setState(() {});
                          },
                        ),
                        const Text('아니오'),
                      ],
                    ),
                  ),
                ),
              ],
            ), // 2번
            const Text('3) 허기를 느껴 음식을 많이 섭취한다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<HungerOption>(
                        value: HungerOption.Yes,
                        groupValue: _selectedHunger,
                        onChanged: (value) {
                          value = _selectedHunger;
                          _selectedHunger = HungerOption.Yes;
                          hungerValue = value == HungerOption.Yes ? 1 : 0;
                          setState(() {});
                        },
                      ),
                      const Text('예'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 155,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<HungerOption>(
                          value: HungerOption.No,
                          groupValue: _selectedHunger,
                          onChanged: (value) {
                            value = _selectedHunger;
                            _selectedHunger = HungerOption.No;
                            hungerValue = value == HungerOption.Yes ? 1 : 0;
                            setState(() {});
                          },
                        ),
                        const Text('아니오'),
                      ],
                    ),
                  ),
                ),
              ],
            ), // 3번
            const Text('4) 특별한 이유 없이 체중이 많이 감소한다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<DecreaseOption>(
                        value: DecreaseOption.Yes,
                        groupValue: _selectedDecrease,
                        onChanged: (value) {
                          value = _selectedDecrease;
                          _selectedDecrease = DecreaseOption.Yes;
                          decreaseValue = value == DecreaseOption.Yes ? 1 : 0;
                          setState(() {});
                        },
                      ),
                      const Text('예'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 155,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<DecreaseOption>(
                          value: DecreaseOption.No,
                          groupValue: _selectedDecrease,
                          onChanged: (value) {
                            value = _selectedDecrease;
                            _selectedDecrease = DecreaseOption.No;
                            decreaseValue = value == DecreaseOption.Yes ? 1 : 0;
                            setState(() {});
                          },
                        ),
                        const Text('아니오'),
                      ],
                    ),
                  ),
                ),
              ],
            ), // 4번
            const Text('5) 쉽게 피곤해 진다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<TiredOption>(
                        value: TiredOption.Yes,
                        groupValue: _selectedTired,
                        onChanged: (value) {
                          value = _selectedTired;
                          _selectedTired = TiredOption.Yes;
                          tiredValue = value == TiredOption.Yes ? 1 : 0;
                          setState(() {});
                        },
                      ),
                      const Text('예'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 155,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<TiredOption>(
                          value: TiredOption.No,
                          groupValue: _selectedTired,
                          onChanged: (value) {
                            value = _selectedTired;
                            _selectedTired = TiredOption.No;
                            tiredValue = value == TiredOption.Yes ? 1 : 0;
                            setState(() {});
                          },
                        ),
                        const Text('아니오'),
                      ],
                    ),
                  ),
                ),
              ],
            ), // 5번
            const Text('6) 눈이 뿌옇게 보인다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<HazyOption>(
                        value: HazyOption.Yes,
                        groupValue: _selectedHazy,
                        onChanged: (value) {
                          value = _selectedHazy;
                          _selectedHazy = HazyOption.Yes;
                          hazyValue = value == HazyOption.Yes ? 1 : 0;
                          setState(() {});
                        },
                      ),
                      const Text('예'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 155,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<HazyOption>(
                          value: HazyOption.No,
                          groupValue: _selectedHazy,
                          onChanged: (value) {
                            value = _selectedHazy;
                            _selectedHazy = HazyOption.No;
                            hazyValue = value == HazyOption.Yes ? 1 : 0;
                            setState(() {});
                          },
                        ),
                        const Text('아니오'),
                      ],
                    ),
                  ),
                ),
              ],
            ), // 6번
            const Text('7) 피부가 건조하고 가렵다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<SkinOption>(
                        value: SkinOption.Yes,
                        groupValue: _selectedSkin,
                        onChanged: (value) {
                          value = _selectedSkin;
                          _selectedSkin = SkinOption.Yes;
                          skinValue = value == SkinOption.Yes ? 1 : 0;
                          setState(() {});
                        },
                      ),
                      const Text('예'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 155,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<SkinOption>(
                          value: SkinOption.No,
                          groupValue: _selectedSkin,
                          onChanged: (value) {
                            value = _selectedSkin;
                            _selectedSkin = SkinOption.No;
                            skinValue = value == SkinOption.Yes ? 1 : 0;
                            setState(() {});
                          },
                        ),
                        const Text('아니오'),
                      ],
                    ),
                  ),
                ),
              ],
            ), // 7번
            const Text('8) 상처치유가 느려지거나 잘 안된다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<CureOption>(
                        value: CureOption.Yes,
                        groupValue: _selectedCure,
                        onChanged: (value) {
                          value = _selectedCure;
                          _selectedCure = CureOption.Yes;
                          cureValue = value == CureOption.Yes ? 1 : 0;
                          setState(() {});
                        },
                      ),
                      const Text('예'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 155,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<CureOption>(
                          value: CureOption.No,
                          groupValue: _selectedCure,
                          onChanged: (value) {
                            value = _selectedCure;
                            _selectedCure = CureOption.No;
                            cureValue = value == CureOption.Yes ? 1 : 0;
                            setState(() {});
                          },
                        ),
                        const Text('아니오'),
                      ],
                    ),
                  ),
                ),
              ],
            ), // 8번
            const Text('9) 성욕이 감퇴한다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<SexualOption>(
                        value: SexualOption.Yes,
                        groupValue: _selectedSexual,
                        onChanged: (value) {
                          value = _selectedSexual;
                          _selectedSexual = SexualOption.Yes;
                          sexualValue = value == SexualOption.Yes ? 1 : 0;
                          setState(() {});
                        },
                      ),
                      const Text('예'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 155,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<SexualOption>(
                          value: SexualOption.No,
                          groupValue: _selectedSexual,
                          onChanged: (value) {
                            value = _selectedSexual;
                            _selectedSexual = SexualOption.No;
                            sexualValue = value == SexualOption.Yes ? 1 : 0;
                            setState(() {});
                          },
                        ),
                        const Text('아니오'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                if(total_calc < 2){
                  total = 0;
                }else if(total_calc >= 2 && total_calc < 6){
                  total = 1;
                }else if(total >= 6){
                  total = 2;
                }
                print("$rvalue[5]");
                bmi = rvalue[1];
                age_range = rvalue[0];
                ap_low = rvalue[3];
                ap_high = rvalue[2];
                score = 3;
                getJSONData();
              },
              icon: const Icon(Icons.navigate_next_outlined),
            )
          ],
        ),
      ),
    );
  }

  // --- functions ---

  getJSONData() async{
    var url = Uri.parse(
      'http://localhost:8080/Rserve/response_cardio.jsp?bmi=2&age_range=5&ap_low=0&ap_high=0&score=4'
    );
    var resonpse = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(resonpse.bodyBytes));
    result = dataConvertedJSON['result'];
    
    setState(() {
      
    });
    _showDialog();
  }

  _showDialog(){
    if(result == 0){
      resultText = '심혈관질환으로 부터 안전합니다.';
    }else{
      resultText = '심혈관질환으로 부터 안전합니다.';
    }
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: const Text('심혈관 예측결과'),
          content: Text('$resultText'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
                Get.back();
                Get.back();
              }, 
              child: const Text("나가기")
            )
          ],
        );
      },
      );
  }
  
}

enum PeeOption { Yes, No, none }

enum WaterOption { Yes, No, none }

enum HungerOption { Yes, No, none }

enum DecreaseOption { Yes, No, none }

enum TiredOption { Yes, No, none }

enum HazyOption { Yes, No, none }

enum SkinOption { Yes, No, none }

enum CureOption { Yes, No, none }

enum SexualOption { Yes, No, none }