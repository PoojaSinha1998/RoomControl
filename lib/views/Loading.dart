import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>with SingleTickerProviderStateMixin {
  bool _loadingInProgress;

  AnimationController _controller;
  Animation<Offset> _animation;
  Animation<Offset> _animation1;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {

    Navigator.pushNamed(context, '/homePage');
   // exitapp();

  }
  @override
  void initState() {
    super.initState();
    _loadingInProgress = true;
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _animation = Tween<Offset>(
      begin: const Offset(0.0, -0.6),
      end: const Offset(.0, -0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
    _animation1 = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: const Offset(.0, 0.7),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));

    /*_controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _angleAnimation = new Tween(begin: 0.0, end: 360.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    _scaleAnimation = new Tween(begin: 1.0, end: 6.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    _angleAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_loadingInProgress) {
          _controller.reverse();
        }
      } else if (status == AnimationStatus.dismissed) {
        if (_loadingInProgress) {
          _controller.forward();
        }
      }
    });

    _controller.forward();*/

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 1.5;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal.shade900,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SlideTransition(
              position: _animation,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.teal.shade900,
                child: Stack(
                  children: [
                    Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        child: AnimatedContainer(

                          duration: Duration(seconds: 3),

                          child: Container(
                            // height: MediaQuery.of(context).size.height/2,
                            child: Image.asset(
                              "assets/img/bg_img_2.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        )),
                    SlideTransition(
                      position: _animation1,
                      child: Positioned(
                        left: 0,
                        right: 0,
                        bottom: 170,
                        child: Column(
                          children: [
                            SpinKitFadingFour(
                                color: Colors.white, shape: BoxShape.circle),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Let's get you started.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void exitapp() {
    Navigator.pop(context);
  }
}
