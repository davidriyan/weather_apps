import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:weather_apps/config/string_resources.dart';
import 'package:weather_apps/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:weather_apps/features/dashboard/presentation/widget/bottom_sheet_opsi_wilayah.dart';
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
    pageController = PageController();
    BlocProvider.of<DashboardBloc>(context).add(LoadTemperatureEvent());
    // BlocProvider.of<DashboardBloc>(context).add(LoadWeatherEvent());
  }

  int currentIndex = 0;
  late PageController pageController;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
          final dataArahMataAngin = state.windDirection;
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
                    BottomSheetOpsiWilayah(size: size),
                    const SizedBox(width: 10),
                    SvgPicture.asset('assets/icons/bottom-arrow.svg'),
                  ],
                ),
              ),
              elevation: 0,
            ),
            body: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              children: [
                Container(
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
                                dataSuhu[1].celcius,
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
                                    SvgPicture.asset(
                                        'assets/icons/icon-angin.svg'),
                                    const SizedBox(width: 5),
                                    Text(
                                      dataArahMataAngin[1].deskripsi,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        dataTemperature[4].date,
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: regular,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '${dataTemperature[4].celcius}°C',
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
                                            dataTemperature[4].hour,
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
                                            '${dataTemperature[6].celcius}°C',
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
                                            dataTemperature[5].hour,
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
                                            '${dataTemperature[5].celcius}°C',
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
                                            dataTemperature[6].hour,
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
                                            '${dataTemperature[7].celcius}°C',
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
                                            dataTemperature[7].hour,
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
                                        StringResources
                                            .TEXT_PRAKIRAAN_BERIKUTNYA,
                                        overflow: TextOverflow.ellipsis,
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: bold,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                          'assets/icons/calender.svg')
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
                //! page kedua
                Container(
                  color: Colors.red,
                ),
              ],
            ),
            bottomNavigationBar: BottomNavyBar(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              backgroundColor: AppColors.blueColor,
              showElevation: false,
              items: [
                BottomNavyBarItem(
                  activeColor: AppColors.blueSecondColor,
                  icon: const Icon(
                    Icons.home,
                    color: AppColors.whiteColor,
                  ),
                  title: const Text(
                    'Cuaca',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
                BottomNavyBarItem(
                  activeColor: AppColors.blueSecondColor,
                  icon: const Icon(
                    Icons.account_balance_sharp,
                    color: AppColors.whiteColor,
                  ),
                  title: const Text(
                    'Gempa',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                )
              ],
              selectedIndex: currentIndex,
              onItemSelected: (index) {
                setState(() => currentIndex = index);
                pageController.jumpToPage(index);
              },
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
