import 'package:flutter/material.dart';
import 'package:flutter_customer_app/splashscreen.dart';
import 'package:flutter_customer_app/colors/AppColors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'network/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color =
    {
      50:Color.fromRGBO(184, 4, 46, 0.10196078431372549),
      100:Color.fromRGBO(184, 4, 58, 0.2),
      200:Color.fromRGBO(184, 4, 58, 0.30196078431372547),
      300:Color.fromRGBO(184, 4, 58, 0.4),
      400:Color.fromRGBO(184, 4, 46, 0.5019607843137255),
      500:Color.fromRGBO(184, 4, 46, 0.6),
      600:Color.fromRGBO(184, 4, 46, 0.7019607843137254),
      700:Color.fromRGBO(184, 4, 52, 0.8),
      800:Color.fromRGBO(184, 4, 46, 0.9019607843137255),
      900:Color.fromRGBO(184, 4, 46, 1.0),
    };


    AppColors appColors=AppColors();
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Provider<ApiService>(
          create: (context) => ApiService.create(),
          child:MaterialApp(
            title: 'Flutter Demo',
            theme: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: const Color(0xFFFF0749),
              ),
            ),
            home:  SplashScreen(),
          ),

        );

      },
      maxTabletWidth: 900, // Optional
    );
 }
}


