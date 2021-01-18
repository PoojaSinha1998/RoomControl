import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin  {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _checkbox = false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  List<String> subsubjectList = new List();
  List<String> imagetList = new List();

// starting
  var _myValue = 0.0;

// ending
  final _myNewValue = 2.0;
  // double height = 300;
  AnimationController _animationController;
  Duration duration = Duration(milliseconds: 500);
  Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();
    // height = 300;
    //TODO this is for testing purpose only remove it when release
    subsubjectList.add("Bed room");
    subsubjectList.add("Living room");
    subsubjectList.add("Kitchen");
    subsubjectList.add("Bathroom");
    subsubjectList.add("Outdoor");
    subsubjectList.add("Balcony");

    imagetList.add("assets/img/bed.png");
    imagetList.add("assets/img/room.png");
    imagetList.add("assets/img/kitchen.png");
    imagetList.add("assets/img/bathtube.png");
    imagetList.add("assets/img/bathtube.png");
    imagetList.add("assets/img/balcony.png");

    _animationController = AnimationController(vsync: this, duration: duration);
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    Color teachColor1 = Color(0xffC56EFF);
    Color teachColor2 = Color(0xff8A11F3);
    Color CoordColor1 = Color(0xffffffff);
    Color CoordColor2 = Color(0xffffffff);
    double height = MediaQuery.of(context).size.height / 1.5;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
      //  extendBodyBehindAppBar: true,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.blue.shade900,
                child: Stack(
                  children: [
                    Positioned(
                        left: 20,
                        right: 20,
                        top: 100,
                        child: Container(
                          color: Colors.blue.shade900,
                          // height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Hero(
                                tag: "text",
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, bottom: 10),
                                  child: Text(
                                    "Control\nPanel",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  "assets/img/profile_user.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 20),
                            height: MediaQuery.of(context).size.height/1.3,
                            curve: Curves.fastOutSlowIn,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                              ),
                              child: Container(
                                color: Colors.grey.shade50,
                                height: MediaQuery.of(context).size.height/3.5,
                                child: new GridView.builder(
                                    // physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: subsubjectList.length,
                                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                                      childAspectRatio: (MediaQuery.of(context).size.height*0.6 /
                                          MediaQuery.of(context).size.width)/1.1,
                                    ),
                                    itemBuilder: (BuildContext context, int i) {
                                      return _itemBuilder(subsubjectList[i], imagetList[i]);

                                      // return List;
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget _itemBuilder(Subjects,Images) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/bedRoom');
        },
        child: Card(

          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),),
          elevation: 2,
          child: Container(
            width: 160,
            height: 160,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    child: Image.asset(
                      Images,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    Subjects,
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "4 Lights",
                    maxLines: 3,
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
