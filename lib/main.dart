import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ex/screens/home_screen.dart';
import 'package:flutter_ex/widgets/aztro_world.dart';
import 'package:flutter_ex/widgets/corona_meter.dart';
import 'package:flutter_ex/widgets/exchange_rate.dart';
import 'package:flutter_ex/widgets/nasa_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.pink[300]));
  runApp(ProviderScope(child: Home()),
  );
}



class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
      routes: {
        '/nasa': (context) => NasaScreen(),
        '/rates' : (context) => Exchange(),
        '/corona' : (context) => CoronaMeter(),
        '/astro' : (context) => AstroScreen(),
      },
    );
  }
}
