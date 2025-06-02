import 'package:flutter/material.dart';
import 'package:myapp/app.dart';
import 'package:myapp/service_locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(App());
}