/* renders until the data is ready to be processed */
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/helpers/location.dart';
import 'package:weather_app/helpers/weather_fetch.dart';
import 'package:weather_app/screens/home_screen.dart';

class SpinnerScreen extends StatefulWidget {
  @override
  _SpinnerScreenState createState() => _SpinnerScreenState();
}

class _SpinnerScreenState extends State<SpinnerScreen> {
  /* Location object */
  Location location = new Location();

  @override
  void initState() {
    super.initState();
    getLocationAndInitialWeather();
  }

  void getLocationAndInitialWeather() async {
    WeatherFetch weather = new WeatherFetch();
    var dataDecoded = await weather.getWeatherByCoord();
    //print(dataDecoded['name']);
    /* Display home screen when data is ready */
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(dataDecoded);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitDualRing(color: Colors.white),
    );
  }
}
