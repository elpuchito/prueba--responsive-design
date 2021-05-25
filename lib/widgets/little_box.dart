import 'package:flutter/material.dart';

class LittleSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.scaleDown,
              image:
                  NetworkImage('https://i.postimg.cc/02TR3F73/cuadrito.png'))),
      height: 40,
      width: 40,
    );
  }
}
