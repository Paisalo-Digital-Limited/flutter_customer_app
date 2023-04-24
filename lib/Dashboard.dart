import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customer_app/EMIDetails.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard",style: TextStyle(fontFamily: 'Scada'),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            SizedBox(

              width: double.maxFinite,
              height: 150,
          child: Container(
            width: double.maxFinite,
            child: CarouselSlider(

              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: [

                Container(
                    decoration: BoxDecoration(),
                    child: Image.asset(imgList.elementAt(0).toString()))
              ],
            ),
          ),
        ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Card(
                    
                    clipBehavior: Clip.antiAlias,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                    child: Container(

                      width: MediaQuery.of(context).size.width/2-20,

                      color: Color(0xffddf5ff),
                      height: 190,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20,bottom:4.0),
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Image.asset("assests/images/loan.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Loans",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Scada'),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(child: Text("Here you can find all the loans on you from paisalo digital limited",style: TextStyle(fontSize: 12,fontFamily: 'Scada'),)),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EMIDetails()));
                  },
                  child: Card(
                    
                    clipBehavior: Clip.antiAlias,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                    child: Container(
                      

                      width: MediaQuery.of(context).size.width/2-20,

                      color: Color(0xffffe7de),
                      height: 190,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20,bottom:4.0),
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Image.asset("assests/images/emi.png")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("EMIs",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Scada'),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(child: Text("Here you can find all the details about you loans EMIs",style: TextStyle(fontSize: 12,fontFamily: 'Scada'))),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
         SizedBox(height: 4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    child: Container(

                      width: MediaQuery.of(context).size.width-20,

                      color: Color(0xffdeffd3),
                      height: 80,
                     child: Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 20.0),
                           child: Container(
                           height: 40,
                           width: 40,
                           child: Image.asset("assests/images/applyloan.png")),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 16.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("Apply for Loan",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'Scada'),),
                               SizedBox(height: 5,),
                               Text("Click here to apply for Loan",style: TextStyle(fontSize: 14,fontFamily: 'Scada'),),
                             ],
                           ),
                         )
                       ],
                     ),
                    ),
                  ),
                ),





              ],
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Padding(
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
                ),





              ],
            )
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
