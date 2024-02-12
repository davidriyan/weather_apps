class TemperatureData {
  final String date;
  final String hour;
  final String celcius;
  final String fahrenheit;

  TemperatureData({
    required this.date,
    required this.hour,
    required this.celcius,
    required this.fahrenheit,
  });

  factory TemperatureData.fromJson(Map<String, dynamic> json) {
    return TemperatureData(
      date: json['date'],
      hour: json['hour'],
      celcius: json['celcius'],
      fahrenheit: json['fahrenheit'],
    );
  }
}
