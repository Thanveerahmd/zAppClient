import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapp_client/blocs/verificationBloc.dart';
import 'package:zapp_client/screens/home/home_screen.dart';

import 'blocs/content_bloc.dart';
import 'blocs/forgetPasswordBloc.dart';
import 'blocs/initialization_bloc.dart';
import 'blocs/notificationBloc.dart';
import 'blocs/paymentBloc.dart';
import 'blocs/resetPasswordBloc.dart';
import 'blocs/setAddressBloc.dart';
import 'blocs/setPasswordBloc.dart';
import 'blocs/setProfileImgBloc.dart';
import 'blocs/signInBloc.dart';
import 'blocs/signUpBloc.dart';
import 'screens/onboarding/profile/address.dart';
import 'screens/onboarding/profile/upload_profile_picture.dart';
import 'screens/onboarding/reset_password/resetPassword.dart';
import 'screens/onboarding/set_password/set_password.dart';
import 'screens/onboarding/sign_in/forget_password.dart';
import 'screens/onboarding/sign_in/sign_in_screen.dart';
import 'screens/onboarding/sign_up/sign_up_screen.dart';
import 'screens/onboarding/verification/verification_screen.dart';
import 'screens/payment/purchase_key_code.dart';
import 'screens/splash/splash_screen.dart';

class zAppClientHead extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _zAppClientHeadState createState() => _zAppClientHeadState();
}

class _zAppClientHeadState extends State<zAppClientHead> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<InitializationBloc>(
          create: (context) => InitializationBloc(),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<ContentBloc>(
          create: (context) => ContentBloc(),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<NotificationBloc>(
          create: (context) => NotificationBloc(),
          dispose: (_, value) => value.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'zAppClient',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: "/signIn",
        routes: {
          "/": (context) => const SplashScreen(),
          "/home": (context) =>  MultiProvider(
            providers: [
              Provider<PaymentBloc>(
                create: (context) => PaymentBloc(),
                dispose: (_, value) => value.dispose(),
              ),
            ],
              child: HomeScreen(),),
          "/signIn": (context) => Provider<SignInBloc>(
            create: (context) => SignInBloc(),
            child: const SignInScreen(),
          ),
          "/signUp": (context) => Provider<SignUpBloc>(
            create: (context) => SignUpBloc(),
            child: const SignUpScreen(),
          ),
          "/forgetPassword": (context) => Provider<ForgetPasswordBloc>(
            create: (context) => ForgetPasswordBloc(),
            child: const ForgetPasswordScreen(),
          ),
          "/verification": (context) => Provider<VerificationBloc>(
            create: (context) => VerificationBloc(),
            child: const VerificationScreen(),
          ),
          "/resetPassword": (context) => Provider<ResetPasswordBloc>(
            create: (context) => ResetPasswordBloc(),
            child: const ResetPasswordScreen(),
          ),
          "/setPassword": (context) => Provider<SetPasswordBloc>(
            create: (context) => SetPasswordBloc(),
            child: const SetPasswordScreen(),
          ),
          "/setProfileImg": (context) => Provider<SetProfileImgBloc>(
            create: (context) => SetProfileImgBloc(),
            child: const UploadProfilePictureScreen(),
          ),
          "/setAddress": (context) => Provider<SetAddressBloc>(
            create: (context) => SetAddressBloc(),
            child: const AddressScreen(),
          ),
        },
      ),
    );
  }
}

