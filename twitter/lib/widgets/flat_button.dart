import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomFlatButton({super.key, required this.label, required this.onPressed, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    const defaultStyle = TextStyle(
      fontFamily: 'Raleway',
      color: Colors.blue,
      height: 1,
    );

    final modifiedStyle = defaultStyle.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
    );

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: modifiedStyle
      ),
      child: Text(
        label
      )
    );
  }
}
