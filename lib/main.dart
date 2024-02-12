// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/features/auth/data/datasources/remote_datasources.dart';
import 'package:weather_apps/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:weather_apps/framework/routes/router.dart';
// import 'package:weather_apps/features/dashboard/presentation/screens/dashboard_screen.dart'; // Import DashboardScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final dataBloc = DashboardBloc(remoteDataSources: ApiService());
    return BlocProvider<DashboardBloc>(
      create: (context) => DashboardBloc(remoteDataSources: ApiService()),
      // dataBloc
      //   ..add(LoadTemperatureEvent())
      //   ..add(LoadWeatherEvent()),
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
