import 'package:flutter/material.dart';

class TextForBtnComponent extends StatelessWidget {
  final String textContent;
  const TextForBtnComponent({Key key, @required this.textContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    textContent,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black),
  );
}
