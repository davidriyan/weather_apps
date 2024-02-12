import 'package:flutter/material.dart';
import 'package:weather_apps/config/string_resources.dart';
import 'package:weather_apps/utils/colors.dart';
import 'package:weather_apps/utils/text_style.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blueColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  'assets/images/sun-cloud.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                StringResources.TEXT_ERROR_PAGE,
                style: whiteTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
