import 'package:flutter/material.dart';

import 'app_configurations.dart';
import 'helper/constants/enums.dart';
import 'zAppClient_Head.dart';


void main() async {

  var configuredApp = AppConfig(
    environment: Environment.DEV,
    child: zAppClientHead(),
  );

  runApp(configuredApp);

}
