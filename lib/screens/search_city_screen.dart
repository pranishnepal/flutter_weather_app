import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/helpers/constants.dart';

class CitySearch extends StatefulWidget {
  @override
  _CitySearchState createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/searchBackground.jpg"),
                fit: BoxFit.fill)),
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Icon(Icons.arrow_back_ios),
                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 8.0, right: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    onChanged: (inputValue) {
                      cityName = inputValue;
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: textFieldStyler,
                  ),
                  FlatButton(
                      /* pop to home screen */
                      onPressed: () {
                        Navigator.pop(context, cityName);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 40.0),
                        child: Text(
                          "Get weather",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.habibi(
                            fontSize: 25.0,
                            color: Color(0xFF373737),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
