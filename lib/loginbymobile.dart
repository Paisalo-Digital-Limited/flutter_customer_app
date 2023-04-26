import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customer_app/otppages.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginByMobile extends StatefulWidget {
  const LoginByMobile({Key? key}) : super(key: key);

  @override
  State<LoginByMobile> createState() => _LoginByMobileState();
}

class _LoginByMobileState extends State<LoginByMobile> {
var  _MobileNumberBlock=false;
var  _LoanNumberBlock=true;


String? _currentAddress;
Position? _currentPosition;

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
  _getCurrentPosition();
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
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                height: 200,
                                constraints: const BoxConstraints(
                                    maxWidth: 500
                                ),
                                margin: const EdgeInsets.only(top: 150),
                                decoration: const BoxDecoration(color: Color(
                                    0xFFF98A1), borderRadius: BorderRadius.all(Radius.circular(30))),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: Adaptive.h(32.5),
                                //constraints: const BoxConstraints(maxWidth: 500),
                                margin: const EdgeInsets.only(top: 100),
                                child:Image.asset('assests/images/mobile_ill.png'),

                              ),
                            ),
                            Center(
                              child: Container(
                                height: Adaptive.h(12.5),
                                 // constraints: const BoxConstraints(maxHeight: Adaptive.h(12.5)),
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Image.asset('assests/images/logo.png')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                    child:Column(
                        children: [
                          Visibility(
                            visible:_MobileNumberBlock ,
                            child: Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[

                                  Text( 'Please Enter Mobile Number', style: TextStyle(color: Color(0xFFFF0741), fontWeight: FontWeight.bold, fontSize: 15.sp)),

                                  Container(
                                    height: 6.h,
                                    constraints: const BoxConstraints( maxWidth: 500),
                                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    child: CupertinoTextField(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: const BorderRadius.all(Radius.circular(15))
                                      ),

                                      clearButtonMode: OverlayVisibilityMode.editing,
                                      keyboardType: TextInputType.phone,
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 15.sp),
                                      placeholder: '+91...',
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    constraints: const BoxConstraints(maxWidth: 500),
                                    child: MaterialButton(
                                      onPressed: () {
                                        // if (phoneController.text.isNotEmpty) {
                                        //   loginStore.getCodeWithPhoneNumber(context, phoneController.text.toString());
                                        // } else {
                                        //   loginStore.loginScaffoldKey.currentState.showSnackBar(SnackBar(
                                        //     behavior: SnackBarBehavior.floating,
                                        //     backgroundColor: Colors.red,
                                        //     content: Text(
                                        //       'Please enter a phone number',
                                        //       style: TextStyle(color: Colors.white),
                                        //     ),
                                        //   ));
                                        // }

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => OTPpages(),));
                                      },
                                      color:Color(0xFFFF0741),
                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Next',
                                              style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                                color: Color(0xFFFF0741),
                                              ),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                    ),

                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(child: Text("Login via Loan account number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp,color: Colors.blue,decoration: TextDecoration.underline),),onTap: (){
                                    setState(() {
                                      _MobileNumberBlock=false;
                                      _LoanNumberBlock=true;
                                    });
                                  },)
                                ],
                              ),
                            ),
                          ) ,

                          Visibility(
                            visible: _LoanNumberBlock,
                            child: Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Text( 'Please Enter Loan Amount Number', style: TextStyle(fontSize: 15.sp,color: Color(0xFFFF0741), fontWeight: FontWeight.bold)),

                                  Container(
                                    height: 6.h,
                                    constraints: const BoxConstraints(
                                        maxWidth: 500
                                    ),
                                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    child: CupertinoTextField(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: const BorderRadius.all(Radius.circular(15))
                                      ),

                                      clearButtonMode: OverlayVisibilityMode.editing,
                                      //keyboardType: TextInputType.phone,
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 15.sp),
                                      placeholder: '',
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    constraints: const BoxConstraints(
                                        maxWidth: 500
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        // if (phoneController.text.isNotEmpty) {
                                        //   loginStore.getCodeWithPhoneNumber(context, phoneController.text.toString());
                                        // } else {
                                        //   loginStore.loginScaffoldKey.currentState.showSnackBar(SnackBar(
                                        //     behavior: SnackBarBehavior.floating,
                                        //     backgroundColor: Colors.red,
                                        //     content: Text(
                                        //       'Please enter a phone number',
                                        //       style: TextStyle(color: Colors.white),
                                        //     ),
                                        //   ));
                                        // }

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => OTPpages(),));
                                      },
                                      color:Color(0xFFFF0741),
                                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'Next',
                                              style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                                color: Color(0xFFFF0741),
                                              ),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                    ),

                                  ),
                                  SizedBox(height: 10,),

                                  InkWell(child: Text("Login via Mobile number",style: TextStyle(fontSize: 15.sp,color: Colors.blue,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),onTap: (){
                                    setState(() {
                                      _MobileNumberBlock=true;
                                      _LoanNumberBlock=false;
                                    });
                                  },)
                                ],
                              ),
                            ),
                          )
                          ,
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child:
                              Text("Location: ${_currentAddress}",style: TextStyle(color: Colors.red),),

                            ),
                          )
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