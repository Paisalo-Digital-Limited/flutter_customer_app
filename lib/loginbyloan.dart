import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customer_app/dashboard.dart';
import 'package:flutter_customer_app/otppages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'const/common.dart';
import 'network/api_service.dart';
import 'otp.dart';

class LoginByLoan extends StatefulWidget {
  const LoginByLoan({Key? key}) : super(key: key);

  @override
  State<LoginByLoan> createState() => _LoginByLoanState();
}

class _LoginByLoanState extends State<LoginByLoan> {
  var  _MobileNumberBlock=false;
  var  _LoanNumberBlock=true;


  String? _currentAddress;
  Position? _currentPosition;
  bool _loanlayout=true;
  bool _mobilelayout=false;
  CommonAction commonAlert= CommonAction();
  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController mobileControllerlogin = new TextEditingController();
  TextEditingController passwordControllerlogin = new TextEditingController();
  var _userID;

  TextStyle defaultStyle = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.grey,fontSize: 16.sp),
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


  //////////////////  SignUp  //////////////////////
  Future<Null> signUp() async {
     //print(mobileController.text.toString());
       EasyLoading.show(status: 'Loading');
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    final api = Provider.of<ApiService>(context, listen: false);
    return await api
        .signUp(nameController.text.toString(),mobileController.text.toString().trim(),passwordController.text.toString().trim())
        .then((result) {
         setState(() {
         EasyLoading.dismiss();
        if(result.data.isNotEmpty){
          _userID=result.data;
          _mobilelayout=false; 
          _loanlayout=true;
          commonAlert.messageAlertError(context,"Please Login","Success");
          nameController.text="";
          mobileController.text="";
          passwordController.text="";
        }else{
          commonAlert.messageAlertError(context,"Account ${result.message}. Please Login","Error");
        }
      });
    }).catchError((error) {
       EasyLoading.dismiss();
      print(error);
    });
  }

  //////////////////  Login  //////////////////////
  Future<Null> login() async {
    EasyLoading.show(status: 'Loading');
    final api = Provider.of<ApiService>(context, listen: false);
    return await api
        .login(mobileControllerlogin.text.toString().trim(),passwordControllerlogin.text.toString().trim())
        .then((result) {
      setState(() {
        EasyLoading.dismiss();
        if(result.data.isNotEmpty){
          List<dynamic> list=jsonDecode(result.data);
          var _data=list[0]['Status'];
          var _ID=list[0]['Id'];
          var _LoanNo=list[0]['LoanNo'];
          if(_data=='Loan Number Not Mapped.'){
            Navigator.pushReplacement(
                context,MaterialPageRoute(
                  builder: (context) => OtpVerify(_ID),));
          }else if(_data=='You are not Register.'){
            commonAlert.messageAlertError(context,"You are not Register.","Error");
          }else if(_data=="Successfully Get."){
            Navigator.pushReplacement(
                context,MaterialPageRoute(
              builder: (context) => Dashboard(_ID,_LoanNo),));
          }else if(_data=="Wrong Credentials."){
            commonAlert.messageAlertError(context,_data,"Error");
          }
         print("DATA-- "+_data);

        }else{
          commonAlert.messageAlertError(context,"Account ${result.message}. Please Login","Error");
        }

      });
    }).catchError((error) {

      EasyLoading.dismiss();
      print(error);
    });
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: Adaptive.h(35),
                  width: MediaQuery.of(context).size.width,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Visibility(
                        visible: _loanlayout,
                        child:  Card(
                          clipBehavior: Clip.antiAlias,
                          semanticContainer: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 10,
                          margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                          child: Container(
                            // width: double.infinity,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                                  child:Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('LOGIN',
                                            style: GoogleFonts.rubik(
                                              textStyle:TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold),
                                            ),
                                            // TextStyle(color: Colors.black,fontSize: 18.sp,fontFamily:'Abel'),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 20,),
                                      Row(
                                        children: [
                                          Text('Enter Mobile Number',
                                            style: GoogleFonts.rubik(
                                              textStyle:TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),
                                            ),
                                            // TextStyle(color: Colors.black,fontSize: 18.sp,fontFamily:'Abel'),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                        height: 6.h,
                                        child:CupertinoTextField(
                                          controller: mobileControllerlogin,
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          decoration: const BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),

                                          clearButtonMode: OverlayVisibilityMode.editing,
                                          keyboardType: TextInputType.phone,
                                          maxLines: 1,
                                          maxLength: 10,
                                          style: TextStyle(fontSize: 17.sp),
                                          placeholder: '',
                                        ),
                                      ),

                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text('Password',
                                            style: GoogleFonts.rubik(
                                              textStyle:TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),
                                            ),
                                            // TextStyle(color: Colors.black,fontSize: 18.sp,fontFamily:'Abel'),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),

                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                        height: 6.h,
                                        child:CupertinoTextField(
                                          controller: passwordControllerlogin,
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          decoration: const BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          clearButtonMode: OverlayVisibilityMode.editing,
                                           keyboardType: TextInputType.visiblePassword,
                                          obscureText: true,
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 17.sp),
                                          placeholder: '',
                                        ),
                                      ),

                                      Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                                          child: Material(
                                            elevation: 5.0,
                                            borderRadius: BorderRadius.circular(5.0),
                                            color: const Color(0xFFFF0741),
                                            child: MaterialButton(
                                              minWidth: MediaQuery.of(context).size.width,
                                              height: 1.h,
                                              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                              onPressed: () async {
                                                if(mobileControllerlogin.text.length<10){
                                                  commonAlert.showToast(context,"Enter Mobile");
                                                }else if(passwordControllerlogin.text.length<3){
                                                  commonAlert.showToast(context,"Enter Password");
                                                }else{
                                                  login();
                                                }

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
                                      // SizedBox(height: 5,),
                                      Padding(
                                        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                                        child:RichText(
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(
                                            style: defaultStyle,
                                            children: <TextSpan>[
                                              TextSpan(text: 'By Signing in, you indicate that you agreed to our '),
                                              TextSpan(
                                                  text: 'Terms of Service',
                                                  style: linkStyle,
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                      print('Terms of Service"');
                                                    }),
                                              TextSpan(text: ' and that you have read our '),
                                              TextSpan(
                                                  text: 'Privacy Policy',
                                                  style: linkStyle,
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                      print('Privacy Policy"');
                                                    }),
                                            ],
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                                        child:RichText(
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(
                                            style: defaultStyleLogin,
                                            children: <TextSpan>[
                                              TextSpan(text: 'New User? '),
                                              TextSpan(
                                                  text: 'Register here',
                                                  style: linkStyleOtp,
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                      setState(() {
                                                        _mobilelayout=true;
                                                        _loanlayout=false;
                                                      });
                                                      print('Terms of Service"');
                                                    }),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height: 30,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      ////////////////////// REGISTRATION /////////////

                      Visibility(
                        visible: _mobilelayout,
                        child:  Card(
                          clipBehavior: Clip.antiAlias,
                          semanticContainer: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 10,
                          margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                          child:Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                                  child:Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('REGISTRATION',
                                            style: GoogleFonts.rubik(
                                              textStyle:TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold),
                                            ),
                                            // TextStyle(color: Colors.black,fontSize: 18.sp,fontFamily:'Abel'),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 15,),
                                      Row(
                                        children: [
                                          Text('Enter Name',
                                            style: GoogleFonts.rubik(
                                              textStyle:TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),
                                            ),
                                            // TextStyle(color: Colors.black,fontSize: 18.sp,fontFamily:'Abel'),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                        height: 6.h,
                                        child:CupertinoTextField(
                                          controller: nameController,
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius: const BorderRadius.all(Radius.circular(5))
                                          ),

                                          clearButtonMode: OverlayVisibilityMode.editing,
                                          //keyboardType: TextInputType.phone,
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 17.sp),
                                          placeholder: '',
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text('Enter Mobile Number',
                                            style: GoogleFonts.rubik(
                                              textStyle:TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),
                                            ),
                                            // TextStyle(color: Colors.black,fontSize: 18.sp,fontFamily:'Abel'),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                        height: 6.h,
                                        child:CupertinoTextField(
                                          controller: mobileController,
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius: const BorderRadius.all(Radius.circular(5))
                                          ),

                                          clearButtonMode: OverlayVisibilityMode.editing,
                                          keyboardType: TextInputType.phone,
                                          maxLength: 10,
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 17.sp),
                                          placeholder: '',
                                        ),
                                      ),

                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text('Password',
                                            style: GoogleFonts.rubik(
                                              textStyle:TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),
                                            ),
                                            // TextStyle(color: Colors.black,fontSize: 18.sp,fontFamily:'Abel'),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),

                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                                        height: 6.h,
                                        child:CupertinoTextField(
                                          controller: passwordController,
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius: const BorderRadius.all(Radius.circular(5))
                                          ),

                                          clearButtonMode: OverlayVisibilityMode.editing,
                                          keyboardType: TextInputType.visiblePassword,
                                          obscureText: true,
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 17.sp),
                                          placeholder: '',
                                        ),
                                      ),

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
                                                if(nameController.text.length<3){
                                                  commonAlert.showToast(context,"Enter Name");
                                                }else if(mobileController.text.length<10){
                                                  commonAlert.showToast(context,"Enter Mobile");
                                                }else if(passwordController.text.length<3){
                                                  commonAlert.showToast(context,"Enter Password");
                                                }else{
                                                     signUp();
                                                }
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

                                      Padding(
                                        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                                        child:RichText(
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(
                                            style: defaultStyle,
                                            children: <TextSpan>[
                                              TextSpan(text: 'By Signing in, you indicate that you agreed to our '),
                                              TextSpan(
                                                  text: 'Terms of Service',
                                                  style: linkStyle,
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                      print('Terms of Service"');
                                                    }),
                                              TextSpan(text: ' and that you have read our '),
                                              TextSpan(
                                                  text: 'Privacy Policy',
                                                  style: linkStyle,
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                      print('Privacy Policy"');
                                                    }),
                                            ],
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                                        child:RichText(
                                          textAlign: TextAlign.justify,
                                          text: TextSpan(
                                            style: defaultStyleLogin,
                                            children: <TextSpan>[
                                              TextSpan(text: 'Already User? '),
                                              TextSpan(
                                                  text: 'Login here',
                                                  style: linkStyleOtp,
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                      setState(() {
                                                        _mobilelayout=false;
                                                        _loanlayout=true;
                                                      });
                                                      print('Terms of Service"');
                                                    }),
                                            ],
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 30,)

                                    ],
                                  ),


                                ),

                              ],
                            ),
                          ),



                        ),
                      ),





                    ],
                  ),
                )
              ],
            )
          ),




        ),

    );
  }
}