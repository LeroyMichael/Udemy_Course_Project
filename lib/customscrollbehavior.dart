//Class custom behavior agar efek scroll secara default tidak tampil
//File ini tidak perlu dimodifikasi
import 'package:flutter/material.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}