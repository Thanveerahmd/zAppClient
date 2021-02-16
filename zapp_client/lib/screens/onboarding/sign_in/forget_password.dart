// Dart imports:
import "dart:async";

// Flutter imports:
import "package:flutter/material.dart";

// Package imports:
import "package:provider/provider.dart";
import 'package:zapp_client/blocs/forgetPasswordBloc.dart';
import 'package:zapp_client/helper/general/scroll_behaviour.dart';

// Project imports:

import "../../../helper/constants/asset_paths.dart";

import "../../../helper/constants/strings.dart";
import "../../../helper/constants/theme_utils.dart";

import "../../../helper/general/utils.dart";
import "../../../widgets/loading_barrier.dart";
import "../../../widgets/text_field_widget.dart";

///forget password screen
class ForgetPasswordScreen extends StatefulWidget {

  ///forget password screen constructor
  const ForgetPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;


  // final DeBouncer _deBouncer = DeBouncer(delay: const Duration(seconds: 2));
  //
  ForgetPasswordBloc _forgetPasswordBloc;
  StreamSubscription _errorSubscription;
  Stream _prevStreamError;
  BuildContext _scaffoldContext;

  @override
  void didChangeDependencies() {
    // super.didChangeDependencies();
    _forgetPasswordBloc = Provider.of<ForgetPasswordBloc>(context);
    // if (_prevStreamError != _forgetPasswordBloc.getError) {
    //   _prevStreamError = _forgetPasswordBloc.getError;
    //   _errorSubscription?.cancel();
    //   listenError(_forgetPasswordBloc.getError);
    // }
  }




  @override
  void dispose() {
 //   _errorSubscription.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeUtils.getColor(zappStrings.BACKGROUND_COLOUR1),
      body: Stack(
        children: [
          CustomPaint(
            painter:WaveDesign(),
            size: Size(_width,_height),
          ),
          ScrollConfiguration(
            behavior: ScrollGlowRemoved(),
            child: SingleChildScrollView(
              child: Container(
                height: _height,
                width: _width,
                child: Column(
                  children: [
                    SizedBox(height: _height*(77.24/812),),
                    Container(
                      width: _width * (285.88/375),
                      height: _height *(236.74/812),
                      child: Image.asset(FORGET_PASSWORD_IMG),
                    ),
                    SizedBox(height: _height*(144.02/812),),
                    Text("Forgot Password",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: _height*(11/812),),
                    Container(
                      width: _width * (325/375),
                      child: Text("Enter your e-mail address which is linked to your account. We will send you a verification code.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height * 42/812),
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
                        padding: EdgeInsets.only(top: _height * 8/812),
                        child:InkWell(
                          onTap: () => Navigator.pushNamed(context, '/verification'),
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
                            child: Center(child: Text("Send Code",
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveDesign extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 1.0;

    var path = Path();

    path.lineTo(0.0,430.0);
    path.cubicTo(size.width*(251/375), size.height*(269/812), size.width*(268.5/375), size.height*(474/812),size.width, size.height*(365.79/812),);
    path.lineTo(size.width,0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}
