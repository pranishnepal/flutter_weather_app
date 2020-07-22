import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getLocation() async {
    try {
      Geolocator geoloc = Geolocator();
      geoloc.forceAndroidLocationManager = true;
      /* wait for the position before continuing */
      Position pos = await geoloc.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = pos.latitude;
      longitude = pos.longitude;
    } catch (e) {
      print(e);
    }
  }
}
