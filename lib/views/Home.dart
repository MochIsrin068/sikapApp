import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sikap/models/about_data.dart';
import 'package:sikap/models/chart_models.dart';
import 'package:sikap/utils/dashboard_provider.dart';
import 'package:sikap/utils/grafik_provider.dart';
import 'package:sikap/utils/markdown.dart';
import 'package:sikap/widget/Card.dart';
import 'package:sikap/widget/Chart.dart';
import 'package:sikap/widget/Swiper.dart';
import 'package:sikap/widget/card_loading.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pr = Provider.of<DashBoardProvider>(context);

    Widget sw() {
      return Container(
        child: Column(
          children: <Widget>[
            // getDataBagianKapal(context, sub: )
            getDataBagianKapal(context),
            SizedBox(
              height: 10,
            ),
            getDashBoard1(context),
            SizedBox(
              height: 10,
            ),
            getDashBoard2(context),
          ],
        ),
      );
    }

    Widget loading() {
      return Container(
        child: Column(
          children: <Widget>[
            // getDataBagianKapal(context, sub: )
            CardWidget(
              icon: Icons.timer,
              icColor: Colors.white,
              color: Colors.grey,
              title: 'Loading...',
              subtitle: 'Loading...',
            ),
            SizedBox(
              height: 10,
            ),
            CardWidget(
              icon: Icons.timer,
              icColor: Colors.white,
              color: Colors.grey,
              title: 'Loading...',
              subtitle: 'Loading...',
            ),
            SizedBox(
              height: 10,
            ),
            CardWidget(
              icon: Icons.timer,
              icColor: Colors.white,
              color: Colors.grey,
              title: 'Loading...',
              subtitle: 'Loading...',
            ),
          ],
        ),
      );
    }

    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                DrawerHeader(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.blueAccent,
                      Colors.lightBlue
                    ])),
                    child: Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("SIKAP",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20.0)),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text("Sistem Informasi Aktivitas Kapal Perikanan",
                            style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.0)),
                      ],
                    ))),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    FontAwesomeIcons.tachometerAlt,
                    size: 18.0,
                  ),
                  title: Text("Dashboard"),
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.lifeRing, size: 18.0),
                  title: Text("Tentang PPS"),
                  onTap: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.all(20.0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Tentang PPS"),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.close),
                              )
                            ],
                          ),
                          children: <Widget>[Text(aboutPPS)],
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.shieldAlt, size: 18.0),
                  title: Text("Tentang Aplikasi"),
                  onTap: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.all(20.0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Tentang Aplikasi"),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.close),
                              )
                            ],
                          ),
                          children: <Widget>[Text(aboutApp)],
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.sitemap, size: 18.0),
                  title: Text("Visi & Misi"),
                  onTap: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.all(20.0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Visi & Misi"),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.close),
                              )
                            ],
                          ),
                          children: <Widget>[
                            Text(
                              'Visi',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              visi,
                            ),
                            Text(
                              'Misi',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              misi,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.infoCircle, size: 18.0),
                  title: Text("Hubungi Kami"),
                  onTap: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.all(20.0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Hubungi Kami"),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.close),
                              )
                            ],
                          ),
                          children: <Widget>[
                            Text(hubungiKami),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.bell),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'PELABUHAN PERIKANAN SAMUDERA KENDARI',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    child: Divider(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),

            // /===========================

            FutureBuilder(
              future: _pr.getDashboardData(),
              builder: (_, snap) {
                if (snap.hasData) {
                  return sw();
                }
                return loading();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.pink,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                'GRAFIK KEDATANGAN DAN KEBERANGKATAN KAPAL TAHUN 2019',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: getDataArrivals(),
              builder: (context, s) {
                return s.data != null
                    ? FutureBuilder(
                        future: getDataDepatures(),
                        builder: (context, s2) {
                          if (s2.data != null) {
                            dataArrivalDepatures(
                                s.data["data"], s2.data["data"]);

                            return Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child:
                                  SimpleBarChart(ChartModel.createSampleData()),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      )
                    : Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 5.0,
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text("Kedatangan")
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 5.0,
                          backgroundColor: Colors.indigo,
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text("Keberangkatan")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.0)
          ],
        ),
      ),
    );
  }
}
