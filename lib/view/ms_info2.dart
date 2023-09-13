import 'package:ai_flutter_app/view/ms_info3.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Cholesterol extends StatefulWidget {
  const Cholesterol({super.key});

  @override
  State<Cholesterol> createState() => _CholesterolState();
}

class _CholesterolState extends State<Cholesterol> {

  var value = Get.arguments ?? '__';
  late int walkValue;
  late int heelValue;
  late int foodValue;
  late int mealValue;
  late int annoyValue;
  late int manageValue;
  late int unbalValue;
  late int eatValue;
  late int total_calc = walkValue + heelValue + foodValue + mealValue + annoyValue + manageValue + unbalValue + eatValue;
  late int total;
  late WalkOption _selectedWalk = WalkOption.none;
  late HeelOption _selectedHeel = HeelOption.none;
  late FoodOption _selectedFood = FoodOption.none;
  late MealOption _selectedMeal = MealOption.none;
  late AnnoyOption _selectedAnnoy = AnnoyOption.none;
  late ManageOption _selectedManage = ManageOption.none;
  late UnbalOption _selectedUnbal = UnbalOption.none;
  late EatOption _selectedEat = EatOption.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('콜레스테롤 자가진단'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('1) 조금만 걸어도 다리가 아프다'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<WalkOption>(
                        value: WalkOption.Yes,
                        groupValue: _selectedWalk,
                        onChanged: (value) {
                          value = _selectedWalk;
                          _selectedWalk = WalkOption.Yes;
                          walkValue = value == WalkOption.Yes ? 1 : 0;
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
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<WalkOption>(
                          value: WalkOption.No,
                          groupValue: _selectedWalk,
                          onChanged: (value) {
                            value = _selectedWalk;
                            _selectedWalk = WalkOption.No;
                            walkValue = value == WalkOption.Yes ? 1 : 0;
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
            const Text('2) 아킬레스건 (발꿈치)이 늘 부어 있다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<HeelOption>(
                        value: HeelOption.Yes,
                        groupValue: _selectedHeel,
                        onChanged: (value) {
                          value = _selectedHeel;
                          _selectedHeel = HeelOption.Yes;
                          heelValue = value == HeelOption.Yes ? 1 : 0;
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
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<HeelOption>(
                          value: HeelOption.No,
                          groupValue: _selectedHeel,
                          onChanged: (value) {
                            value = _selectedHeel;
                            _selectedHeel = HeelOption.No;
                            heelValue = value == HeelOption.Yes ? 1 : 0;
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
            const Text('3) 기름진 음식을 좋아한다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<FoodOption>(
                        value: FoodOption.Yes,
                        groupValue: _selectedFood,
                        onChanged: (value) {
                          value = _selectedFood;
                          _selectedFood = FoodOption.Yes;
                          foodValue = value == FoodOption.Yes ? 1 : 0;
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
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<FoodOption>(
                          value: FoodOption.No,
                          groupValue: _selectedFood,
                          onChanged: (value) {
                            value = _selectedFood;
                            _selectedFood = FoodOption.No;
                            foodValue = value == FoodOption.Yes ? 1 : 0;
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
            const Text('4) 식사시간이 불규칙하다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<MealOption>(
                        value: MealOption.Yes,
                        groupValue: _selectedMeal,
                        onChanged: (value) {
                          value = _selectedMeal;
                          _selectedMeal = MealOption.Yes;
                          mealValue = value == MealOption.Yes ? 1 : 0;
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
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<MealOption>(
                          value: MealOption.No,
                          groupValue: _selectedMeal,
                          onChanged: (value) {
                            value = _selectedMeal;
                            _selectedMeal = MealOption.No;
                            mealValue = value == MealOption.Yes ? 1 : 0;
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
            const Text('5) 이유없이 짜증이 잘 나고 초조하다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<AnnoyOption>(
                        value: AnnoyOption.Yes,
                        groupValue: _selectedAnnoy,
                        onChanged: (value) {
                          value = _selectedAnnoy;
                          _selectedAnnoy = AnnoyOption.Yes;
                          annoyValue = value == AnnoyOption.Yes ? 1 : 0;
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
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<AnnoyOption>(
                          value: AnnoyOption.No,
                          groupValue: _selectedAnnoy,
                          onChanged: (value) {
                            value = _selectedAnnoy;
                            _selectedAnnoy = AnnoyOption.No;
                            annoyValue = value == AnnoyOption.Yes ? 1 : 0;
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
            const Text('6) 직장에서 중간 관리자 책임을 맡고있다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<ManageOption>(
                        value: ManageOption.Yes,
                        groupValue: _selectedManage,
                        onChanged: (value) {
                          value = _selectedManage;
                          _selectedManage = ManageOption.Yes;
                          manageValue = value == ManageOption.Yes ? 1 : 0;
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
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<ManageOption>(
                          value: ManageOption.No,
                          groupValue: _selectedManage,
                          onChanged: (value) {
                            value = _selectedManage;
                            _selectedManage = ManageOption.No;
                            manageValue = value == ManageOption.Yes ? 1 : 0;
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
            const Text('7) 편식이 심하다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<UnbalOption>(
                        value: UnbalOption.Yes,
                        groupValue: _selectedUnbal,
                        onChanged: (value) {
                          value = _selectedUnbal;
                          _selectedUnbal = UnbalOption.Yes;
                          unbalValue = value == UnbalOption.Yes ? 1 : 0;
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
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<UnbalOption>(
                          value: UnbalOption.No,
                          groupValue: _selectedUnbal,
                          onChanged: (value) {
                            value = _selectedUnbal;
                            _selectedUnbal = UnbalOption.No;
                            unbalValue = value == UnbalOption.Yes ? 1 : 0;
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
            const Text('8) 잠자기 전에 자주 먹는다.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Radio<EatOption>(
                        value: EatOption.Yes,
                        groupValue: _selectedEat,
                        onChanged: (value) {
                          value = _selectedEat;
                          _selectedEat = EatOption.Yes;
                          eatValue = value == EatOption.Yes ? 1 : 0;
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
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Row(
                      children: [
                        Radio<EatOption>(
                          value: EatOption.No,
                          groupValue: _selectedEat,
                          onChanged: (value) {
                            value = _selectedEat;
                            _selectedEat = EatOption.No;
                            eatValue = value == EatOption.Yes ? 1 : 0;
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
              onPressed: () => go_Gluc(),
              icon: const Icon(Icons.navigate_next_outlined),
            )
          ],
        ),
      ),
    );
  }

  // --- functions ---
  // ignore: non_constant_identifier_names
  go_Gluc(){
    
    if(total_calc < 2){
      total = 0;
    }else if(total_calc >= 2 && total_calc < 6){
      total = 1;
    }else if(total_calc >= 6){
      total = 2;
    }
    Get.to(const Gluc(), arguments: ["$value[0]","$value[1]","$value[2]","$value[3]","$value[4]",total]);
  }
}

enum WalkOption { Yes, No, none }

enum HeelOption { Yes, No, none }

enum FoodOption { Yes, No, none }

enum MealOption { Yes, No, none }

enum AnnoyOption { Yes, No, none }

enum ManageOption { Yes, No, none }

enum UnbalOption { Yes, No, none }

enum EatOption { Yes, No, none }
