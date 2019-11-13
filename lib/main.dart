import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikap/utils/dashboard_provider%20copy.dart';
import 'package:sikap/utils/dashboard_provider.dart';
import 'package:sikap/utils/kapal_provider.dart';
import 'package:sikap/utils/keberangkatan_provider.dart';
import 'package:sikap/utils/kedatangan_provider.dart';
import 'package:sikap/views/Home.dart';

// void main() => runApp(SplahScreen());
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
        title: 'Sistem Informasi PPS Kendari',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins',
        ),
  home: SplahScreen(),
  
));

class SplahScreen extends StatefulWidget {
  @override
  _SplahScreenState createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage(){
    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => MyApp()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/splash.jpg'),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider<KapalProvider>(
                builder: (_) => KapalProvider()),
            ChangeNotifierProvider<KedatanganProvider>(
                builder: (_) => KedatanganProvider()),
            ChangeNotifierProvider<KeberangkatanProvider>(
                builder: (_) => KeberangkatanProvider()),
            ChangeNotifierProvider<DashBoardProvider>(
                builder: (_) => DashBoardProvider()),
            ChangeNotifierProvider<IkanProvider>(
                builder: (_) => IkanProvider()),
          ],
          child: Home(),
        );
  }
}
