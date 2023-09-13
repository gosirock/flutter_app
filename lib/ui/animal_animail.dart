import 'package:flutter/material.dart';

class Animal extends StatefulWidget {
  const Animal({super.key});

  @override
  State<Animal> createState() => _AnimalState();
}

class _AnimalState extends State<Animal> {
  List<String> dropdownList = ['학문적 분류', '포유류강', '조류강', '파충류강', '양서류강'];
  String selectedDropdown = '학문적 분류';
  TextEditingController serchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: DropdownButton(
                        value: selectedDropdown,
                        underline: SizedBox(),
                        items: dropdownList.map((String item) {
                          return DropdownMenuItem<String>(
                            child: Text(
                              '$item',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            selectedDropdown = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 330,
                    child: TextField(
                      controller: serchController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Search...',
                          suffixIcon: IconButton(
                              onPressed: () => serchController.clear(),
                              icon: Icon(Icons.clear)),
                          prefixIcon: IconButton(
                              onPressed: () {
                                //
                              },
                              icon: Icon(Icons.search))),
                    ),
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      Column(
                        children: [],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
