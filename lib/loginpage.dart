import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



 /* Future<Null> getData() async {
    EasyLoading.show(status: 'Loading');
    final api = Provider.of<ApiService>(context, listen: false);
    return await api
        .hotelData(colors.hotelId)
        .then((result) {
      EasyLoading.dismiss();
      setState(() {
        if(result.data.isNotEmpty){
          sfdata.saveHotelData(context,result.data[0].name,result.data[0].logo, result.data[0].address, result.data[0].phoneNumber, result.data[0].email, result.data[0].seatDiscountInPercent, result.data[0].itemDiscountInPercent, result.data[0].firstTimeDiscountInPercent, result.data[0].contactPerson,result.data[0].oneTimeBookingSeatNo,result.data[0].latitude,result.data[0].longitude);
          membershipStatus=result.data[0].membershipStatus;
        }else{

        }

      });
    }).catchError((error) {

      // EasyLoading.dismiss();
      print(error);
    });
  }

*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("SBI Colending(1.0)"),
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 160,
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                          child: Image.asset("assests/images/logo.png")),
                      const Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            "Enter User ID",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: const EdgeInsets.only(left: 6,right: 6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow:const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, .2),
                                  blurRadius: 2.0,
                                  offset: Offset(1, 2),
                                  spreadRadius: 2.0)
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(),
                              child: TextField(
                                style: TextStyle(fontSize: 16),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "User ID",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400], fontSize: 16),
                                    icon: const Icon(Icons.account_circle),
                                    iconColor: Colors.red.shade100),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            "User Name must be atleast 10 character",
                            style: TextStyle(
                              fontSize: 11,),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            "Enter Password",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.only(left: 6,right: 6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, .2),
                                  blurRadius: 2.0,
                                  offset: Offset(1, 2),
                                  spreadRadius: 2.0)
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: TextField(
                                style: TextStyle(fontSize: 16),
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400], fontSize: 16),
                                  icon: Icon(Icons.lock_open_sharp),
                                  iconColor: Colors.red.shade100,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(6),
                          child: Text(
                            "Password must be atleast 5 character",
                            style: TextStyle(
                              fontSize: 11,),
                          )),
                      SizedBox(
                        height: 40,
                      ),



 // this is the login Layout and view is created to.

                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text("Share Device ID",style: TextStyle(fontSize: 16),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Card(

                        elevation: 5,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(255, 4, 63, 1.0),
                                Color.fromRGBO(241, 0, 44, 0.6),
                              ])),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RaleWay',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("term & conditions",style: TextStyle(color: Colors.blue),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
