import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_customer_app/loginbymobile.dart';
import 'package:flutter_customer_app/loginpage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'loginbyloan.dart';


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
          builder: (context) => LoginByLoan(),
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
              image: AssetImage("assests/images/cust_splashback.png"),
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
                              fontSize: 22.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 10,),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "अर्थ: समाजस्य न्यास:",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        )),

                    const SizedBox(height: 30,),
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width /1.3,
                          child: Text(
                            "Wealth – Worldly Things – Society Trust \n Thus, wealth owned by Paisalo Digital Limited id Trust property of Society",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),textAlign: TextAlign.center,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 9,vertical: 10),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50.0,
                      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () async {

                      },
                      child: Text("Get Started",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red,fontSize: 18.sp,fontWeight: FontWeight.bold)),
                    ),
                  )
              ),

              /*Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 6,
                  child: Container(height: Adaptive.h(6.5),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  child: Text("Get Started",style: TextStyle(color: Colors.red,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                  color: Colors.white),
                ),
              )*/
            ],
          )),
    );
  }
}
