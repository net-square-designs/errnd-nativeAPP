import 'package:errnd/app/pages/home_pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'routes.dart';

class Errnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Errnd',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(fontFamily: 'CircularStd'),
      home: new SplashScreen(),
      routes: routes,
    );
  }
}
