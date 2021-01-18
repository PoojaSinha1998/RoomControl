import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_steps_animation/flutter_steps_animation.dart';

class BedRoom extends StatefulWidget {
  @override
  _BedRoomState createState() => _BedRoomState();
}

class _BedRoomState extends State<BedRoom>with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _checkbox = false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  List<String> subsubjectList = new List();
  List<String> imagetList = new List();
  int valueHolder = 1;

// starting
  double _myValue = 1.0;
  bool statusred = false,
      statusgreen = false,
      statusblue = false,
      statussky = false,
      statuspurple = false,
      statusyellow = false;

// ending
  final _myNewValue = 2.0;
  double height = 300;

  StepsAnimation stepsAnimation;
  AnimationController _controller;
  AnimationController _controller1;
  Animation<Offset> _animation;
  Animation<Offset> _animation1;

  Animation<Offset> _animation2;
  Animation<Offset> _animation3;
  @override
  void initState() {
    super.initState();
    // height = Media;
    //TODO this is for testing purpose only remove it when release
    subsubjectList.add("Bed room");
    subsubjectList.add("Living room");
    subsubjectList.add("Kitchen");
    subsubjectList.add("Bathroom");

    imagetList.add("assets/img/white_bulb.png");
    imagetList.add("assets/img/white_bulb.png");
    imagetList.add("assets/img/white_bulb.png");
    imagetList.add("assets/img/white_bulb.png");

    stepsAnimation = StepsAnimationBuilder()
        .addStepBuilder(_timeAnimation(1))
       /* .addStepBuilder(_timeAnimation(2))
        .addStepBuilder(_timeAnimation(3))*/
        // .addStepBuilder(_multipleAnimation())
        // .addStepBuilder(_waitStep(2))
       .addStepBuilder(_moreStepsAnimation())
        .animation(this);

    _playAnimation(stepsAnimation.controller);

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(0.9, 0.0),
      end: const Offset(.3, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));

    _animation1 = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(.0, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.easeInCubic,
    ));
    _animation2 = Tween<Offset>(
      begin: const Offset(0.9, 0.0),
      end: const Offset(.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.easeInCubic,
    ));
    _animation3 = Tween<Offset>(
      begin: const Offset(0.1, 0.0),
      end: const Offset(.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.easeInCubic,
    ));
  }
  Future<Null> _playAnimation(AnimationController controller) async {
    try {
      await controller.forward().orCancel;
      await controller.reverse().orCancel;
//      controller.reset();
    } on TickerCanceled {}
  }

  @override
  void dispose() {
    stepsAnimation.controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height / 1.3;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          // physics:AlwaysScrollableScrollPhysics(),
          child: GestureDetector(
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
                      right: 0,
                      top: 70,
                      child: Container(
                        color: Colors.blue.shade900,
                        // height: 150,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Hero(
                                  tag: "text",

                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, bottom: 10),
                                    child: Text(
                                      "Bed\nRoom",
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 30),
                                  child: Column(
                                    children: [
                                      Opacity(
                                        opacity: _myValue,
                                        child: Container(
                                          height: 15,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            // shape: BoxShape.circle,
                                            // color: Colors.black.withOpacity(0.6),
                                            borderRadius: new BorderRadius.only(
                                              bottomLeft: Radius.circular(25),
                                              bottomRight: Radius.circular(25),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: statusred
                                                    ? Colors.pink.withAlpha(125)
                                                    : statusgreen
                                                        ? Colors.green
                                                            .withAlpha(125)
                                                        : statusblue
                                                            ? Colors.blue
                                                                .withAlpha(125)
                                                            : statussky
                                                                ? Colors
                                                                    .lightBlue
                                                                    .withAlpha(
                                                                        125)
                                                                : statuspurple
                                                                    ? Colors
                                                                        .purple
                                                                        .shade300
                                                                    : statusyellow
                                                                        ? Colors
                                                                            .yellow
                                                                            .withAlpha(
                                                                                125)
                                                                        : Colors
                                                                            .white
                                                                            .withAlpha(125),
                                                blurRadius: 35,
                                                spreadRadius: 25,
                                                offset: Offset(1, 0),
                                              )
                                            ],
                                            gradient: statusred
                                                ? LinearGradient(
                                                    colors: [
                                                        Colors.pink,
                                                        Colors.pink,
                                                      ],
                                                    begin:
                                                        Alignment.centerRight,
                                                    end: Alignment.centerLeft)
                                                : statusgreen
                                                    ? LinearGradient(
                                                        colors: [
                                                            Colors.green,
                                                            Colors.green,
                                                          ],
                                                        begin: Alignment
                                                            .centerRight,
                                                        end: Alignment
                                                            .centerLeft)
                                                    : statusblue
                                                        ? LinearGradient(
                                                            colors: [
                                                                Colors.blue,
                                                                Colors.blue,
                                                              ],
                                                            begin: Alignment
                                                                .centerRight,
                                                            end: Alignment
                                                                .centerLeft)
                                                        : statussky
                                                            ? LinearGradient(
                                                                colors: [
                                                                    Colors
                                                                        .lightBlue,
                                                                    Colors
                                                                        .lightBlue,
                                                                  ],
                                                                begin: Alignment
                                                                    .centerRight,
                                                                end: Alignment
                                                                    .centerLeft)
                                                            : statuspurple
                                                                ? LinearGradient(
                                                                    colors: [
                                                                        Colors
                                                                            .purple,
                                                                        Colors
                                                                            .purple,
                                                                      ],
                                                                    begin: Alignment
                                                                        .centerRight,
                                                                    end: Alignment
                                                                        .centerLeft)
                                                                : statusyellow
                                                                    ? LinearGradient(
                                                                        colors: [
                                                                            Colors.yellow,
                                                                            Colors.yellow,
                                                                          ],
                                                                        begin: Alignment
                                                                            .centerRight,
                                                                        end: Alignment
                                                                            .centerLeft)
                                                                    : LinearGradient(
                                                                        colors: [
                                                                            Colors.white,
                                                                            Colors.white,
                                                                          ],
                                                                        begin: Alignment
                                                                            .centerRight,
                                                                        end: Alignment
                                                                            .centerLeft),
                                            // borderRadius: BorderRadius.circular(15),
                                            /* gradient: LinearGradient(
                                                    tileMode: TileMode.repeated,
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    // startAngle: 1.7,
                                                    // endAngle: 3,
                                                    stops: [
                                                      0.1,
                                                      0.4,
                                                      0.6,
                                                      0.9
                                                    ],
                                                    colors: [
                                                      Colors.white.withOpacity(0.2),
                                                      Colors.white.withOpacity(0.5),
                                                      Colors.white.withOpacity(0.6),
                                                      Colors.white
                                                    ])*/
                                          ),
                                        ),
                                      ),
                                      /* Align(
                                        alignment: Alignment.topRight,
                                        child: Image.asset(
                                          "assets/img/profile_user.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),*/
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SlideTransition(
                              position: _animation,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: new EdgeInsets.only(bottom: 10, top: 0),
                                padding: new EdgeInsets.only(bottom: 0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        height: 50,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: subsubjectList.length,
                                            itemBuilder: (context, index) {
                                              return Center(
                                                child: Container(
                                                  margin: new EdgeInsets.only(
                                                      top: 1,
                                                      left: 20,
                                                      bottom: 0,
                                                      right: 1),
                                                  // width: 130,
                                                  child: Container(
                                                    // height: 20,
                                                    // width: 50,
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child:
                                                        Wrap(children: <Widget>[
                                                      Container(
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  "assets/img/surfacebulb.png",
                                                                  height: 20,
                                                                  width: 20,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                                Text(
                                                                  subsubjectList[
                                                                      index],
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'OpenSans',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                    ]),
                                                    decoration:
                                                        const BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: <Color>[
                                                                Colors.white,
                                                                Colors.white
                                                              ],
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0))),
                                                  ),
                                                ),
                                              );
                                            })),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SlideTransition(
                      position: _animation1,
                      // animation: stepsAnimation.controller,
                      // builder: stepsAnimation.builder,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedContainer(
                                duration: Duration(seconds: 20),
                                height: height,
                                curve: Curves.fastOutSlowIn,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(45),
                                    topRight: Radius.circular(45),
                                  ),
                                  child: Container(
                                    color: Colors.grey.shade50,
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Intensity",
                                            maxLines: 3,
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SlideTransition(
                                            position: _animation2,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Image.asset(
                                                  "assets/img/solution.png",
                                                  height: 20,
                                                  width: 20,
                                                  fit: BoxFit.contain,
                                                ),
                                                Expanded(
                                                  child: Slider(
                                                      value: valueHolder.toDouble(),
                                                      min: 1.0,
                                                      max: 10.0,
                                                      divisions: 5,
                                                      // divisions: 100,
                                                      activeColor: Colors.teal,
                                                      inactiveColor: Colors.grey,
                                                      // label: '${valueHolder.round()}',
                                                      onChanged: (double newValue) {
                                                        setState(() {
                                                          valueHolder =
                                                              newValue.round();
                                                          _myValue = valueHolder /
                                                              10.toDouble();
                                                          print(
                                                              "value ${valueHolder / 10}");
                                                        });
                                                      },
                                                      semanticFormatterCallback:
                                                          (double newValue) {
                                                        return '${newValue.round()}';
                                                      }),
                                                ),
                                                Image.asset(
                                                  "assets/img/solution_1.png",
                                                  height: 20,
                                                  width: 20,
                                                  fit: BoxFit.contain,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "Colors",
                                            maxLines: 3,
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    statusred = true;
                                                    statusgreen = false;
                                                    statusblue = false;
                                                    statussky = false;
                                                    statuspurple = false;
                                                    statusyellow = false;
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.pink,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    statusred = false;
                                                    statusgreen = true;
                                                    statusblue = false;
                                                    statussky = false;
                                                    statuspurple = false;
                                                    statusyellow = false;
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    statusred = false;
                                                    statusgreen = false;
                                                    statusblue = true;
                                                    statussky = false;
                                                    statuspurple = false;
                                                    statusyellow = false;
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    statusred = false;
                                                    statusgreen = false;
                                                    statusblue = false;
                                                    statussky = true;
                                                    statuspurple = false;
                                                    statusyellow = false;
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.lightBlue,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    statusred = false;
                                                    statusgreen = false;
                                                    statusblue = false;
                                                    statussky = false;
                                                    statuspurple = true;
                                                    statusyellow = false;
                                                    setState(() {
                                                      print(
                                                          "purple ${statuspurple}");
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.purple,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    statusred = false;
                                                    statusgreen = false;
                                                    statusblue = false;
                                                    statussky = false;
                                                    statuspurple = false;
                                                    statusyellow = true;
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.yellow,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Screens",
                                            maxLines: 3,
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 100,
                                                  child: Center(
                                                      child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 50,
                                                        width: 150,
                                                        padding:
                                                            const EdgeInsets.all(
                                                                8),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Image.asset(
                                                              "assets/img/white_bulb.png",
                                                              height: 20,
                                                              width: 20,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            const Text('Birthday',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'OpenSans',
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.white,
                                                                    fontSize:
                                                                        15)),
                                                          ],
                                                        ),
                                                        decoration:
                                                            const BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: <Color>[
                                                                    Colors
                                                                        .deepOrange,
                                                                    Colors
                                                                        .deepOrangeAccent

                                                                  ],
                                                                ),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0))),
                                                      ),
                                                      Container(
                                                        height: 50,
                                                        width: 150,
                                                        padding:
                                                            const EdgeInsets.all(
                                                                8),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Image.asset(
                                                              "assets/img/white_bulb.png",
                                                              height: 20,
                                                              width: 20,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            const Text('Party',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'OpenSans',fontWeight: FontWeight.bold,
                                                                    color: Colors.white,
                                                                    fontSize:
                                                                        15)),
                                                          ],
                                                        ),
                                                        decoration:
                                                            const BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: <Color>[
                                                                    Colors.purple,
                                                                    Colors
                                                                        .purpleAccent
                                                                  ],
                                                                ),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0))),
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                                Container(
                                                  height: 100,
                                                  child: Center(
                                                      child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    verticalDirection:
                                                        VerticalDirection.up,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 50,
                                                        width: 150,
                                                        padding:
                                                            const EdgeInsets.all(
                                                                8),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            Image.asset(
                                                              "assets/img/white_bulb.png",
                                                              height: 20,
                                                              width: 20,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            Text('Relax',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'OpenSans',fontWeight: FontWeight.bold,
                                                                    color: Colors.white,
                                                                    fontSize:
                                                                        15)),
                                                          ],
                                                        ),
                                                        decoration:
                                                            const BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: <Color>[

                                                                    Colors.blue,
                                                                    Colors
                                                                        .lightBlueAccent
                                                                  ],
                                                                ),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0))),
                                                      ),
                                                      Container(
                                                        height: 50,
                                                        width: 150,
                                                        padding:
                                                            const EdgeInsets.all(
                                                                8),
                                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,

                                                          children: [
                                                            Image.asset(
                                                              "assets/img/white_bulb.png",
                                                              height: 20,
                                                              width: 20,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            const Text('Fun',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'OpenSans',fontWeight: FontWeight.bold,
                                                                    color: Colors.white,
                                                                    fontSize:
                                                                        15)),
                                                          ],
                                                        ),
                                                        decoration:
                                                            const BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: <Color>[
                                                                    Colors.green,
                                                                    Colors
                                                                        .greenAccent
                                                                  ],
                                                                ),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10.0))),
                                                      ),
                                                    ],
                                                  )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: MediaQuery.of(context).size.height / 3.5,
                    child: SlideTransition(
                      position: _animation3,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/img/logout.png",
                              height: 20,
                              width: 20,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*AnimatedBuilder(
                    animation: stepsAnimation.controller,
                    builder: stepsAnimation.builder,
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(Subjects, Images) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/bedRoom');
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
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
                    height: 50,
                    child: Image.asset(
                      Images,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    Subjects,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "4 Lights",
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SingleAnimationBuilder _timeAnimation(int number) {
    final duration = Duration(milliseconds: 1000);
    return SingleAnimationBuilder(
      duration: duration,
      buildInfo: SingleAnimationBuildInfo(
          animatable: Tween<double>(begin: 20, end: 30),
          from: Duration.zero,
          duration: duration),
      buildAnimation: (context, data) {
        return Container(
          // height: MediaQuery.of(context).size.height/3,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 20),
                    height: MediaQuery.of(context).size.height / 1.3,
                    curve: Curves.fastOutSlowIn,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                      child: Container(
                        color: Colors.grey.shade50,
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Intensity",
                                maxLines: 3,
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/img/solution.png",
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.contain,
                                  ),
                                  Expanded(
                                    child: Slider(
                                        value: valueHolder.toDouble(),
                                        min: 1.0,
                                        max: 10.0,
                                        divisions: 5,
                                        // divisions: 100,
                                        activeColor: Colors.teal,
                                        inactiveColor: Colors.grey,
                                        // label: '${valueHolder.round()}',
                                        onChanged: (double newValue) {
                                          setState(() {
                                            valueHolder =
                                                newValue.round();
                                            _myValue = valueHolder /
                                                10.toDouble();
                                            print(
                                                "value ${valueHolder / 10}");
                                          });
                                        },
                                        semanticFormatterCallback:
                                            (double newValue) {
                                          return '${newValue.round()}';
                                        }),
                                  ),
                                  Image.asset(
                                    "assets/img/solution_1.png",
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                              Text(
                                "Colors",
                                maxLines: 3,
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      statusred = true;
                                      statusgreen = false;
                                      statusblue = false;
                                      statussky = false;
                                      statuspurple = false;
                                      statusyellow = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.pink,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width:10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      statusred = false;
                                      statusgreen = true;
                                      statusblue = false;
                                      statussky = false;
                                      statuspurple = false;
                                      statusyellow = false;
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      statusred = false;
                                      statusgreen = false;
                                      statusblue = true;
                                      statussky = false;
                                      statuspurple = false;
                                      statusyellow = false;
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      statusred = false;
                                      statusgreen = false;
                                      statusblue = false;
                                      statussky = true;
                                      statuspurple = false;
                                      statusyellow = false;
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      statusred = false;
                                      statusgreen = false;
                                      statusblue = false;
                                      statussky = false;
                                      statuspurple = true;
                                      statusyellow = false;
                                      setState(() {
                                        print(
                                            "purple ${statuspurple}");
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      statusred = false;
                                      statusgreen = false;
                                      statusblue = false;
                                      statussky = false;
                                      statuspurple = false;
                                      statusyellow = true;
                                      setState(() {});
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:10,
                                  ),
                                ],
                              ),
                              Text(
                                "Screens",
                                maxLines: 3,
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Container(
                                width:
                                MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 100,
                                      child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: 50,
                                                width: 150,
                                                padding:
                                                const EdgeInsets.all(
                                                    8),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/img/white_bulb.png",
                                                      height: 20,
                                                      width: 20,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    const Text('Birthday',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'OpenSans',
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize:
                                                            20)),
                                                  ],
                                                ),
                                                decoration:
                                                const BoxDecoration(
                                                    gradient:
                                                    LinearGradient(
                                                      colors: <Color>[
                                                        Colors.purple,
                                                        Colors
                                                            .purpleAccent
                                                      ],
                                                    ),
                                                    borderRadius: BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        10.0))),
                                              ),
                                              Container(
                                                height: 50,
                                                width: 150,
                                                padding:
                                                const EdgeInsets.all(
                                                    8),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/img/white_bulb.png",
                                                      height: 20,
                                                      width: 20,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    const Text('Party',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'OpenSans',fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize:
                                                            20)),
                                                  ],
                                                ),
                                                decoration:
                                                const BoxDecoration(
                                                    gradient:
                                                    LinearGradient(
                                                      colors: <Color>[
                                                        Colors
                                                            .deepOrange,
                                                        Colors
                                                            .deepOrangeAccent
                                                      ],
                                                    ),
                                                    borderRadius: BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        10.0))),
                                              ),
                                            ],
                                          )),
                                    ),
                                    Container(
                                      height: 100,
                                      child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            verticalDirection:
                                            VerticalDirection.up,
                                            children: <Widget>[
                                              Container(
                                                height: 50,
                                                width: 150,
                                                padding:
                                                const EdgeInsets.all(
                                                    8),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/img/white_bulb.png",
                                                      height: 20,
                                                      width: 20,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    Text('Relax',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'OpenSans',fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize:
                                                            20)),
                                                  ],
                                                ),
                                                decoration:
                                                const BoxDecoration(
                                                    gradient:
                                                    LinearGradient(
                                                      colors: <Color>[
                                                        Colors.green,
                                                        Colors
                                                            .greenAccent
                                                      ],
                                                    ),
                                                    borderRadius: BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        10.0))),
                                              ),
                                              Container(
                                                height: 50,
                                                width: 150,
                                                padding:
                                                const EdgeInsets.all(
                                                    8),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/img/white_bulb.png",
                                                      height: 20,
                                                      width: 20,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    const Text('Fun',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'OpenSans',fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize:
                                                            20)),
                                                  ],
                                                ),
                                                decoration:
                                                const BoxDecoration(
                                                    gradient:
                                                    LinearGradient(
                                                      colors: <Color>[
                                                        Colors.blue,
                                                        Colors
                                                            .lightBlueAccent
                                                      ],
                                                    ),
                                                    borderRadius: BorderRadius
                                                        .all(Radius
                                                        .circular(
                                                        10.0))),
                                              ),
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  MultipleAnimationBuilder _multipleAnimation() {
    final duration = Duration(seconds: 100);
    final builder = MultipleAnimationBuilder(
        duration: duration,
        buildAnimation: (context, map) {
          return ClipRRect(
            borderRadius:
            BorderRadius.all(Radius.circular(map['radius'].value)),
            child: Container(
              height: 400,
              width: map['width'].value,
              // color: color,
             /* child: Center(
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: Duration(seconds: 20),
                          height: height,
                          curve: Curves.fastOutSlowIn,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45),
                            ),
                            child: Container(
                              color: Colors.grey.shade50,
                              height:
                              MediaQuery.of(context).size.height / 3,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Intensity",
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          "assets/img/solution.png",
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.contain,
                                        ),
                                        Expanded(
                                          child: Slider(
                                              value: valueHolder.toDouble(),
                                              min: 1.0,
                                              max: 10.0,
                                              divisions: 5,
                                              // divisions: 100,
                                              activeColor: Colors.teal,
                                              inactiveColor: Colors.grey,
                                              // label: '${valueHolder.round()}',
                                              onChanged: (double newValue) {
                                                setState(() {
                                                  valueHolder =
                                                      newValue.round();
                                                  _myValue = valueHolder /
                                                      10.toDouble();
                                                  print(
                                                      "value ${valueHolder / 10}");
                                                });
                                              },
                                              semanticFormatterCallback:
                                                  (double newValue) {
                                                return '${newValue.round()}';
                                              }),
                                        ),
                                        Image.asset(
                                          "assets/img/solution_1.png",
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.contain,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Colors",
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            statusred = true;
                                            statusgreen = false;
                                            statusblue = false;
                                            statussky = false;
                                            statuspurple = false;
                                            statusyellow = false;
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.pink,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            statusred = false;
                                            statusgreen = true;
                                            statusblue = false;
                                            statussky = false;
                                            statuspurple = false;
                                            statusyellow = false;
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            statusred = false;
                                            statusgreen = false;
                                            statusblue = true;
                                            statussky = false;
                                            statuspurple = false;
                                            statusyellow = false;
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            statusred = false;
                                            statusgreen = false;
                                            statusblue = false;
                                            statussky = true;
                                            statuspurple = false;
                                            statusyellow = false;
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.lightBlue,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            statusred = false;
                                            statusgreen = false;
                                            statusblue = false;
                                            statussky = false;
                                            statuspurple = true;
                                            statusyellow = false;
                                            setState(() {
                                              print(
                                                  "purple ${statuspurple}");
                                            });
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.purple,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            statusred = false;
                                            statusgreen = false;
                                            statusblue = false;
                                            statussky = false;
                                            statuspurple = false;
                                            statusyellow = true;
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Screens",
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 100,
                                            child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 50,
                                                      width: 150,
                                                      padding:
                                                      const EdgeInsets.all(
                                                          8),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/img/white_bulb.png",
                                                            height: 20,
                                                            width: 20,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          const Text('Birthday',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'OpenSans',
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                  fontSize:
                                                                  20)),
                                                        ],
                                                      ),
                                                      decoration:
                                                      const BoxDecoration(
                                                          gradient:
                                                          LinearGradient(
                                                            colors: <Color>[
                                                              Colors.purple,
                                                              Colors
                                                                  .purpleAccent
                                                            ],
                                                          ),
                                                          borderRadius: BorderRadius
                                                              .all(Radius
                                                              .circular(
                                                              10.0))),
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      width: 150,
                                                      padding:
                                                      const EdgeInsets.all(
                                                          8),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/img/white_bulb.png",
                                                            height: 20,
                                                            width: 20,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          const Text('Party',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'OpenSans',fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                  fontSize:
                                                                  20)),
                                                        ],
                                                      ),
                                                      decoration:
                                                      const BoxDecoration(
                                                          gradient:
                                                          LinearGradient(
                                                            colors: <Color>[
                                                              Colors
                                                                  .deepOrange,
                                                              Colors
                                                                  .deepOrangeAccent
                                                            ],
                                                          ),
                                                          borderRadius: BorderRadius
                                                              .all(Radius
                                                              .circular(
                                                              10.0))),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                          Container(
                                            height: 100,
                                            child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  verticalDirection:
                                                  VerticalDirection.up,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 50,
                                                      width: 150,
                                                      padding:
                                                      const EdgeInsets.all(
                                                          8),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/img/white_bulb.png",
                                                            height: 20,
                                                            width: 20,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          Text('Relax',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'OpenSans',fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                  fontSize:
                                                                  20)),
                                                        ],
                                                      ),
                                                      decoration:
                                                      const BoxDecoration(
                                                          gradient:
                                                          LinearGradient(
                                                            colors: <Color>[
                                                              Colors.green,
                                                              Colors
                                                                  .greenAccent
                                                            ],
                                                          ),
                                                          borderRadius: BorderRadius
                                                              .all(Radius
                                                              .circular(
                                                              10.0))),
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      width: 150,
                                                      padding:
                                                      const EdgeInsets.all(
                                                          8),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/img/white_bulb.png",
                                                            height: 20,
                                                            width: 20,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          const Text('Fun',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'OpenSans',fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                  fontSize:
                                                                  20)),
                                                        ],
                                                      ),
                                                      decoration:
                                                      const BoxDecoration(
                                                          gradient:
                                                          LinearGradient(
                                                            colors: <Color>[
                                                              Colors.blue,
                                                              Colors
                                                                  .lightBlueAccent
                                                            ],
                                                          ),
                                                          borderRadius: BorderRadius
                                                              .all(Radius
                                                              .circular(
                                                              10.0))),
                                                    ),
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),*/
            ),
          );
        });
    builder.addAnimatable(
        animatable: Tween<double>(begin: 100, end: 600),
        from: Duration.zero,
        duration: Duration(seconds: 700),
        key: 'height');
       /* .addAnimatable(
        animatable: Tween<double>(begin: 400, end: 100),
        from: Duration(seconds: 5),
        duration: Duration(seconds: 5),
        key: 'height')
        .addAnimatable(
        animatable: Tween<double>(begin: 400, end: 150),
        from: Duration.zero,
        duration: Duration(seconds: 4),
        key: 'width')
        .addAnimatable(
        animatable: Tween<double>(begin: 150, end: 400),
        from: Duration(seconds: 5),
        duration: Duration(seconds: 3),
        key: 'width')
        .addAnimatable(
        animatable: ColorTween(
            begin: Colors.green[400], end: Colors.yellowAccent[700]),
        from: Duration(seconds: 2),
        duration: Duration(seconds: 4),
        key: 'color')
        .addAnimatable(
        animatable: ColorTween(
            begin: Colors.yellowAccent[700], end: Colors.red[800]),
        from: Duration(seconds: 7),
        duration: Duration(seconds: 3),
        key: 'color')
        .addAnimatable(
        animatable: Tween<double>(begin: 0, end: 200),
        from: Duration(seconds: 3),
        duration: Duration(seconds: 2),
        key: 'radius')
        .addAnimatable(
        animatable: Tween<double>(begin: 200, end: 0),
        from: Duration(seconds: 6),
        duration: Duration(seconds: 3),
        key: 'radius');*/
    return builder;
  }

  NoneAnimationBuilder _waitStep(int second) {
    return NoneAnimationBuilder(
        duration: Duration(seconds: second),
        builder: (context) {
          return Container(
            color: Colors.black,
            height: 100,
            width: 400,
            child: Center(
              child: Text(
                'just wait ${second}s',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  SingleAnimationBuilder _moreStepsAnimation() {
    return SingleAnimationBuilder(duration: Duration(seconds: 10), buildAnimation: (context, animation) {
        return Container(
          // color: Colors.black,
          // height: MediaQuery.of(context).size.height/1.5,
          // width: 400,
          child: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 20),
                      height:  MediaQuery.of(context).size.height/1.5,
                      curve: Curves.fastOutSlowIn,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                        child: Container(
                          color: Colors.grey.shade50,
                          height: MediaQuery.of(context).size.height /1.5,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Intensity",
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/img/solution.png",
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.contain,
                                    ),
                                    Expanded(
                                      child: Slider(
                                          value: valueHolder.toDouble(),
                                          min: 1.0,
                                          max: 10.0,
                                          divisions: 5,
                                          // divisions: 100,
                                          activeColor: Colors.teal,
                                          inactiveColor: Colors.grey,
                                          // label: '${valueHolder.round()}',
                                          onChanged: (double newValue) {
                                            setState(() {
                                              valueHolder =
                                                  newValue.round();
                                              _myValue = valueHolder /
                                                  10.toDouble();
                                              print(
                                                  "value ${valueHolder / 10}");
                                            });
                                          },
                                          semanticFormatterCallback:
                                              (double newValue) {
                                            return '${newValue.round()}';
                                          }),
                                    ),
                                    Image.asset(
                                      "assets/img/solution_1.png",
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                                Text(
                                  "Colors",
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        statusred = true;
                                        statusgreen = false;
                                        statusblue = false;
                                        statussky = false;
                                        statuspurple = false;
                                        statusyellow = false;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.pink,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        statusred = false;
                                        statusgreen = true;
                                        statusblue = false;
                                        statussky = false;
                                        statuspurple = false;
                                        statusyellow = false;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        statusred = false;
                                        statusgreen = false;
                                        statusblue = true;
                                        statussky = false;
                                        statuspurple = false;
                                        statusyellow = false;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        statusred = false;
                                        statusgreen = false;
                                        statusblue = false;
                                        statussky = true;
                                        statuspurple = false;
                                        statusyellow = false;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        statusred = false;
                                        statusgreen = false;
                                        statusblue = false;
                                        statussky = false;
                                        statuspurple = true;
                                        statusyellow = false;
                                        setState(() {
                                          print(
                                              "purple ${statuspurple}");
                                        });
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        statusred = false;
                                        statusgreen = false;
                                        statusblue = false;
                                        statussky = false;
                                        statuspurple = false;
                                        statusyellow = true;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Screens",
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 100,
                                        child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  height: 50,
                                                  width: 150,
                                                  padding:
                                                  const EdgeInsets.all(
                                                      8),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/img/white_bulb.png",
                                                        height: 20,
                                                        width: 20,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      const Text('Birthday',
                                                          style: TextStyle(
                                                              fontFamily:
                                                              'OpenSans',
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.white,
                                                              fontSize:
                                                              20)),
                                                    ],
                                                  ),
                                                  decoration:
                                                  const BoxDecoration(
                                                      gradient:
                                                      LinearGradient(
                                                        colors: <Color>[
                                                          Colors.purple,
                                                          Colors
                                                              .purpleAccent
                                                        ],
                                                      ),
                                                      borderRadius: BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10.0))),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 150,
                                                  padding:
                                                  const EdgeInsets.all(
                                                      8),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/img/white_bulb.png",
                                                        height: 20,
                                                        width: 20,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      const Text('Party',
                                                          style: TextStyle(
                                                              fontFamily:
                                                              'OpenSans',fontWeight: FontWeight.bold,
                                                              color: Colors.white,
                                                              fontSize:
                                                              20)),
                                                    ],
                                                  ),
                                                  decoration:
                                                  const BoxDecoration(
                                                      gradient:
                                                      LinearGradient(
                                                        colors: <Color>[
                                                          Colors
                                                              .deepOrange,
                                                          Colors
                                                              .deepOrangeAccent
                                                        ],
                                                      ),
                                                      borderRadius: BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10.0))),
                                                ),
                                              ],
                                            )),
                                      ),
                                      Container(
                                        height: 100,
                                        child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              verticalDirection:
                                              VerticalDirection.up,
                                              children: <Widget>[
                                                Container(
                                                  height: 50,
                                                  width: 150,
                                                  padding:
                                                  const EdgeInsets.all(
                                                      8),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/img/white_bulb.png",
                                                        height: 20,
                                                        width: 20,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      Text('Relax',
                                                          style: TextStyle(
                                                              fontFamily:
                                                              'OpenSans',fontWeight: FontWeight.bold,
                                                              color: Colors.white,
                                                              fontSize:
                                                              20)),
                                                    ],
                                                  ),
                                                  decoration:
                                                  const BoxDecoration(
                                                      gradient:
                                                      LinearGradient(
                                                        colors: <Color>[
                                                          Colors.green,
                                                          Colors
                                                              .greenAccent
                                                        ],
                                                      ),
                                                      borderRadius: BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10.0))),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 150,
                                                  padding:
                                                  const EdgeInsets.all(
                                                      8),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/img/white_bulb.png",
                                                        height: 20,
                                                        width: 20,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      const Text('Fun',
                                                          style: TextStyle(
                                                              fontFamily:
                                                              'OpenSans',fontWeight: FontWeight.bold,
                                                              color: Colors.white,
                                                              fontSize:
                                                              20)),
                                                    ],
                                                  ),
                                                  decoration:
                                                  const BoxDecoration(
                                                      gradient:
                                                      LinearGradient(
                                                        colors: <Color>[
                                                          Colors.blue,
                                                          Colors
                                                              .lightBlueAccent
                                                        ],
                                                      ),
                                                      borderRadius: BorderRadius
                                                          .all(Radius
                                                          .circular(
                                                          10.0))),
                                                ),
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
        );
      },
      buildInfo: SingleAnimationBuildInfo(
        animatable: Tween<double>(begin: 0, end: 100),
        from: Duration.zero,
        duration: Duration(seconds: 5),
      ),
    );
  }
}

class SubjectsforLabelWidget extends StatelessWidget {
  String Subjects;
  String Images;

  SubjectsforLabelWidget({this.Subjects, this.Images});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
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
                    height: 50,
                    child: Image.asset(
                      Images,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    Subjects,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "4 Lights",
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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

class _MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(0, size.height * 0.8);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
