import 'package:weather_app/helpers/constants.dart';
import 'package:weather_app/helpers/fetch_data.dart';
import 'package:weather_app/helpers/location.dart';

const weatherMapURLFirstPart =
    "https://api.openweathermap.org/data/2.5/weather";

class WeatherFetch {
  Future<dynamic> getWeatherByCoord() async {
    /* fetch location */
    Location location = new Location();
    await location.getLocation();
    /* Fetch Data */
    FetchData fetchData = new FetchData(
        "$weatherMapURLFirstPart?lat=${location.latitude}&lon=${location.longitude}&appid=$openWeatherMapKey&units=metric");

    /* dynamic json return */
    var decodedData = await fetchData.getData();
    return decodedData;
  }

  Future<dynamic> getWeatherByName(String cityName) async {
    /* Fetch Data */
    FetchData fetchData = new FetchData(
        "$weatherMapURLFirstPart?q=$cityName&appid=$openWeatherMapKey&units=metric");

    /* dynamic json return */
    var decodedData = await fetchData.getData();
    return decodedData;
  }

  /* Emoji Generator */
  String getEmoji(int condition) {
    if (condition < 300) {
      return '🌩️';
    } else if (condition < 400) {
      return '🌧️';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '❄️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '😵‍';
    }
  }

  /* Tips */
  String getTips(int temp) {
    if (temp > 25) {
      return "Head to the beach 🍦 🏖️";
    } else if (temp > 20) {
      return "Pretty weather 😻";
    } else if (temp < 10) {
      return "Wear your 🧣";
    } else {
      return "Bring your coat 🧥";
    }
  }
}
