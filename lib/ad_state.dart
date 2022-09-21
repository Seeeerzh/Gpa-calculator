import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {

  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9477473156057606/6574030795";
    } 
     else {
      throw UnsupportedError("Unsupported platform");
    }

  }

  static String? get nativeAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9477473156057606~2719095003";
    }else {
      throw UnsupportedError("Unsupported platform");
    }
  }

static final BannerAdListener bannerAdListener=BannerAdListener(
  onAdLoaded: (ad) => debugPrint('Ad loaded'),
  onAdFailedToLoad: (ad, error) {
    ad.dispose();
    debugPrint('Ad failed to load: $error');
  },
  onAdOpened: (ad) =>debugPrint('Ad opened'), 
  onAdClosed: (ad) => debugPrint('Ad closed'),
);
}