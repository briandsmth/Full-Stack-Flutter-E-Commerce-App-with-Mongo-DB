import 'package:flutter/material.dart';

String uri = 'http://192.168.226.68:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 17, 153, 142),
      Color.fromARGB(255, 56, 239, 125),

      // Color.fromARGB(255, 201, 98, 29),
      // Color.fromARGB(255, 202, 138, 18),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromARGB(255, 54, 211, 23);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/electronics.png',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essential.png',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliance.png',
    },
    {
      'title': 'Books',
      'image': 'assets/images/book.png',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.png',
    },
  ];
}
