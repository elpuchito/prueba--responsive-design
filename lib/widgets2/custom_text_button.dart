import 'package:flutter/material.dart';

import 'constants.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomTextButton(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          Text(title, style: p),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward_rounded,
            size: 16,
          ),
        ],
      ),
    );
  }
}
