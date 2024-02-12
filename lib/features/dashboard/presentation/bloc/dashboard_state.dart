part of 'dashboard_bloc.dart';

abstract class DashboardState {}

class BlocdashboardInitialState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class TemperatureLoadedState extends DashboardState {
  final List<TemperatureData> temperature;
  final List<WeatherData> weather;

  TemperatureLoadedState(this.temperature, this.weather);
}

class WeatherLoadedState extends DashboardState {
  // WeatherLoadedState(this.weather);
}

class DashboardErrorState extends DashboardState {
  // final String error;

  // DashboardErrorState(this.error);
}
