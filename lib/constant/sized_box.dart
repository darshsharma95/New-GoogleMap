import 'package:flutter/material.dart';

class SS {
  static SizedBox sB([double? h, double? w]) => SizedBox(height: h, width: w);

  static double h(BuildContext context) => MediaQuery.of(context).size.height;

  static double w(BuildContext context) => MediaQuery.of(context).size.width;
}
