class Weather {
  String condition;
  num temperature;
  num feelsLike;
  num pressure;
  num visibility;
  String description;
  String humidity;
  num windSpeed;
  String country;
  String name;
  String icon;

  Weather({
    required this.description,
    required this.condition,
    required this.temperature,
    required this.feelsLike,
    required this.visibility,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.country,
    required this.name,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      condition: json['weather'][0]['main'],
      temperature: (json['main']['temp']).round(),
      feelsLike: (json['main']['feels_like']).round(),
      visibility: (json['visibility'] / 1000).round(),
      pressure: (json['main']['pressure']),
      humidity: json['main']['humidity'].toString(),
      windSpeed: (json['wind']['speed'] * 3.6),
      country: json['sys']['country'],
      name: json['name'],
      icon: json['weather'][0]['icon'],
    );
  }
}
