import 'package:flutter/material.dart';

class ElevatorButton extends StatelessWidget {
  final int buttonTitle;
  final Function() onPressed;
  final double? height;
  final double? width;
  const ElevatorButton(
      {Key? key,
      required this.buttonTitle,
      required this.onPressed,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60,
      width: width ?? 60,
      color: Colors.red,
      padding: const EdgeInsets.all(10),
      child: TextButton(
        child: Text(
          buttonTitle.toString(),
          style: const TextStyle(fontSize: 25, color: Colors.black),
        ),
        onPressed: onPressed,
        style: TextButton.styleFrom(
          elevation: 2,
          backgroundColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}
