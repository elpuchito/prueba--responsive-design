import 'package:flutter/material.dart';

class LittleDarkBlueButton extends StatelessWidget {
  final String title;

  const LittleDarkBlueButton({Key? key, required this.title}) : super(key: key);

// 'INSCRIBITE AL PLAN'
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          // SizedBox(width: 10),
          Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 12)
        ],
      ),
      style: ElevatedButton.styleFrom(
        maximumSize: Size(220, 50),
        primary: Colors.indigo[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
