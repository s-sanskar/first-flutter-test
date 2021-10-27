import 'package:flutter/material.dart';

class Sections extends StatelessWidget {
  const Sections({
    Key? key,
    required this.child,
    required this.widthFull,
  }) : super(key: key);

  final Widget child;
  final double widthFull;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 1.0,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: (widthFull - 30.0) / 2.0,
          height: 220.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: child,
        ),
      ),
    );
  }
}
