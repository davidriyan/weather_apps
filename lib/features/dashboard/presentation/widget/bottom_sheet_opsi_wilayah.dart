import 'package:flutter/material.dart';
import 'package:weather_apps/config/string_resources.dart';
import 'package:weather_apps/utils/colors.dart';
import 'package:weather_apps/utils/text_style.dart';

class BottomSheetOpsiWilayah extends StatelessWidget {
  const BottomSheetOpsiWilayah({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: size.height / 2,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Container(
                      width: size.width * 0.12,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(height: size.height / 4.5),
                    const Center(
                      child: Text('No data'),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Text(
        StringResources.TEXT_TITTLE_WILAYAH,
        style: whiteTextStyle.copyWith(
          fontSize: 18,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}
