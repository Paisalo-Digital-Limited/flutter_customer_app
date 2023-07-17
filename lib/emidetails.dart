import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EMIDetails extends StatefulWidget {
  const EMIDetails({Key? key}) : super(key: key);

  @override
  State<EMIDetails> createState() => _EMIDetailsState();
}

class _EMIDetailsState extends State<EMIDetails> {

  TextStyle defaultStyleLogin = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EMI Details"),
      ),
        body:
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: 6,
          itemBuilder: (context, position) {
            return Row(
              children: [
                  Expanded(
                  flex: 12,
                  child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Container(
                    // width: MediaQuery.of(context).size.width-20,
                      color: position%2==0?const Color(0xFFFFF5DA):const Color(
                          0xFFC9FCEF),
                      //height: 15.h,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Loan EMI",style: defaultStyleLogin,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Paid Date",style: TextStyle(color: Colors.grey,fontFamily: 'Scada',fontSize: 14.sp),),
                                    Text("12-08-2023",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Scada',fontSize: 14.sp),),
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
                                    const SizedBox(height: 2,),
                                    Text("",style: TextStyle(fontSize: 14.sp,fontFamily: 'Scada'),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: position%2==0?Container(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset("assests/images/correct.png")
                                ):Text("Pending",textAlign: TextAlign.end,style: TextStyle(color: Colors.black45,fontFamily: 'Scada',fontWeight: FontWeight.bold,fontSize: 14.sp),),

                              ),
                               // MaterialButton(onPressed: (){},child: Text("Paid",style: TextStyle(color: Colors.black45,fontFamily: 'Scada',fontWeight: FontWeight.bold,fontSize: 14.sp),)),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ) ),
              ],
            );



          },
        ),
    );
  }
}
