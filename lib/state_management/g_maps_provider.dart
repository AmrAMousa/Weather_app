import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMapsProvider with ChangeNotifier{
MapType _currntMapType =MapType.normal;

  MapType get currntMapType => _currntMapType;

  set currntMapType(MapType currntMapType) {
    _currntMapType = currntMapType;
    notifyListeners();
  }
}