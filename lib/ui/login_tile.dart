import 'package:flutter/material.dart';

class LoginTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const LoginTile({
      super.key, 
      required this.imagePath,
      required this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
        ),
        child: Text(imagePath
        ),
      ),
    );
  }
}