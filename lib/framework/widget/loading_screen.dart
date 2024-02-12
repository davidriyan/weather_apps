import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:weather_apps/utils/colors.dart';
import 'package:weather_apps/utils/text_style.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.blueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height / 2),
            const SizedBox(
              height: 40,
              width: 40,
              child: LoadingIndicator(
                indicatorType: Indicator.lineSpinFadeLoader,
                colors: [Colors.white],
                strokeWidth: 2,
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Tunggu sebentar...',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
