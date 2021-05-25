import 'package:flutter/material.dart';

class CustomCheck2 extends StatefulWidget {
  final String title;

  CustomCheck2({Key? key, required this.title}) : super(key: key);
  @override
  _CustomCheck2State createState() => _CustomCheck2State(title: title);
}

class _CustomCheck2State extends State<CustomCheck2> {
  final String title;

  _CustomCheck2State({required this.title});
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.amber;
    }
    return Colors.grey;
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      // width: 130,
      // height: 30,
      child: Container(
          // height: 30,
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
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 8,
              ),
            ],
          )),
    );
  }
}
