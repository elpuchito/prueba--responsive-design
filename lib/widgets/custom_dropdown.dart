import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  final String initialValue;
  final List<String> items;

  const CustomDropDownMenu(
      {Key? key, required this.initialValue, required this.items})
      : super(key: key);
  @override
  _CustomDropDownMenuState createState() =>
      _CustomDropDownMenuState(initialValue: initialValue, items: items);
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  final String initialValue;
  final List<String> items;

  _CustomDropDownMenuState({required this.initialValue, required this.items});
  @override
  Widget build(BuildContext context) {
    String dropdownValue = initialValue;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(3)),
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButton<String>(
          underline: SizedBox(),
          value: dropdownValue,
          isExpanded: true,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.grey),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
