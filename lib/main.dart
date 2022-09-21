

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ad_state.dart';
import 'package:flutter_application_1/constants/app_constants.dart';
import 'dart:io';
import 'package:flutter_application_1/widget/ortalama_hesapla_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:universal_io/io.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  print('OS: ${Platform.operatingSystem}');

  runApp(MyApp());
}
 
 class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
    title:'Dynamic Grade ',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Sabitler.anaRenk,
      visualDensity: VisualDensity.adaptivePlatformDensity 
    ),
    home:  OrtalamaHesaplaPage(),
    );
  }
}
