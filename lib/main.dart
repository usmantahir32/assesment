import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/constants/theme.dart';
import 'package:task/pages/meal%20plan/meal_plan.dart';
import 'package:task/utils/size_config.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);

            return GetMaterialApp(
              theme: AppTheme().getTheme(),
              debugShowCheckedModeBanner: false,
              home: MealPlanScreen(),
            );
          },
        );
      },
    );
  }
}
