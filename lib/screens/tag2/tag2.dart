import 'package:flutter/material.dart';

class Tag2 extends StatelessWidget {
  final Color? color;
  final String title;
  const Tag2({Key? key, this.color, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.white,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
