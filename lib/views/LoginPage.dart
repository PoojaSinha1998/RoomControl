import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_steps_animation/flutter_steps_animation.dart';
import 'package:room_control/views/SignUpPage.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin,TickerProviderStateMixin{
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  AnimationController controller;
  Animation<Offset> _offsetAnimation;

  bool _checkbox = false;
  AnimationController _animationController;
  Duration duration = Duration(milliseconds: 500);
  Animation<double> scaleAnimation;
  bool makesignup = false;
  bool makelogin = true;
  StepsAnimation stepsAnimation;
  AnimationController _controller;
  AnimationController _controller1;
  Animation<Offset> _animation;
  Animation<Offset> _animation1;

  Animation<Offset> _animation2;
  Animation<Offset> _animation3;
  // SlideUpController slideUpController = SlideUpController();
  // double height = 400;
  Animation<double> _fadeAnimation;
  void initState() {
    super.initState();


    _animationController = AnimationController(vsync: this, duration: duration);
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);;
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _controller1 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: const Offset(.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
    _animation3 = Tween<Offset>(
      begin: const Offset(0.0, -0.6),
      end: const Offset(.0, -0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                        left: 0,
                        right: 0,
                        top: 0,
                        child: SlideTransition(
                          position: _animation3,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 400,
                              child: Image.asset(
                                "assets/img/bg_img_2.png",
                                // fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SlideTransition(
                        position: _animation,
                        child: Visibility(
                          visible: makelogin,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, bottom: 10),
                                child: Container(
                                  width: 45,
                                  height: 5,
                                  child: Divider(
                                    height: 5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, bottom: 10),
                                child: Hero(
                                  tag:"title",
                                  child: Text(
                                    "Welcome",
                                    style: TextStyle(fontFamily: 'OpenSans', color: Colors.white, fontWeight: FontWeight.w600,fontSize: 25),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, bottom: 10),
                                child: Text(
                                  "to Daily UI Challenge",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans', color: Colors.white, fontWeight: FontWeight.w300,fontSize: 25
                                      ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 2.1,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SlideTransition(
                                          position: _animation,
                                          child: Container(
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
                                                    controller: emailController,
                                                    style: TextStyle(fontFamily: 'OpenSans', color: Colors.black, fontWeight: FontWeight.w600,fontSize: 15),
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
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SlideTransition(
                                          position: _animation,
                                          child: Row(
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
                                                  style: TextStyle(color: Colors.black,fontFamily: 'OpenSans',fontWeight: FontWeight.w600,fontSize: 15),
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
                                                          color: Colors.blueGrey,
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
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        SlideTransition(
                                          position: _animation,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (passwordController.text!="" && emailController.text!="") {

                                                  Toast.show(
                                                      'Login Successfully...', context,
                                                      duration: Toast.LENGTH_LONG,
                                                      gravity: Toast.CENTER);
                                                  // Navigator.pushNamed(context, '/signUpPage');
                                                  // 1234
                                                }
                                               /* else
                                                  {
                                                    Toast.show(
                                                        'Login Successfully...', context,
                                                        duration: Toast.LENGTH_LONG,
                                                        gravity: Toast.CENTER);
                                                  }*/
                                              });
                                            },
                                            child: Container(
                                              width:
                                                  MediaQuery.of(context).size.width-100,
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
                                                "SIGN IN",
                                                style: TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,fontSize: 18),
                                              )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.pushNamed(context, '/signUpPage');

                                           /* setState(() {
                                              makesignup = true;
                                              makelogin = false;
                                            });*/
                                            // Navigator.of(context).push(_createRoute());
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Don't have an account? ",
                                                style: TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                "SIGN UP",
                                                style: TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    color: Colors.teal,
                                                    fontWeight: FontWeight.bold),
                                              ),
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
                        ),
                      ),
                    ),
                  /*  Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        child: Visibility(
                          visible: makesignup,
                          child: Container(
                            // height: 200,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                "assets/img/bg_img_1.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Visibility(
                        visible: makesignup,
                        child: AnimatedPositioned(
                          duration: duration,
                          // top:150,
                          bottom: 0,
                          left:  0.0,
                          right:  0.0,
                          child: ScaleTransition(

                            scale:scaleAnimation,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 10),
                                  child: Container(
                                    width: 25,
                                    child: Divider(
                                      height: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 10),
                                  child: Text(
                                    "Welcome",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15.0, bottom: 10),
                                  child: Text(
                                    "to Room Control",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: Duration(seconds: 20),
                                  height: height,
                                  curve: Curves.fastOutSlowIn,
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
                                                    const EdgeInsets.only(top:18.0,right: 8),
                                                    child: Image.asset(
                                                      "assets/img/user.png",
                                                      height: 20,
                                                      width: 20,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 55,
                                                    width: MediaQuery.of(context).size.width-100,
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
                                                  const EdgeInsets.only(top:18.0,right: 8),
                                                  child: Image.asset(
                                                    "assets/img/lock.png",
                                                    height: 20,
                                                    width: 20,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Container(

                                                  width: MediaQuery.of(context).size.width-100,
                                                  height: 55,
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
                                                  const EdgeInsets.only(top:18.0,right: 8),
                                                  child: Image.asset(
                                                    "assets/img/mail.png",
                                                    height: 20,
                                                    width: 20,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Container(

                                                  width: MediaQuery.of(context).size.width-100,
                                                  height: 55,
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
                                            SizedBox(
                                              height: 25,
                                            ),

                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Checkbox(
                                                  value: _checkbox,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _checkbox = true;
                                                    });
                                                  },
                                                ),
                                                Text('I have accepted the'),
                                                SizedBox(width: 5,),
                                                Text('Terms & Condition',style: TextStyle(
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
                                                          color: Colors.white,
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
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignUpPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.fastOutSlowIn;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
