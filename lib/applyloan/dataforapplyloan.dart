import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customer_app/colors/AppColors.dart';
import 'package:flutter_customer_app/emidetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DataforLoan extends StatefulWidget {
  const DataforLoan({Key? key}) : super(key: key);

  @override
  State<DataforLoan> createState() => _DataforLoanState();
}
final List<String> imgList = [
  "assests/images/bannerback.png",
  "assests/images/bannerback.png",
  "assests/images/bannerback.png"
];
class _DataforLoanState extends State<DataforLoan> {

  bool valueterm=false;
  AppColors colors=new AppColors();
  TextStyle defaultStyleLogin = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 14.sp),
  );
  TextStyle defaultStyleGreen = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.green,fontSize: 14.sp),
  );
  TextStyle defaultStyleRed = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.redAccent,fontSize: 12.sp),
  );
  TextStyle mediumSizeblack = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 12.sp),
  );
  TextStyle smallSize = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black45,fontSize: 12.sp),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard",style: TextStyle(fontFamily: 'Scada'),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 10,),
            SizedBox(
              // width: 1000.w,
              height: Adaptive.h(20.5),
              child: Center(
                //width: Adaptive.w(70.5),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(25.0),
                          color: colors.greylight,
                          child: MaterialButton(
                            //minWidth: MediaQuery.of(context).size.width,
                            height: 6.h,
                            padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                            onPressed: () async {

                            },
                            child: Text("LOAN APPROVAL",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                textStyle:TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),
                              ),

                            ),
                          ),
                        )
                    ),
                    Text("Take less than 5 min",style: defaultStyleRed),
                  ],
                ),
              ),
            ),
            //  SizedBox(height: 5,),
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
                          children: [
                            Text("Personal Details",style: defaultStyleLogin),
                            const SizedBox(height: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ajay Singh",style: defaultStyleRed,),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text("S/O- "+"Prem Singh",style: mediumSizeblack,),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Column(
                                  children: [
                                    Text("414, New Barakhamba Rd, Connaught Lane, Barakhamba, New Delhi, Delhi 110001",style: smallSize,),
                                  ],
                                ),
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
                          text: '------',
                          style: smallSize,
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
                              child: Image.asset("assests/images/work.png")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Work Details",style: defaultStyleLogin),
                              const SizedBox(height: 5),
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
                            text: '------',
                            style: smallSize,
                            children: [

                            ],
                          ),
                        ),
                      ),
                    ),
                  Container(
                    height: 25.0,
                       // margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                        child: Material(
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(25.0),
                          color: colors.greenactive,
                          child: MaterialButton(
                            //minWidth: MediaQuery.of(context).size.width,
                           // height: 1,
                            //padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                            onPressed: () async {

                            },
                            child: Text("For Loan Offers",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                textStyle:TextStyle(color: Colors.black,fontSize: 11.sp,fontWeight: FontWeight.bold),
                              ),

                            ),
                          ),
                        )
                    ),
                  Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child:
                      RotatedBox(
                        quarterTurns: 1,
                        child: RichText(
                          text: TextSpan(
                            text: '------',
                            style: smallSize,
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
                              child: Image.asset("assests/images/bank.png")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Bank Details",style: defaultStyleLogin),
                              const SizedBox(height: 5),
                              Text("Add Account and verify",style: smallSize,),
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
                            text: '------',
                            style: smallSize,
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
                              Text("Identity Verification",style: defaultStyleLogin),
                              const SizedBox(height: 5),
                              Text("Selfie & Video KYC with Original PAN",style: smallSize,),
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
                            text: '------',
                            style: smallSize,
                            children: [

                            ],
                          ),
                        ),
                      ),
                    ),
                  Container(
                        height: 25.0,
                        // margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                        child: Material(
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(25.0),
                          color: colors.greenactive,
                          child: MaterialButton(
                            //minWidth: MediaQuery.of(context).size.width,
                            // height: 1,
                            //padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                            onPressed: () async {

                            },
                            child: Text("Disbursment",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                textStyle:TextStyle(color: Colors.black,fontSize: 11.sp,fontWeight: FontWeight.bold),
                              ),

                            ),
                          ),
                        )
                    ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Checkbox(
                       // checkColor: Colors.greenAccent,
                        value: valueterm,
                        onChanged: (bool? v){
                          setState(() {
                            valueterm=v!;
                          });
                        },
                      ),
                      Text("By proceeding, you agree to the NFS Privacy Policy and NFS Terms of Use.",style: smallSize,),


                    ],
                    ),


                  ],
                ),

              ),

            ),
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
