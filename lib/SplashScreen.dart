import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_customer_app/LoginByMobile.dart';
import 'package:flutter_customer_app/LoginPage.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginByMobile(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assests/images/loginscreen.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: MediaQuery.of(context).size.height / 3.5),
              Container(
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Welcome to Paisalo Digital",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 10,),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "अर्थ: समाजस्य न्यास:",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        )),

                    SizedBox(height: 30,),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width /1.3,
                          child: Text(
                            "Wealth – Worldly Things – Society Trust \n Thus, wealth owned by Paisalo Digital Limited id Trust property of Society",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),textAlign: TextAlign.center,
                          ),
                        )),
                  ],
                ),
              )

,
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  elevation: 6,
                  child: Container(height: 40,
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  child: Text("Get Started",style: TextStyle(color: Colors.red,fontSize: 17,fontWeight: FontWeight.bold),),
                  color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
