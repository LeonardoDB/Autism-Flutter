import 'package:Autismo/ui/android/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _enableRotation();
    return MaterialApp(
      title: 'Autismo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

void _enableRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  StatusBarAnimation _statusBarAnimation = StatusBarAnimation.NONE;
  FlutterStatusbarManager.setHidden(true, animation: _statusBarAnimation);
}
