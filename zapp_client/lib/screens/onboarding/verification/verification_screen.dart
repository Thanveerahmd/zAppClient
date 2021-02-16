// Dart imports:
import "dart:async";

// Flutter imports:
import "package:flutter/material.dart";
import 'package:pin_code_fields/pin_code_fields.dart';

// Package imports:
import "package:provider/provider.dart";
import 'package:zapp_client/blocs/verificationBloc.dart';
import 'package:zapp_client/helper/general/scroll_behaviour.dart';


// Project imports:

import "../../../helper/constants/asset_paths.dart";

import "../../../helper/constants/strings.dart";
import "../../../helper/constants/theme_utils.dart";

import "../../../helper/general/utils.dart";
import "../../../widgets/loading_barrier.dart";
import "../../../widgets/text_field_widget.dart";

///forget password screen
class VerificationScreen extends StatefulWidget {

  ///forget password screen constructor
  const VerificationScreen({Key key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;


  // final DeBouncer _deBouncer = DeBouncer(delay: const Duration(seconds: 2));
  //
  VerificationBloc _verificationBloc;
  StreamSubscription _errorSubscription;
  Stream _prevStreamError;
  BuildContext _scaffoldContext;

  @override
  void didChangeDependencies() {
    // super.didChangeDependencies();
    _verificationBloc = Provider.of<VerificationBloc>(context);
    // if (_prevStreamError != _forgetPasswordBloc.getError) {
    //   _prevStreamError = _forgetPasswordBloc.getError;
    //   _errorSubscription?.cancel();
    //   listenError(_forgetPasswordBloc.getError);
    // }
  }




  @override
  void dispose() {
    _errorSubscription.cancel();
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
                width: _width,
                child: Column(
                  children: [
                    SizedBox(height: _height*(77.24/812),),
                    Container(
                      width: _width * (285.88/375),
                      height: _height *(236.74/812),
                      child: Image.asset(VERIFICATION_CODE_IMG),
                    ),
                    SizedBox(height: _height*(144.02/812),),
                    Text("Verify That It’s You",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: _height*(11/812),),
                    Container(
                      width: _width * (325/375),
                      child: Center(
                        child: Text("Please enter the verification code we sent to your e-mail address.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height * 42/812),
                      child:  Container(
                        width: _width * (327/375),
                        child: PinCodeTextField(
                          appContext: context,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          length: 4,
                          onChanged: (value) {
                            print(value);
                          },
                          animationType: AnimationType.fade,
                          obscureText: false,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(6),
                            fieldHeight: 58,
                            fieldWidth: 55,
                            borderWidth: 1,
                             activeFillColor:_themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                             inactiveColor: _themeUtils.getColor(zappStrings.BORDER_COLOUR2),
                             activeColor: _themeUtils.getColor(zappStrings.TEXT_COLOUR6),
                              inactiveFillColor:_themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                            //  selectedColor: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                            selectedFillColor:_themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                          ),
                          animationDuration: const  Duration(milliseconds: 300),
                          enableActiveFill: true,

                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: _height * 8/812),
                        child:InkWell(
                          onTap: () => Navigator.pushNamed(context, '/resetPassword'),
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
                            child: Center(child: Text("Verify My E-mail",
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
