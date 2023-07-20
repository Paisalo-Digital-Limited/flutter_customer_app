import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'const/common.dart';
import 'models/loandata.dart';

class EMIDetails extends StatefulWidget {
 // const EMIDetails({Key? key}) : super(key: key);
  final List<LoanEmi>? loanEmilist;
  const EMIDetails(this.loanEmilist);

  @override
  State<EMIDetails> createState() => _EMIDetailsState();
}

class _EMIDetailsState extends State<EMIDetails> {

  CommonAction commonAlert= CommonAction();
  TextStyle defaultStyleLogin = GoogleFonts.rubik(
    textStyle:TextStyle(color: Colors.black,fontSize: 16.sp,fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EMI Details"),
      ),
        body: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: widget.loanEmilist!.length,
          itemBuilder: (context, position) {
            return Row(
              children: [
                  Expanded(
                  flex: 12,
                  child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Container(
                    // width: MediaQuery.of(context).size.width-20,
                      color: widget.loanEmilist![position].paid =="null"?const Color(
                          0xFFFFFFFF):const Color(0xFFD9D9D9),
                     // position%2==0?const Color(0xFFFFF5DA):const Color(0xFFC9FCEF),
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
                                    Text(widget.loanEmilist![position].paid =="null"?"Due Date":"Paid Date",
                                      style: TextStyle(color: Colors.grey,fontFamily: 'Scada',fontSize: 14.sp),),
                                    Text(commonAlert.dateFormateSQLServer(context,widget.loanEmilist![position].emiDueDate),style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Scada',fontSize: 14.sp),),
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
                                    Text("₹ ${widget.loanEmilist![position].amount}",style: defaultStyleLogin,),
                                    const SizedBox(height: 2,),
                                    Text("",style: TextStyle(fontSize: 14.sp,fontFamily: 'Scada'),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:widget.loanEmilist![position].paid =="null"?Text("Pending",textAlign: TextAlign.end,style: TextStyle(color: Colors.black45,fontFamily: 'Scada',fontWeight: FontWeight.bold,fontSize: 14.sp),)
                                    :Container(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset("assests/images/correct.png")
                                )



                              ),
                               // MaterialButton(onPressed: (){},child: Text("Paid",style: TextStyle(color: Colors.black45,fontFamily: 'Scada',fontWeight: FontWeight.bold,fontSize: 14.sp),)),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ),
            ],
          );



          },
        ),
    );
  }
}
