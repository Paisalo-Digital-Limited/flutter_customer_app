import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customer_app/emidetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'applyloan/dataforapplyloan.dart';
import 'loandetails.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}
final List<String> imgList = [
  "assests/images/bannerback.png",
  "assests/images/bannerback.png",
  "assests/images/bannerback.png"
];
class _DashboardState extends State<Dashboard> {


  TextStyle defaultStyleLogin = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 17.sp,fontWeight: FontWeight.bold),
  );


  TextStyle smallSize = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 13.sp),
  );
  TextStyle paynowButton = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.white,fontSize: 14.sp),
  );
  TextStyle paynow_title = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Dashboard",style: TextStyle(fontFamily: 'Scada'),),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            SizedBox(
            height: Adaptive.h(25.5),
            child: Container(
            //width: Adaptive.w(70.5),
            child: CarouselSlider(
              options: CarouselOptions(
                height: Adaptive.h(50),
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [
                Container(
                    decoration: const BoxDecoration(),
                    child: Image.asset(imgList.elementAt(0).toString()))
              ],
            ),
          ),
        ),
          //  SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child:  GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoanDetails()));
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    elevation: 3,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Container(
                      // width: MediaQuery.of(context).size.width/2-20,
                      color: const Color(0xffddf5ff),
                      height: Adaptive.h(22),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                height: 10.h,
                                width: 10.w,
                                child: Image.asset("assests/images/loan.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("LOAN",style: defaultStyleLogin,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Here you can find all the loans on you from paisalo digital limited",textAlign: TextAlign.center,style:smallSize,)),
                          )
                        ],

                      ),
                    ),
                  ),
                ),),
                Expanded(child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EMIDetails()));
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    elevation: 3,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Container(
                   //width: MediaQuery.of(context).size.width/2-20,
                      color: const Color(0xffffe7de),
                      height: Adaptive.h(22),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                height: 10.h,
                                width: 10.w,
                                child: Image.asset("assests/images/emi.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("EMIs",style: defaultStyleLogin,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Here you can find all the details about you loans EMIs",textAlign: TextAlign.center,style: smallSize
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),),


              ],
            ),
            const SizedBox(height: 4,),
            Card(
              margin: const EdgeInsets.only(left: 15,right: 15),
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7)),),
              child:InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DataforLoan()));
                  },
                child: Container(
                width: MediaQuery.of(context).size.width-20,
                color: const Color(0xffdeffd3),
                height: 14.h,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                          height: 8.h,
                          width: 8.w,
                          child: Image.asset("assests/images/applyloan.png")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Apply for Loan",style: defaultStyleLogin),
                          const SizedBox(height: 5),
                          Text("Click here to apply for Loan",style: smallSize,),
                        ],
                      ),
                    )
                  ],
                ),
              )
              )
            ),

            Card(
              margin: const EdgeInsets.only(left:15,right: 15,top: 20),
              clipBehavior: Clip.antiAlias,
              elevation: 8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: InkWell(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>EMIDetails()));
                       },
                child: Container(
                width: MediaQuery.of(context).size.width-20,
                color: Color(0xFFFFF5DA),
                height: 16.h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Your Upcoming EMI",style: defaultStyleLogin,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Due Date",style: paynow_title,),
                              Text("12-08-2023",style: smallSize,),
                            ],
                          ),
                        )
                      ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("₹5456/-",style: defaultStyleLogin,),
                              SizedBox(height: 2,),
                              Text("Upcoming EMI before due date",style:smallSize,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(onPressed: (){},child: Text("Pay Now",style: paynowButton,),color: Colors.green,),
                        )
                      ],
                    )
                  ],
                ),
              ),),
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
