// Dart imports:
import "dart:async";

// Flutter imports:
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";

// Package imports:
import "package:provider/provider.dart";
import 'package:zapp_client/blocs/signUpBloc.dart';
import 'package:zapp_client/helper/general/scroll_behaviour.dart';

// Project imports:

import "../../../helper/constants/asset_paths.dart";
import "../../../helper/constants/enums.dart";
import "../../../helper/constants/strings.dart";
import "../../../helper/constants/theme_utils.dart";
import "../../../helper/general/utils.dart";
import "../../../widgets/loading_barrier.dart";
import "../../../widgets/text_field_widget.dart";

///sign in screen
class SignUpScreen extends StatefulWidget {

  ///sign in screen constructor
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;


  SignUpBloc _signUpBloc;
  //  StreamSubscription _pageChangeSubscription;
  //  Stream _prevStreamPageChange;
  //  StreamSubscription _errorSubscription;
  //  Stream _prevStreamError;
  //  BuildContext _scaffoldContext;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _signUpBloc = Provider.of<SignUpBloc>(context);
    // if (_prevStreamPageChange != _signInBloc.getNavigation) {
    //   _prevStreamPageChange = _signInBloc.getNavigation;
    //   _pageChangeSubscription?.cancel();
    //   listenPageState(_signInBloc.getNavigation);
    // }
    // if (_prevStreamError != _signInBloc.getError) {
    //   _prevStreamError = _signInBloc.getError;
    //   _errorSubscription?.cancel();
    //   listenError(_signInBloc.getError);
    // }
  }



  //Change page depending on the stream output
  // void listenPageState(Stream<ScreenStates> stream) {
  //   _pageChangeSubscription = stream.listen((state) async {
  //     switch (state) {
  //       case ScreenStates.HOME:
  //         await Navigator.pushReplacementNamed(context, "/home");
  //         break;
  //       case ScreenStates.VERIFICATION:
  //         await Navigator.pushNamed(context, "/verification");
  //         break;
  //       case ScreenStates.REFERRAL_CODE:
  //         await Navigator.pushReplacementNamed(context, "/referral");
  //         break;
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   _pageChangeSubscription.cancel();
  //   _errorSubscription.cancel();
  //   super.dispose();
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: ScrollGlowRemoved(),
        child: SingleChildScrollView(
          child: Container(
            height: _height,
            width: _width,
            child: Column(
              children: [
                SizedBox(height: _height*(93/812),),
                Container(
                  width: _width * (123/375),
                  height: _height *(49/812),
                  child: Image.asset(ZAPP_LOGO),
                ),
                SizedBox(height: _height*(11/812),),
                Text("Sign Up as a Student",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: _height*(11/812),),
                Container(
                  width: _width * (325/375),
                  child: Column(
                    children: [
                      Text("Get your skills tested with professional",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Center(
                        child: Text("instructors.",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _height * 22/812),
                  child:  Container(
                    width: _width * (327/375),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(6.0),
                          ),
                        ),
                        labelText: 'First Name',
                        hintText: 'First Name',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _height * 11/812),
                  child:  Container(
                    width: _width * (327/375),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(6.0),
                          ),
                        ),
                        labelText: 'Last Name',
                        hintText: 'Last Name',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _height * 11/812),
                  child:  Container(
                    width: _width * (327/375),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(6.0),
                          ),
                        ),
                        labelText: 'E-mail Address',
                        hintText: 'E-mail Address',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _height * 11/812),
                  child:  Container(
                    width: _width * (327/375),
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(6.0),
                          ),
                        ),
                        labelText: 'Mobile Number',
                        hintText: 'Mobile Number',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _height * 11/812),
                  child:  Container(
                    width: _width * (327/375),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(6.0),
                          ),
                        ),
                        labelText: 'Alternative Contact Number',
                        hintText: 'Alternative Contact Number',
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: _height * 24/812),
                    child:InkWell(
                      onTap: () => Navigator.pushNamed(context, '/setPassword'),
                      child: Container(
                        height: _height *(60/812),
                        width: _width * (327/375),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          gradient: new LinearGradient(
                            colors: [
                              _themeUtils.getColor(zappStrings.BUTTON_COLOUR2),
                              _themeUtils.getColor(zappStrings.BUTTON_COLOUR1),
                            ],
                            begin: Alignment.centerRight,
                            end: new Alignment(-1.0, -1.0),
                          ),
                        ),
                        child: Center(child: Text("Sign In",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color:  _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                          ),
                        )),
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: _height * 13/812),
                  child: Container(
                    width: _width * (325/375),
                    child: RichText(
                      text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'By signing up you agree to our',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color:_themeUtils.getColor(zappStrings.TEXT_COLOUR3),
                              ),),
                            TextSpan(text: ' terms of service &\n privacy policy.',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color:_themeUtils.getColor(zappStrings.TEXT_COLOUR1),
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  print("gkfjg");
                                  }
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

