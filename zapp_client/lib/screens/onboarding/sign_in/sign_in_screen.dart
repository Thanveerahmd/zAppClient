// Dart imports:
import "dart:async";

// Flutter imports:
import "package:flutter/material.dart";

// Package imports:
import "package:provider/provider.dart";
import 'package:zapp_client/blocs/signInBloc.dart';


// Project imports:

import "../../../helper/constants/asset_paths.dart";
import "../../../helper/constants/enums.dart";
import "../../../helper/constants/strings.dart";
import "../../../helper/constants/theme_utils.dart";
import "../../../helper/general/utils.dart";
import "../../../widgets/loading_barrier.dart";
import "../../../widgets/text_field_widget.dart";

///sign in screen
class SignInScreen extends StatefulWidget {

  ///sign in screen constructor
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;


  SignInBloc _signInBloc;
 //  StreamSubscription _pageChangeSubscription;
 //  Stream _prevStreamPageChange;
 //  StreamSubscription _errorSubscription;
 //  Stream _prevStreamError;
 //  BuildContext _scaffoldContext;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     _signInBloc = Provider.of<SignInBloc>(context);
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

    Utils.setScreenSizes(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          height: _height,
          width: _width,
          child: Column(
            children: [
              SizedBox(height: _height*(203/812),),
              Container(
                width: _width * (123/375),
                height: _height *(49/812),
                child: Image.asset(ZAPP_LOGO),
              ),
              SizedBox(height: _height*(11/812),),
              Text("Welcome Back!",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: _height*(11/812),),
              Text("    Continue getting your AHA Heartcode \n Skills Tested with a professional instructor.",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
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
                      labelText: 'E-mail Address',
                      hintText: 'E-mail Address',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _height * 15/812),
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
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _height * 8/812,),
                child: Row(
                  children: [
                    SizedBox(width: _width * (26/375),),
                    Text("Forgot password? ",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/forgetPassword'),
                      child: Text("Get help.",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color:_themeUtils.getColor(zappStrings.TEXT_COLOUR1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: _height * 8/812),
                child:InkWell(
                  onTap: () => Navigator.pushNamed(context, '/home'),
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
                padding: EdgeInsets.only(top: _height * 146/812),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account? ",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/signUp'),
                      child: Text("Sign Up.",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color:_themeUtils.getColor(zappStrings.TEXT_COLOUR1),
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
    );
  }
}
