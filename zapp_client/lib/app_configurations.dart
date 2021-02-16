import 'package:flutter/material.dart';

import 'helper/constants/enums.dart';



//Inherited widget to enforce the environment variables
class AppConfig extends InheritedWidget {

  AppConfig
      ({this.environment, Widget child}
      ):super(child: child);

  final Environment environment;

  //
  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

}
