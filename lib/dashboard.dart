import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customer_app/emidetails.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'applyloan/dataforapplyloan.dart';
import 'const/common.dart';
import 'loandetails.dart';
import 'models/loandata.dart';
import 'network/api_service.dart';
import 'paynowweb.dart';

class Dashboard extends StatefulWidget {
  //const Dashboard({Key? key}) : super(key: key);
  final int _Id;
  final String _loanNo;
  const Dashboard(this._Id,this._loanNo);

  @override
  State<Dashboard> createState() => _DashboardState();
}
final List<String> imgList = [
  "assests/images/bannerback.png",
  "assests/images/bannerback.png",
  "assests/images/bannerback.png"
];
class _DashboardState extends State<Dashboard> {

  CommonAction commonAlert= CommonAction();
  Data? data;
  List<LoanEmi>? loanEmilist;
  bool pendingEmi=false;
  String loanAmount="";
  String loanDueDate="";


  /////////////////payment///////////////
  String _platformVersion = 'Unknown';
  String responseData = "Nothing";
 // final _isgpayuiPlugin = IsgpayuiPlugin();

  TextStyle defaultStyleLogin = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 17.sp,fontWeight: FontWeight.bold),
  );


  TextStyle smallSize = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 13.sp),
  );
  TextStyle paynowButton = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),
  );
  TextStyle paynow_title = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.bold),
  );

  //////////////////  LoanData  //////////////////////
  Future<Null> LoanDataDetails() async {
    EasyLoading.show(status: 'Loading');
    final api = Provider.of<ApiService>(context, listen: false);
    return await api
        .loandata(widget._loanNo)
        .then((result) {
      setState(() {
        EasyLoading.dismiss();
        if(result.statusCode==200){
          if(result.data != null){
            data=result.data;
            loanEmilist=result.data?.loanEmi;
            for (int i = 0; i <loanEmilist!.length; i++) {
              if(pendingEmi==false){
                if(loanEmilist![i].paid=="null"){
                  pendingEmi=true;
                  loanAmount=loanEmilist![i].amount;
                  loanDueDate=commonAlert.dateFormateSQLServer(context,loanEmilist![i].emiDueDate);
                }
              }
            }
          }else{
            commonAlert.messageAlertError(context,"Account ${result.message}. Please Login","Error");
          }
        }else{
          commonAlert.messageAlertError(context,"Account details not found","Error");
        }


      });
    }).catchError((error) {

      EasyLoading.dismiss();
      print(error);
    });
  }


  @override
  void initState() {
    LoanDataDetails();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paisalo",style: TextStyle(fontFamily: 'Scada'),),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      // drawer: Drawer(
      //     //child: // Populate the Drawer in the next step.
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           // SizedBox(height: 10,),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoanDetails(data!,widget._loanNo)));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EMIDetails(loanEmilist)));
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

            Card(
              margin: const EdgeInsets.only(left:15,right: 15,top: 20),
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: InkWell(
                       onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>EMIDetails(loanEmilist)));
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
                          child: Text("Upcoming EMI",style: defaultStyleLogin,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Due Date",style: paynow_title,),
                              Text(loanDueDate,style: smallSize,),
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
                              Text("₹ ${loanAmount}/-",style: defaultStyleLogin,),
                              SizedBox(height: 2,),
                              Text("Pay EMI before due date",style:smallSize,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PayNowWeb("https://pdlpay.paisalo.in:946/start.html",loanAmount,widget._loanNo)));
                          },child: Text("Pay Now",style: paynowButton,),color: Colors.green,),
                        )
                      ],
                    )
                  ],
                ),
              ),),
            ),
            const SizedBox(height: 15,),
            Card(
                margin: const EdgeInsets.only(left: 15,right: 15),
                clipBehavior: Clip.antiAlias,
                elevation: 5,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7)),),
                child:InkWell(
                    onTap: () {
                      commonAlert.showToast(context,"Coming soon");
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>DataforLoan()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width-20,
                      color: const Color(0xffdeffd3),
                      height: 10.h,
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
