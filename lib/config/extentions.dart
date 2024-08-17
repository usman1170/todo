import 'package:flutter/material.dart';

extension IntExtension on int? {
  Object validate({int value = 0}) {
    return this ?? int;
  }

  Widget get h => SizedBox(
        height: this!.toDouble(),
      );

  Widget get w => SizedBox(
        width: this!.toDouble(),
      );
}
