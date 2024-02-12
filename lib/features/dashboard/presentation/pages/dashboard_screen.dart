import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:weather_apps/config/string_resources.dart';
import 'package:weather_apps/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:weather_apps/framework/routes/pages/error.dart';
import 'package:weather_apps/framework/widget/loading_screen.dart';
import 'package:weather_apps/utils/colors.dart';
import 'package:weather_apps/utils/text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(LoadTemperatureEvent());
    // BlocProvider.of<DashboardBloc>(context).add(LoadWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoadingState) {
          return const LoadingScreen();
        }
        if (state is TemperatureLoadedState) {
          final dataTemperature = state.temperature;
          final dataSuhu = state.weather;
          return Scaffold(
            backgroundColor: AppColors.blueColor,
            appBar: AppBar(
              forceMaterialTransparency: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/icon-map.svg'),
                    const SizedBox(width: 10),
                    InkWell(
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
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset('assets/icons/bottom-arrow.svg'),
                  ],
                ),
              ),
              elevation: 0,
            ),
            body: Container(
              color: AppColors.blueColor,
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 187,
                        width: 284,
                        child: Image.asset(
                          'assets/images/sun-cloud.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      //! Fitur temperature
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataSuhu[0].celcius,
                            style: whiteTextStyle.copyWith(
                              fontSize: 64,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            'o',
                            style: whiteTextStyle.copyWith(
                              fontSize: 34,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        StringResources.TEXT_PRECIPITATION,
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: regular,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringResources.TEXT_MAX_TEMPERATURE,
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: regular,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            StringResources.TEXT_MIN_TEMPERATURE,
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: regular,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25),
                      //! Fitur temperature, kecepatan angin, kelembapan
                      Container(
                        height: 47,
                        width: size.width / 1.2,
                        decoration: BoxDecoration(
                          color: AppColors.blueSecondColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //! kelembapan
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/icon-kelembapan.svg'),
                                const SizedBox(width: 5),
                                Text(
                                  '18%',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: bold,
                                  ),
                                )
                              ],
                            ),
                            //! temperature
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/icon-temperature.svg'),
                                const SizedBox(width: 5),
                                Text(
                                  '67%',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: bold,
                                  ),
                                )
                              ],
                            ),
                            //! kecepatan angin
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/icon-angin.svg'),
                                const SizedBox(width: 5),
                                Text(
                                  '18 km/h',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      //! fitur rincian Kelembapan per jamnya
                      Container(
                        height: 217,
                        width: size.width / 1.2,
                        decoration: BoxDecoration(
                          color: AppColors.blueSecondColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15,
                            bottom: 18,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Today',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  Text(
                                    dataTemperature[0].date.toString(),
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: regular,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '${dataTemperature[0].celcius}°C',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: regular,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      SizedBox(
                                        width: 43,
                                        height: 43,
                                        child: SvgPicture.asset(
                                            'assets/icons/icon-cloud.svg'),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        dataTemperature[0].hour,
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: regular,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${dataTemperature[1].celcius}°C',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: regular,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      SizedBox(
                                        width: 43,
                                        height: 43,
                                        child: SvgPicture.asset(
                                            'assets/icons/icon-cloud.svg'),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        dataTemperature[1].hour,
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: regular,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${dataTemperature[2].celcius}°C',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: regular,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      SizedBox(
                                        width: 43,
                                        height: 43,
                                        child: SvgPicture.asset(
                                            'assets/icons/icon-cloud.svg'),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        dataTemperature[2].hour,
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: regular,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${dataTemperature[3].celcius}°C',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: regular,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      SizedBox(
                                        width: 43,
                                        height: 43,
                                        child: SvgPicture.asset(
                                            'assets/icons/icon-cloud.svg'),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        dataTemperature[3].hour,
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: regular,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      //! Fitur Next Forecast
                      const SizedBox(height: 20),
                      Container(
                        height: 217,
                        width: size.width / 1.2,
                        decoration: BoxDecoration(
                          color: AppColors.blueSecondColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15,
                            bottom: 15,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringResources.TEXT_PRAKIRAAN_BERIKUTNYA,
                                    overflow: TextOverflow.ellipsis,
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  SvgPicture.asset('assets/icons/calender.svg')
                                ],
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Monday',
                                    overflow: TextOverflow.ellipsis,
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  Text(
                                    'Rainly',
                                    overflow: TextOverflow.ellipsis,
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: light,
                                    ),
                                  ),
                                  Text(
                                    '31\u00B0C',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: regular,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tuesday',
                                    overflow: TextOverflow.ellipsis,
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  Text(
                                    'Rainly',
                                    overflow: TextOverflow.ellipsis,
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: light,
                                    ),
                                  ),
                                  Text(
                                    '17\u00B0C',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: regular,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
                ],
              ),
            ),
          );
        } else if (state is DashboardErrorState) {
          return const ErrorScreen();
        }
        return const SizedBox();
      },
    );
  }
}
