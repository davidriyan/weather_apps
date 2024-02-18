import 'package:bloc/bloc.dart';
import 'package:weather_apps/features/auth/data/datasources/remote_datasources.dart';
import 'package:weather_apps/features/auth/data/models/temperature_data_model.dart';
import 'package:weather_apps/features/auth/data/models/weather_data_model.dart';
import 'package:weather_apps/features/auth/data/models/wind_direction_data.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<BlocdashboardEvent, DashboardState> {
  final ApiService remoteDataSources;
  DashboardBloc({required this.remoteDataSources})
      : super(BlocdashboardInitialState()) {
    on<LoadTemperatureEvent>(
      (event, emit) async {
        emit(DashboardLoadingState());
        try {
          final resultTemperature = await remoteDataSources.getTemperature();
          final temperatureData = resultTemperature
              .map((item) => TemperatureData.fromJson(item))
              .toList();

          final resultMaxWeather = await remoteDataSources.getMaxWeather();
          final weatherData = resultMaxWeather
              .map((item) => WeatherData.fromJson(item))
              .toList();

          final resultWindSpeed = await remoteDataSources.getWindSpeed();
          final windSpeedData = resultWindSpeed
              .map((item) => WindDirectionData.fromJson(item))
              .toList();

          emit(
            TemperatureLoadedState(
              temperatureData,
              weatherData,
              windSpeedData,
            ),
          );
        } catch (error) {
          emit(DashboardErrorState());
        }
      },
    );
  }
}
