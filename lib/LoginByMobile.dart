import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customer_app/OTPPages.dart';

class LoginByMobile extends StatefulWidget {
  const LoginByMobile({Key? key}) : super(key: key);

  @override
  State<LoginByMobile> createState() => _LoginByMobileState();
}

class _LoginByMobileState extends State<LoginByMobile> {
var  _MobileNumberBlock=false;
var  _LoanNumberBlock=true;
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
                            ),   Center(
                              child: Container(
                                height: 320,
                                constraints: const BoxConstraints(
                                    maxWidth: 500
                                ),
                                margin: const EdgeInsets.only(top: 100),
                                child:Image.asset('assests/images/mobile_ill.png'),

                              ),
                            ),
                            Center(
                              child: Container(
                                  constraints: const BoxConstraints(maxHeight: 320),
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Image.asset('assests/images/logo.png')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible:_MobileNumberBlock ,
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text( 'Please Enter Mobile Number', style: TextStyle(color: Color(0xFFFF0741), fontWeight: FontWeight.bold)),

                        Container(
                          height: 40,
                          constraints: const BoxConstraints(
                              maxWidth: 500
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: CupertinoTextField(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(4))
                            ),

                            clearButtonMode: OverlayVisibilityMode.editing,
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            placeholder: '+91...',
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
                                    style: TextStyle(color: Colors.white),
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
                        InkWell(child: Text("Login via Loan account number",style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),),onTap: (){
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
                        Text( 'Please Enter Loan Amount Number', style: TextStyle(color: Color(0xFFFF0741), fontWeight: FontWeight.bold)),

                        Container(
                          height: 40,
                          constraints: const BoxConstraints(
                              maxWidth: 500
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: CupertinoTextField(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(4))
                            ),

                            clearButtonMode: OverlayVisibilityMode.editing,
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            placeholder: 'ABC...',
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
                                    style: TextStyle(color: Colors.white),
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

                        InkWell(child: Text("Login via Mobile number",style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),),onTap: (){
                          setState(() {
                            _MobileNumberBlock=true;
                            _LoanNumberBlock=false;
                          });
                        },)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}