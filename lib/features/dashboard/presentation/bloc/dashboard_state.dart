part of 'dashboard_bloc.dart';

abstract class DashboardState {}

class BlocdashboardInitialState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class TemperatureLoadedState extends DashboardState {
  final List<TemperatureData> temperature;
  final List<WeatherData> weather;
  final List<WindDirectionData> windDirection;

  TemperatureLoadedState(
    this.temperature,
    this.weather,
    this.windDirection,
  );
}

class WeatherLoadedState extends DashboardState {}

class DashboardErrorState extends DashboardState {}
