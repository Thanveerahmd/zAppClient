// Dart imports:
import "dart:async";

// Flutter imports:
import "package:flutter/material.dart";

// Package imports:
import "package:provider/provider.dart";
import 'package:zapp_client/blocs/forgetPasswordBloc.dart';
import 'package:zapp_client/blocs/resetPasswordBloc.dart';
import 'package:zapp_client/helper/general/scroll_behaviour.dart';

// Project imports:

import "../../../helper/constants/asset_paths.dart";

import "../../../helper/constants/strings.dart";
import "../../../helper/constants/theme_utils.dart";

import "../../../helper/general/utils.dart";
import "../../../widgets/loading_barrier.dart";
import "../../../widgets/text_field_widget.dart";

///forget password screen
class ResetPasswordScreen extends StatefulWidget {

  ///forget password screen constructor
  const ResetPasswordScreen({Key key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;


  // final DeBouncer _deBouncer = DeBouncer(delay: const Duration(seconds: 2));
  //
  ResetPasswordBloc _resetPasswordBloc;
  StreamSubscription _errorSubscription;
  Stream _prevStreamError;
  BuildContext _scaffoldContext;

  @override
  void didChangeDependencies() {
    // super.didChangeDependencies();
    _resetPasswordBloc = Provider.of<ResetPasswordBloc>(context);
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
                height: _height,
                width: _width,
                child: Column(
                  children: [
                    SizedBox(height: _height*(77.24/812),),
                    Container(
                      width: _width * (285.88/375),
                      height: _height *(236.74/812),
                      child: Image.asset(RESET_PASSWORD_IMG),
                    ),
                    SizedBox(height: _height*(144.02/812),),
                    Text("Reset Password",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: _height*(11/812),),
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
                            labelText: 'New Password',
                            hintText: 'New Password',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: _height * 8/812),
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
                            labelText: 'Re-enter Password',
                            hintText: 'Re-enter Password',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: _height * 8/812),
                        child:InkWell(
                          onTap: () => Navigator.pushNamed(context, '/signIn'),
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
                            child: Center(child: Text("Reset My Password",
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
