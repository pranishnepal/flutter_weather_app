import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/helpers/weather_fetch.dart';
import 'package:weather_app/screens/search_city_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final dynamic decodedData;
  /* Constructor */
  HomeScreen(this.decodedData);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /* Varaibles */
  int temp;
  String cityName;
  String emoji;
  String tips;

  /* WeatherFetch object */
  WeatherFetch weatherObj = new WeatherFetch();
  @override
  void initState() {
    super.initState();
    updateData(widget.decodedData);
  }

  /* Render data */
  void updateData(dynamic weatherData) {
    setState(() {
      if (weatherData != null) {
        double tempDouble = weatherData['main']['temp'];
        /* temperature */
        temp = tempDouble.toInt();
        /* city name */
        cityName = weatherData['name'];
        int conditionCategory = weatherData['weather'][0]['id'];
        emoji = weatherObj.getEmoji(conditionCategory);
        tips = weatherObj.getTips(temp);
      } else {
        temp = 0;
        cityName = "Error Occured";
        tips = "Sorry, Try again later";
        emoji = ":(";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/background.jpg"), fit: BoxFit.fill),
      ),
      child: SafeArea(
          child: Column(
        children: <Widget>[
          /* Search Row */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: GestureDetector(
                  onTap: () async {
                    var cityName = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CitySearch();
                    }));
                    /* check for undefined */
                    if (cityName != null) {
                      var weatherCityData =
                          await weatherObj.getWeatherByName(cityName);
                      updateData(weatherCityData);
                    }
                  },
                  child: Icon(
                    Icons.search,
                    size: 35.0,
                  ),
                ),
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
              ),
              Container(
                /* Weather in current lcoation */
                child: GestureDetector(
                  onTap: () async {
                    dynamic currentLocationWeatherData =
                        await weatherObj.getWeatherByCoord();
                    updateData(currentLocationWeatherData);
                  },
                  child: Icon(
                    Icons.my_location,
                    size: 35.0,
                  ),
                ),
                margin: EdgeInsets.only(right: 10.0, top: 10.0),
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Column(
            children: <Widget>[
              Text("$cityName",
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 50.0, fontWeight: FontWeight.bold)),
              Text(
                DateFormat.yMMMMEEEEd().format(DateTime.now()),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 80.0,
          ),
          /* Temperature + Emoji */
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: <Widget>[
              Text("$temp°",
                  style: GoogleFonts.raleway(
                      fontSize: 100.0, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                emoji,
                style: TextStyle(fontSize: 90),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0),
            child: Text(
              tips,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                  fontSize: 40.0, color: Color.fromRGBO(240, 255, 255, 50)),
            ),
          ),
        ],
      )),
    ));
  }
}
