import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sikap/models/card_data.dart';
import 'package:sikap/utils/dashboard_provider%20copy.dart';
import 'package:sikap/utils/dashboard_provider.dart';
import 'package:sikap/utils/kapal_provider.dart';
import 'package:sikap/utils/keberangkatan_provider.dart';
import 'package:sikap/utils/kedatangan_provider.dart';
import 'package:sikap/widget/Card.dart';
import 'package:intl/intl.dart';

CardData cardData = CardData();

Widget getDataBagianKapal(BuildContext context) {
  final kapalModel = Provider.of<KapalProvider>(context);
  final kedatanganModel = Provider.of<KedatanganProvider>(context);
  final keberangkatanModel = Provider.of<KeberangkatanProvider>(context);
  final dashBoardProvider = Provider.of<DashBoardProvider>(context);

  return Container(
    height: 120,
    // width: 200,
    child: Swiper(
      layout: SwiperLayout.TINDER,
      itemHeight: 160,
      itemWidth: 370,
      autoplay: true,
      autoplayDelay: 10000,
      itemCount: cardData.dataKapal.length,
      itemBuilder: (context, id) {
        String idCard = cardData.dataKapal[id]['id'];
        Color bgcolors;
        Color icColors;
        IconData icon;
        String subtitle;
        Future<dynamic> future;
        final formatter = new NumberFormat("#,###", "en_US");

        switch (idCard) {
          case 'k1':
            bgcolors = Color(0xFFF39C12);
            icColors = Color(0xFFC27D0E);
            icon = FontAwesomeIcons.ship;
            future = kapalModel.getDataKapal();
            subtitle = kapalModel.datakapal.length.toString();
            break;
          case 'k2':
            bgcolors = Color(0xFF00A65A);
            icColors = Color(0xFF008548);
            icon = FontAwesomeIcons.compressArrowsAlt;
            future = kedatanganModel.getKedatangan();

            subtitle = kedatanganModel.kedatangan.length.toString();

            break;
          case 'k3':
            bgcolors = Color(0xFF3C8DBC);
            icColors = Color(0xFF307196);
            icon = FontAwesomeIcons.expandArrowsAlt;
            future = keberangkatanModel.getKeberangkatan();

            subtitle = formatter
                .format(keberangkatanModel.keberangkatan.length)
                .toString();
            break;
          case 'k4':
            bgcolors = Color(0xFFD81B60);
            icColors = Color(0xFFAD164D);
            icon = FontAwesomeIcons.anchor;
            future = kapalModel.getDataKapal();

            subtitle = formatter
                .format((kedatanganModel.kedatangan.length +
                    keberangkatanModel.keberangkatan.length))
                .toString();
            break;
          case 'k5':
            bgcolors = Color(0xFFFF851B);
            icColors = Color(0xFFCC6A16);
            icon = FontAwesomeIcons.ship;
            subtitle = dashBoardProvider.dashboard[3]['isi'];
            future = dashBoardProvider.getDashboardData();
            break;
          default:
            bgcolors = Colors.white;
        }

        return FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CardWidget(
                  icon: icon,
                  icColor: icColors,
                  color: bgcolors,
                  title: cardData.dataKapal[id]['title'],
                  subtitle: subtitle,
                );
              }
              return CardWidget(
                icon: icon,
                icColor: icColors,
                color: bgcolors,
                title: cardData.dataKapal[id]['title'],
                subtitle: 'Loading...',
              );
            });
      },
    ),
  );
}

Widget getDashBoard1(BuildContext context) {
  final dashBoardProvider = Provider.of<DashBoardProvider>(context);
  final ikanData = Provider.of<IkanProvider>(context);

  return Container(
    height: 120,
    // width: 200,
    child: Swiper(
      layout: SwiperLayout.TINDER,
      itemHeight: 160,
      itemWidth: 370,
      autoplay: true,
      autoplayDelay: 6000,
      itemCount: cardData.dataProduksi.length,
      itemBuilder: (BuildContext context, int id) {
        String idCard = cardData.dataProduksi[id]['id'];
        Color bgcolors;
        Color icColors;
        IconData icon;
        String subtitle;
        Future<dynamic> future = ikanData.getIkanData();
        final formatter = new NumberFormat("#,###", "en_US");
        switch (idCard) {
          case 'p2':
            bgcolors = Color(0xFF3D9970);
            icColors = Color(0xFF317A5A);
            icon = FontAwesomeIcons.rss;
            subtitle = 'Rp ' + dashBoardProvider.dashboard[8]['isi'];
            future = dashBoardProvider.getDashboardData();
            break;
          case 'p1':
            bgcolors = Color(0xFF001F3F);
            icColors = Color(0xFF001932);
            icon = FontAwesomeIcons.moneyBillAlt;
            subtitle = 'Rp ' + dashBoardProvider.dashboard[9]['isi'];
            future = dashBoardProvider.getDashboardData();

            break;
          case 'p3':
            bgcolors = Color(0xFF0073B7);
            icColors = Color(0xFF005C92);
            icon = FontAwesomeIcons.fish;
            future = ikanData.getIkanData();
            subtitle = ikanData.ikan[0]['total_ikan'] == 0
                ? ''
                : formatter
                        .format(double.parse(ikanData.ikan[0]['total_ikan'])) +
                    ' KG';
            future = dashBoardProvider.getDashboardData();
            break;
          case 'p4':
            bgcolors = Color(0xFF605CA8);
            icColors = Color(0xFF4D4A86);
            icon = FontAwesomeIcons.users;
            subtitle = dashBoardProvider.dashboard[4]['isi'] + ' Orang';
            future = dashBoardProvider.getDashboardData();

            break;
          default:
            bgcolors = Colors.white;
        }
        return FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CardWidget(
                  color: bgcolors,
                  icColor: icColors,
                  icon: icon,
                  title: cardData.dataProduksi[id]['title'],
                  subtitle: subtitle,
                );
              }
              return CardWidget(
                color: bgcolors,
                icColor: icColors,
                icon: icon,
                title: cardData.dataProduksi[id]['title'],
                subtitle: 'Loading...',
              );
            });
      },
    ),
  );
}

Widget getDashBoard2(BuildContext context) {
  final dashBoardProvider = Provider.of<DashBoardProvider>(context);
  return Container(
    height: 120,
    // width: 200,
    child: Swiper(
      layout: SwiperLayout.TINDER,
      itemHeight: 160,
      itemWidth: 370,
      autoplay: true,
      autoplayDelay: 6000,
      itemCount: cardData.dataPenyaluran.length,
      itemBuilder: (BuildContext context, int id) {
        String idCard = cardData.dataPenyaluran[id]['id'];
        Color bgcolors;
        Color icColors;
        IconData icon;
        String subtitle;
        Future<dynamic> future = dashBoardProvider.getDashboardData();

        switch (idCard) {
          case 'pe1':
            bgcolors = Color(0xFFDD4B39);
            icColors = Color(0xFFB13C2E);
            icon = FontAwesomeIcons.tint;
            subtitle = dashBoardProvider.dashboard[5]['isi'] + ' KL';
            break;
          case 'pe2':
            bgcolors = Color(0xFFDB0EAD);
            icColors = Color(0xFFAF0B8A);
            icon = FontAwesomeIcons.icicles;
            subtitle = dashBoardProvider.dashboard[6]['isi'];
            break;
          case 'pe3':
            bgcolors = Color(0xFF00A65A);
            icColors = Color(0xFF008548);
            icon = FontAwesomeIcons.gasPump;
            subtitle = dashBoardProvider.dashboard[7]['isi'] + ' KL';
            break;
            break;
          default:
            bgcolors = Colors.white;
        }
        return FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CardWidget(
                  color: bgcolors,
                  icColor: icColors,
                  icon: icon,
                  title: cardData.dataPenyaluran[id]['title'],
                  subtitle: subtitle,
                );
              }
              return CardWidget(
                color: bgcolors,
                icColor: icColors,
                icon: icon,
                title: cardData.dataPenyaluran[id]['title'],
                subtitle: 'Loading...',
              );
            });
      },
    ),
  );
}
