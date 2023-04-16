import 'package:flutter/material.dart';

//you can put your own api key here
String apiKey = '6e5ec4065caeae35bb484e47f7ad0ea6';

String darkModeBackGroundColorhex = '333739';

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
