import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.size,
    required this.onpressed,
    required this.redius,
    required this.title,
  }) : super(key: key);
  VoidCallback onpressed;
  final Size size;
  double redius;
  String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(redius)),
        fixedSize: size,
        elevation: 0,
      ),
      child: Text(
        title,
        // ignore: prefer_const_constructors
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 25,
        ),
      ),
    );
  }
}
