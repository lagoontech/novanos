import 'package:flutter/material.dart';

import 'colors.dart';

LinearGradient kWelcomeBackgroundGradient = const LinearGradient(
  begin: Alignment(-0.7458379864692688, -0.05771365016698837),
  end: Alignment(0.05771365016698837, -0.05470772832632065),
  colors: [Color.fromRGBO(146, 163, 253, 1), Color.fromRGBO(157, 206, 255, 1)],
);

LinearGradient kWelcomeTextGradient = LinearGradient(colors: [
  Colors.blue.shade400,
  Colors.blue.shade900,
]);

LinearGradient kBackgroundGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6bad7e),
      Color(0xFF1c4f5f),
    ]);
