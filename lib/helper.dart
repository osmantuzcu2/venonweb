//Functions
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Toast message
//Toast.show('Toast plugin app', context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
final Color koyu = HexColor('#241635');
final Color yesil = HexColor('#45ff83');

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

//cihazın genişliğini al
double screenW(double wwidth, context) {
  return MediaQuery.of(context).size.width * wwidth;
}

//cihazın yüksekliğini al
double screenH(double hheight, context) {
  return MediaQuery.of(context).size.height * hheight;
}

//duration only hh:mm:nn
String formatDur(Duration d) => d.toString().split('.').first.padLeft(8, '0');

//exit
Widget areYouSure(context, String text, Function func) {
  return AlertDialog(
    title: Text('Emin misiniz?'),
    content: Text(text),
    actions: <Widget>[
      TextButton(
        onPressed: () => Get.back(),
        child: Text('Hayır'),
      ),
      TextButton(
        onPressed: () => func,
        child: Text('Evet'),
      ),
    ],
  );
}
