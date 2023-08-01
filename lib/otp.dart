import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customer_app/otppages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'const/common.dart';
import 'dashboard.dart';
import 'network/api_service.dart';

class OtpVerify extends StatefulWidget {
  //const OtpVerify({Key? key}) : super(key: key);
  final int _Id;
  const OtpVerify(this._Id);

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  var  _MobileNumberBlock=false;
  var  _LoanNumberBlock=true;
  OtpFieldController otpController = OtpFieldController();
  TextEditingController loanController = TextEditingController();
  String _Otp="";
  CommonAction commonAlert= CommonAction();
  String? _currentAddress;
  Position? _currentPosition;
  bool _loanlayout=true;
  bool _mobilelayout=false;

  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      if(text.length<4){
        text = text + value;
      }

    });
  }

  TextStyle defaultStyle = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.grey,fontSize: 15.sp),
  );
  TextStyle defaultStyleLogin = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 16.sp),
  );
  TextStyle linkStyle = TextStyle(color: Colors.blue, decoration: TextDecoration.underline,);
  TextStyle linkStyleOtp = TextStyle(color: Colors.redAccent, decoration: TextDecoration.underline,);

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
        print(_currentAddress);
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // _getCurrentPosition();
  }


  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: Adaptive.h(6.5),
        width: 12.w,
        decoration: BoxDecoration(
            color: Colors.black12,
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: const Center(child: Text("", style: TextStyle(color: Colors.black),)),
      );
    } catch (e) {
      return Container(
        height: Adaptive.h(6.5),
        width: 12.w,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
      );
    }
  }

  //////////////////  Match Loan  //////////////////////
  Future<Null> matchLoan(String loanNo) async {
    // print(mobileController.text.toString());
    EasyLoading.show(status: 'Loading');
    final api = Provider.of<ApiService>(context, listen: false);
    return await api
        .loanMapped("${widget._Id}",loanNo)
        .then((result) {
      setState(() {
        EasyLoading.dismiss();
        if(result.statusCode==200){
          Navigator.pushReplacement(
              context,MaterialPageRoute(
            builder: (context) => Dashboard(widget._Id,loanNo),));
        }else{
          commonAlert.messageAlertError(context,"Loan number not exists. Please try again","Error");
        }

      });
    }).catchError((error) {
      EasyLoading.dismiss();
      print(error);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assests/images/logintopback.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: Container(
                              height: Adaptive.h(10),
                              // constraints: const BoxConstraints(maxHeight: Adaptive.h(12.5)),
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: Image.asset('assests/images/paisalo_white_logo.png')),
                        ),
                      ),
                ),

                Expanded(
                  flex: 2,
                  child:Column(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 10,
                        margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
                        child:Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                                child:Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Enter Loan Number',
                                          style: GoogleFonts.rubik(
                                            textStyle:TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold),
                                          ),
                                          //TextStyle(color: Colors.black,fontSize: 18.sp,fontFamily:'Abel'),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                      height: 6.h,
                                      child:CupertinoTextField(
                                        controller: loanController,
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        decoration: const BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius: BorderRadius.all(Radius.circular(5))
                                        ),
                                        clearButtonMode: OverlayVisibilityMode.editing,
                                        // keyboardType: TextInputType.phone,
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 17.sp),
                                        placeholder: '',
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius: BorderRadius.circular(5.0),
                                          color: Color(0xFFFF0741),
                                          child: MaterialButton(
                                            minWidth: MediaQuery.of(context).size.width,
                                            height: 6.h,
                                            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                            onPressed: () async {
                                              matchLoan(loanController.text);
                                            },
                                            child: Text("SUBMIT",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.rubik(
                                                textStyle:TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),
                                              ),

                                            ),
                                          ),
                                        )
                                    ),
                                    SizedBox(height: 40,),
                                    // const SizedBox(height: 10,),
                                    // Column(
                                    //   children: [
                                    //     Text('We have sent 4 digits verification code on registered number.', style: defaultStyleLogin)
                                    //   ],
                                    // ),
                                    // const SizedBox(height: 50,),
                                    // Center(
                                    //   child: OTPTextField(
                                    //       controller: otpController,
                                    //       length: 4,
                                    //       width: MediaQuery.of(context).size.width,
                                    //       textFieldAlignment: MainAxisAlignment.spaceEvenly,
                                    //       fieldWidth: 70,
                                    //       fieldStyle: FieldStyle.box,
                                    //       outlineBorderRadius: 10,
                                    //       style: const TextStyle(fontSize: 17),
                                    //       onChanged: (pin) {
                                    //         print("Changed: " + pin);
                                    //       },
                                    //       onCompleted: (pin) {
                                    //         setState(() {
                                    //           _Otp=pin;
                                    //         });
                                    //         print("Completed: " + pin);
                                    //       }),
                                    // ),
                                    // const SizedBox(height: 60,),



                                  ],
                                ),


                              ),

                            ],
                          ),
                        ),



                      ),


                    ],
                  ),

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}