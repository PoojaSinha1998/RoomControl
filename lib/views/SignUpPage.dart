import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_steps_animation/flutter_steps_animation.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin  ,TickerProviderStateMixin{
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _checkbox = false;
  TextEditingController userController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
// starting
  var _myValue = 0.0;
// ending
  final _myNewValue = 2.0;
  double height = 300;
  AnimationController _animationController;
  Duration duration = Duration(milliseconds: 500);
  Animation<double> scaleAnimation;
  StepsAnimation stepsAnimation;
  AnimationController _controller;
  Animation<Offset> _animation;
  Animation<Offset> _animation1;
  @override
  void initState() {
    super.initState();
    height = 300;

    _animationController = AnimationController(vsync: this, duration: duration);
    // scaleAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(_animationController);
    //TODO this is for testing purpose only remove it when release
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: const Offset(.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
    _animation1 = Tween<Offset>(
      begin: const Offset(0.0, -0.6),
      end: const Offset(.0, -0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        extendBodyBehindAppBar: true,

        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.teal.shade900,
                child: Stack(
                  children: [
                    Positioned(
                      top: 50,
                      left: 20,
                      right: 0,
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios,color: Colors.white,),
                          Text(
                            "Back",
                            style: TextStyle(
                                fontFamily: 'OpenSans', color: Colors.white, fontWeight: FontWeight.w800,fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SlideTransition(
                      position: _animation1,
                      child: Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          child: Container(
                            height: MediaQuery.of(context).size.height/3.5,
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                "assets/img/bg_img_1.png",
                                // fit: BoxFit.fitWidth,
                              ),
                            ),
                          )),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, bottom: 30),
                            child: Hero(
                              tag:"title",
                              child: Text(
                                "Create New Account",
                                style: TextStyle(
                                    fontFamily: 'OpenSans', color: Colors.white, fontWeight: FontWeight.w400,fontSize: 25),
                              ),
                            ),
                          ),
                          SlideTransition(
                            position: _animation,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 1.5,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 55,

                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top:18.0,right: 20),
                                              child: Image.asset(
                                                "assets/img/user.png",
                                                height: 20,
                                                width: 20,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Container(
                                              height: 65,
                                              width: MediaQuery.of(context).size.width-150,
                                              child: TextFormField(
                                                controller: userController,
                                                style: TextStyle(color: Colors.white),
                                                decoration: InputDecoration(
                                                    enabledBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey),
                                                    ),
                                                    focusedBorder: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey),
                                                    ),
                                                    border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey),
                                                    ),

                                                    hintText: "Username",
                                                    hintStyle:
                                                        TextStyle(color: Colors.grey)),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please enter Username';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(top:18.0,right: 20),
                                            child: Image.asset(
                                              "assets/img/lock.png",
                                              height: 20,
                                              width: 20,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Container(

                                            width: MediaQuery.of(context).size.width-150,
                                            height: 65,
                                            child: TextFormField(
                                              controller: passwordController,
                                              obscureText: !_showPassword,
                                              style: TextStyle(color: Colors.white),
                                              decoration: InputDecoration(
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                  border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                  suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _showPassword =
                                                            !_showPassword;
                                                      });
                                                    },
                                                    child: Icon(
                                                      _showPassword
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  //fillColor: Colors.green

                                                  hintText: "Password",
                                                  hintStyle:
                                                      TextStyle(color: Colors.grey)),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter Password';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(top:18.0,right: 20),
                                            child: Image.asset(
                                              "assets/img/mail.png",
                                              height: 20,
                                              width: 20,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Container(

                                            width: MediaQuery.of(context).size.width-150,
                                            height: 65,
                                            child: TextFormField(
                                              controller: emailController,
                                              style: TextStyle(color: Colors.white),
                                              decoration: InputDecoration(
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                  border: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey),
                                                  ),

                                                  //fillColor: Colors.green

                                                  hintText: "Email",
                                                  hintStyle:
                                                  TextStyle(color: Colors.grey)),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please enter Email';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            activeColor: Colors.teal,
                                            value: _checkbox,
                                            onChanged: (value) {
                                              setState(() {
                                                _checkbox = true;
                                              });
                                            },
                                          ),
                                          Text('I have accepted the',style: TextStyle(
                                            fontFamily: 'OpenSans',color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500,)),
                                          SizedBox(width: 5,),
                                          Text('Terms & Condition',style: TextStyle(
                                            fontFamily: 'OpenSans',fontSize: 15,fontWeight: FontWeight.w500,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.teal,
                                                  offset: Offset(0, -2))
                                            ],
                                            color: Colors.transparent,
                                            decoration: TextDecoration.underline,
                                            decorationColor: Colors.teal,
                                            decorationThickness: 2,
                                            decorationStyle: TextDecorationStyle.solid,
                                          ),),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {

                                          Navigator.pushNamed(context, '/loading');

                                        },
                                        child: Container(
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: <Color>[
                                                Colors.teal.shade700,
                                                Colors.teal.shade700
                                              ],
                                            ),
                                          ),
                                          child: Center(
                                              child: Text(
                                                "SIGN UP",
                                                style: TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              )),
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
