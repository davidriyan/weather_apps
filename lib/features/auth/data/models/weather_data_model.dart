class WeatherData {
  final String celcius;

  WeatherData({required this.celcius});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      celcius: json['celcius'],
    );
  }
}
