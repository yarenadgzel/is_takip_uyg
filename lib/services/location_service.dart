import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

Future<String> getLocation() async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  final coordinates = new Coordinates(position.latitude, position.longitude);
  var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
  var first = addresses.first;
  return first.toString();
}
