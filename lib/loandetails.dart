import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customer_app/colors/AppColors.dart';
import 'package:flutter_customer_app/emidetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoanDetails extends StatefulWidget {
  const LoanDetails({Key? key}) : super(key: key);

  @override
  State<LoanDetails> createState() => _LoanDetailsState();
}
final List<String> imgList = [
  "assests/images/bannerback.png",
  "assests/images/bannerback.png",
  "assests/images/bannerback.png"
];
class _LoanDetailsState extends State<LoanDetails> {

  bool valueterm=false;
  AppColors colors=new AppColors();
  TextStyle defaultStyleLogin = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 14.sp),
  );
  TextStyle defaultStyleGreen = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.green,fontSize: 12.sp),
  );
  TextStyle defaultStyleRed = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.redAccent,fontSize: 12.sp),
  );

  TextStyle smallSize = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black45,fontSize: 12.sp),
  );
  TextStyle mediumSize = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black45,fontSize: 12.sp),
  );
  TextStyle mediumSizeblack = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 12.sp),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loan Details",style: TextStyle(fontFamily: 'Scada'),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 10,),
            Card(
              margin: const EdgeInsets.all(20),
              clipBehavior: Clip.antiAlias,
              elevation: 3,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                              height: 5.h,
                              width: 5.w,
                              child: Image.asset("assests/images/basicdetails.png")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("Personal Details",style: defaultStyleLogin),
                              const SizedBox(height: 10),
                              Text("Ajay Singh",style: defaultStyleRed,),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text("S/O- "+"Prem Singh",style: mediumSizeblack,),
                              SizedBox(
                                height: 5.0,
                              ),
                              SizedBox(
                                width:  MediaQuery.of(context).size.width*.6,
                                child:   Text("414, New Barakhamba Rd, Connaught Lane, Barakhamba, New Delhi, Delhi 110001",style: smallSize,),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child:
                      RotatedBox(
                        quarterTurns: 1,
                        child: RichText(
                          text: TextSpan(
                            text: '--------',
                            style: defaultStyleGreen,
                            children: [

                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                              height: 5.h,
                              width: 5.w,
                              child: Image.asset("assests/images/pay.png")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Loan Details",style: defaultStyleLogin),
                              const SizedBox(height: 5),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("Loan No. :- 3434543423423",style: defaultStyleRed,),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("Loan Amount :- "+"120000 -/-",style: mediumSizeblack,),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("EMI Amount :- "+"5000 -/-",style: mediumSizeblack,),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("No. of EMIs :- "+"24",style: mediumSizeblack,),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("Start Year :- "+"May 2021",style: mediumSizeblack,),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("End Year :- "+"June 2023",style: mediumSizeblack,),


                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child:
                      RotatedBox(
                        quarterTurns: 1,
                        child: RichText(
                          text: TextSpan(
                            text: '--------',
                            style: defaultStyleGreen,
                            children: [

                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                              height: 5.h,
                              width: 5.w,
                              child: Image.asset("assests/images/identity.png")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Aadhaar & PAN",style: defaultStyleLogin),
                              const SizedBox(height: 5),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("Aadhaar No. :- 3434543423423",style: mediumSizeblack,),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("PAN :- "+"KLJ098KL",style: mediumSizeblack,),

                                ],
                              ),
                             ],
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      width: 220.0,
                        height: 40.0,
                        // margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                        child: Material(
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(25.0),
                          color: colors.redtlight,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            //height: 1,
                            //padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                            onPressed: () async {

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Download Loan Details",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                    textStyle:TextStyle(color: Colors.white,fontSize: 11.sp,fontWeight: FontWeight.bold),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                      height: 5.h,
                                      width: 5.w,
                                      child: Image.asset("assests/images/whitedownload.png")),
                                ),

                              ],
                            ),


                          ),
                        )
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),

              ),

            ),



            // Card(
            //   margin: const EdgeInsets.all(20),
            //   clipBehavior: Clip.antiAlias,
            //   elevation: 3,
            //   shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(10)),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child:Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               children: [
            //                 Text("Loan No.-"+"3456766788",style: defaultStyleLogin,),
            //               ],
            //             ),
            //
            //             SizedBox(
            //               height: 50.0,
            //             ),
            //             Text("Ajay Singh",style: defaultStyleRed,),
            //             SizedBox(
            //               height: 5.0,
            //             ),
            //             Text("S/O- "+"Prem Singh",style: defaultStyleLogin,),
            //             SizedBox(
            //               height: 5.0,
            //             ),
            //             Column(
            //               children: [
            //                 Text("414, New Barakhamba Rd, Connaught Lane, Barakhamba, New Delhi, Delhi 110001",style: mediumSizeblack,),
            //               ],
            //             ),
            //             SizedBox(
            //               height: 15.0,
            //             ),
            //             Text("Aadhar No. :- "+"125658965241",style: mediumSizeblack,),
            //             SizedBox(
            //               height: 5.0,
            //             ),
            //             Text("PAN No. :- "+"BNH78Gh678",style: mediumSizeblack,),
            //
            //             SizedBox(
            //               height: 30.0,
            //             ),
            //             Container(
            //                 height: 25.0,
            //                 // margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
            //                 child: Material(
            //                   elevation: 0.0,
            //                   borderRadius: BorderRadius.circular(15.0),
            //                   color: colors.greenactive,
            //                   child: MaterialButton(
            //                     //minWidth: MediaQuery.of(context).size.width,
            //                     // height: 1,
            //                     //padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
            //                     onPressed: () async {
            //
            //                     },
            //                     child: Text("Loan Details",
            //                       textAlign: TextAlign.center,
            //                       style: GoogleFonts.rubik(
            //                         textStyle:TextStyle(color: Colors.black,fontSize: 12.sp,fontWeight: FontWeight.bold),
            //                       ),
            //
            //                     ),
            //                   ),
            //                 )
            //             ),
            //             SizedBox(
            //               height: 10.0,
            //             ),
            //             Text("Loan Amount :- "+"120000 -/-",style: mediumSizeblack,),
            //             SizedBox(
            //               height: 5.0,
            //             ),
            //             Text("EMI Amount :- "+"5000 -/-",style: mediumSizeblack,),
            //             SizedBox(
            //               height: 5.0,
            //             ),
            //             Text("Number of EMIs :- "+"24",style: mediumSizeblack,),
            //             SizedBox(
            //               height: 5.0,
            //             ),
            //             Text("Start Date :- "+"24/01/2023",style: mediumSizeblack,),
            //
            //
            //
            //           ],
            //         ),
            //
            //
            //
            //
            //
            //
            //   ),
            //
            // ),
          ],
        ),
      ),
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
      decoration: BoxDecoration(),
      child: Image.asset(item)))
      .toList();
}
