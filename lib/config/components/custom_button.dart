// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.bgColor,
    required this.onTap,
    required this.enableBorder,
    required this.borderColor,
    required this.titleColor,
  });
  final double height;
  final double width;
  final String title;
  final Color bgColor;
  final VoidCallback onTap;
  final bool enableBorder;
  final Color borderColor;
  final Color titleColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
          border: enableBorder
              ? Border.all(
                  color: enableBorder ? borderColor : bgColor,
                )
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: titleColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
