import 'package:ai_flutter_app/ui/animal_bird.dart';
import 'package:flutter/material.dart';

class Nakyung extends StatefulWidget {
  const Nakyung({super.key});

  @override
  State<Nakyung> createState() => _NakyungState();
}

class _NakyungState extends State<Nakyung> {
  // Property
  bool buttonClick = false; // 식물
  bool buttonClicked = true; // 동물

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: buttonClicked
                  ? Colors.white
                  : const Color.fromARGB(255, 192, 192, 192),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (buttonClicked) {
                      buttonClicked = !buttonClicked;
                      buttonClicked = false;
                    } else {
                      buttonClick = false;
                    }
                  });
                },
                icon: Icon(
                  Icons.pets_outlined,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: buttonClick
                  ? Colors.white
                  : const Color.fromARGB(255, 192, 192, 192),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      buttonClick = !buttonClick;
                      buttonClicked = false;
                    });
                  },
                  icon: Icon(Icons.spa_outlined)),
            ),
          ),
        ],
      ),
      body: Bird(),
    );
  }
}
