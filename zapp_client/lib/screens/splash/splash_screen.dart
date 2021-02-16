// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../blocs/initialization_bloc.dart';
import '../../helper/constants/asset_paths.dart';
import '../../helper/constants/strings.dart';
import '../../helper/constants/theme_utils.dart';
import '../../helper/general/utils.dart';

// import '../../widgets/GeneralErrorPopUps.dart';
// import '../../widgets/general_pop_up_box.dart';

///splash screen
class SplashScreen extends StatefulWidget {
  ///splash screen constructor
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //InitializationBloc _initializationBloc;
  StreamSubscription _pageChangeSubscription;
  Stream _prevStreamPageChange;
  StreamSubscription _errorSubscription;
  Stream _prevStreamError;
  bool _isLoaded = false;
  String _preError = '';
  DateTime _preTime;

  //final _themeUtils = ThemeUtils.getInstance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // _initializationBloc = Provider.of<InitializationBloc>(context);

    // if (!_isLoaded) {
    //   _initializationBloc.getStartupData();
    //   _isLoaded = true;
    // }
    // if (_prevStreamPageChange != _initializationBloc.getNavigation) {
    //   _prevStreamPageChange = _initializationBloc.getNavigation;
    //   _pageChangeSubscription?.cancel();
    //   listenPageState(_initializationBloc.getNavigation);
    // }
    // if (_prevStreamError != _initializationBloc.getError) {
    //   _prevStreamError = _initializationBloc.getError;
    //   _errorSubscription?.cancel();
    //   listenError(_initializationBloc.getError);
    // }
  }

  //Error message listener
  // void listenError(Stream stream) {
  //   _errorSubscription = stream.listen((value) {
  //     //listen to stream, display snack bar error
  //
  //     int timeInterval;
  //
  //     if (_preTime != null) {
  //       timeInterval = DateTime.now().difference(_preTime).inMilliseconds;
  //     }
  //
  //     if (_preError != value || (_preTime != null && timeInterval > 500)) {
  //       _preError = value;
  //       _preTime = DateTime.now();
  //       GeneralPopUp(
  //         child: ShowGeneralErrorPopUp(
  //           onActionTap: () {
  //             _preError = '';
  //             _initializationBloc.getStartupData();
  //           },
  //           description: value,
  //           buttonLabel: 'Try Again',
  //         ),
  //         barrierDismiss: false,
  //         context: context,
  //       ).showPopUp();
  //     }
  //   });
  // }

  //Change page depending on the stream output
  // void listenPageState(Stream<bool> stream) {
  //   _pageChangeSubscription = stream.listen((state) async {
  //     Navigator.of(context).popUntil((route) => route.isFirst);
  //     await Navigator.pushReplacementNamed(context, '/home');
  //   });
  // }

  // @override
  // void dispose() {
  //   _errorSubscription.cancel();
  //   _pageChangeSubscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    //Set the screen sizes and the static util variables
    Utils.setScreenSizes(context);

    final _height = Utils.totalBodyHeight;
    final _width = Utils.bodyWidth;

    return Scaffold(
        body: Container(
          height: _height,
          width: _width,
          child: Center(
              child: Container(
                width: _width * (97.5/375),
                height: _height *(97.5/812),
                child: Image.asset(SPLASH_SCREEN_LOGO),
              ),
          ),
        ));
  }
}
