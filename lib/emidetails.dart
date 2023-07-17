import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EMIDetails extends StatefulWidget {
  const EMIDetails({Key? key}) : super(key: key);

  @override
  State<EMIDetails> createState() => _EMIDetailsState();
}

class _EMIDetailsState extends State<EMIDetails> {

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
                                child: Text("Loan EMI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,fontFamily: 'Scada'),),
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
                                    Text("₹5456/-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,fontFamily: 'Scada'),),
                                    SizedBox(height: 2,),
                                    Text("05/23 -78547854",style: TextStyle(fontSize: 14.sp,fontFamily: 'Scada'),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(onPressed: (){},child: Text("Paid",style: TextStyle(color: Colors.black45,fontFamily: 'Scada',fontWeight: FontWeight.bold,fontSize: 14.sp),)),
                              )
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
