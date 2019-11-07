import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sikap/utils/dashboard_provider%20copy.dart';
import 'package:sikap/utils/dashboard_provider.dart';
import 'package:sikap/utils/kapal_provider.dart';
import 'package:sikap/utils/keberangkatan_provider.dart';
import 'package:sikap/utils/kedatangan_provider.dart';
import 'package:sikap/views/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins',
        ),
        home: MultiProvider(
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
        ));
  }
}
