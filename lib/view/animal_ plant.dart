import 'package:flutter/material.dart';

class Plant extends StatefulWidget {
  const Plant({super.key});

  @override
  State<Plant> createState() => _PlantState();
}

class _PlantState extends State<Plant> {
  List<String> dropdownList = ['학문적 분류', '양치식물강', '속새강', '석송강'];
  String selectedDropdown = '학문적 분류';

  TextEditingController PlantSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                    controller: PlantSearchController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search...',
                        suffixIcon: IconButton(
                            onPressed: () => PlantSearchController.clear(),
                            icon: Icon(Icons.clear)),
                        prefixIcon: IconButton(
                            onPressed: () {
                              //
                            },
                            icon: Icon(Icons.search))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
