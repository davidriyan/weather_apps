import 'package:bloc/bloc.dart';
import 'package:weather_apps/features/auth/data/datasources/remote_datasources.dart';
import 'package:weather_apps/features/auth/data/models/temperature_data_model.dart';
import 'package:weather_apps/features/auth/data/models/weather_data_model.dart';

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

          final resultWeather = await remoteDataSources.getWeather();
          final weatherData =
              resultWeather.map((item) => WeatherData.fromJson(item)).toList();
          emit(TemperatureLoadedState(temperatureData, weatherData));
        } catch (error) {
          emit(DashboardErrorState());
        }
      },
    );
  }
}
