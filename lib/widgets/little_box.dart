import 'package:flutter/material.dart';

class LittleSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
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
