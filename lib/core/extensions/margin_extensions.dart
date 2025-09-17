import 'package:flutter/material.dart';

extension NumberExtension on num {

  Widget get hBox => SizedBox(height: toDouble());


  Widget get wBox => SizedBox(width: toDouble());
}
