import 'package:flutter/material.dart';

class Nakyung extends StatefulWidget {
  const Nakyung({super.key});

  @override
  State<Nakyung> createState() => _NakyungState();
}

class _NakyungState extends State<Nakyung> {
  @override
  Widget build(BuildContext context) {
    // Property
    List<String> animalList = ['1', '2', '3'];
    String animalDropdown = '1';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '동식물 사전',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        shape: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                //
              },
              icon: Icon(Icons.pets_outlined)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  //
                },
                icon: Icon(Icons.spa_outlined)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton(
              value: animalDropdown,
              items: animalList.map((String animal) {
                return DropdownMenuItem(
                  child: Text('$animal'),
                  value: animal,
                );
              }).toList(),
              onChanged: (dynamic value) {
                setState(() {
                  animalDropdown = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
