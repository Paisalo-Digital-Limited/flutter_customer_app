import 'package:flutter/material.dart';
import 'package:flutter_customer_app/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OTPpages extends StatefulWidget {
  const OTPpages({Key? key}) : super(key: key);

  @override
  State<OTPpages> createState() => _OTPpagesState();
}

class _OTPpagesState extends State<OTPpages> {

  TextStyle defaultStyleLogin = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 18.sp),
  );
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      if(text.length<4){
        text = text + value;
      }

    });
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
        child: Center(child: Text(text[position], style: const TextStyle(color: Colors.black),)),
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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
    leading: IconButton(
    icon: Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    color: Color(0xFFFF0741),
    ),
    child: const Icon(Icons.arrow_back_ios, size: 16,),
    ),
    onPressed: () => Navigator.of(context).pop(),
    ),
    elevation: 0,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    ),
    body: SafeArea(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    Expanded(
    child: Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
    Expanded(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Text('Enter 4 digits verification code sent to your number', style: defaultStyleLogin)
    ),
    Container(
    constraints: const BoxConstraints(
    maxWidth: 500
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    otpNumberWidget(0),
    otpNumberWidget(1),
    otpNumberWidget(2),
    otpNumberWidget(3),
    ],
    ),
    ),
    ],
    ),
    ),
    Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    constraints: const BoxConstraints(
    maxWidth: 500
    ),
    child: MaterialButton(
    onPressed: () {
       // Navigator.push(context, MaterialPageRoute(builder:(context)=> Dashboard()));
    },
    color: Color(0xFFFF0741),
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(14))
    ),
    child: Container(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Text('Confirm', style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.bold),),
    Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(20)),
    color: Color(0xFFFF0741),
    ),
    child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16,),
    )
    ],
    ),
    ),
    ),
    ),
    NumericKeyboard(
    onKeyboardTap: _onKeyboardTap,
    textColor: Colors.red,
    rightIcon: Icon(
    Icons.backspace,
    color: Colors.red,
    ),
    rightButtonFn: () {
    setState(() {
    text = text.substring(0, text.length - 1);
    });
    },
    )
    ],
    ),
    )
    ],
    ),
    ),
    );
  }
}