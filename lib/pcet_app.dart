import 'package:flutter/material.dart';
import 'package:pcet_placements/presentation/auth/widgets/authentication_page.dart';
import 'package:pcet_placements/presentation/theme/app_colors.dart';

class PCETApp extends StatelessWidget {
  const PCETApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.mercury,
        primaryColor: AppColors.casablanca,
      ),
      home: const SafeArea(
        child: AuthenticationPage(),
      ),
    );
  }
}
