import 'package:flutter/material.dart';

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
          itemCount: 6,
          itemBuilder: (context, position) {
            return    Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
                child: Container(

                  width: MediaQuery.of(context).size.width-20,

                  color: Color(0xFFFFF5DA),
                  height: 120,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Your Upcoming EMI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Scada'),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Due Date",style: TextStyle(color: Colors.grey,fontFamily: 'Scada'),),
                                Text("12-08-2023",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Scada'),),
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
                                Text("₹5456/-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: 'Scada'),),
                                SizedBox(height: 2,),
                                Text("05/23 -78547854",style: TextStyle(fontSize: 13,fontFamily: 'Scada'),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(onPressed: (){},child: Text("Pay Now",style: TextStyle(color: Colors.white,fontFamily: 'Scada',fontWeight: FontWeight.bold),),color: Colors.green,),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}
