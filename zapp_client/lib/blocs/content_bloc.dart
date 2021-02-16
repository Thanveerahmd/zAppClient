// Dart imports:
import 'dart:async';

// Package imports:
import 'package:rxdart/rxdart.dart';

// Project imports:
import '../helper/constants/enums.dart';
// import '../helper/general/app_data.dart';
// import '../helper/general/secure_storage.dart';
// import '../helper/general/shared_preference_helper.dart';
// import '../helper/social_login/social_login_helper.dart';
import 'base_bloc.dart';

///content bloc class
class ContentBloc extends BaseBloc {
  ///content bloc constructor
  ContentBloc() {
    //Set the navigation streams and body content streams based on input index
    _navigationIndexController.stream.listen((index) {
      _navigationEventIndex.add(index);
      _pageChanges.add(HomeTabs.values[index]);
    });

    _requestNavigationIndexController.stream.listen((index) {
      print(index);
      _requestNavigationEventIndex.add(index);
      _requestPageChanges.add(RequestTabs.values[index]);
    });

    _navigationHomeIndexController.stream.listen((index) {
      print(index);
      _navigationHomeEventIndex.add(index);
      _homePageChanges.add(HomePages.values[index]);
    });

  }

  // final _socialLoginHelper = SocialLoginHelper.getInstance; //singleton helper class to social login
  // final _appData = AppData.getInstance; //singleton appData instance

  final PublishSubject<bool> _navigationController = PublishSubject<bool>();
  ///stream for handle logout navigation
  Stream<bool> get getNavigation => _navigationController.stream;

  //Control the bottom navigation index changes and fire ui changes
  final BehaviorSubject<int> _navigationEventIndex = BehaviorSubject<int>();
  ///stream to get bottom navigation tab index
  Stream<int> get navigationEvent => _navigationEventIndex.stream;
  final StreamController<int> _navigationIndexController = StreamController();
  ///sink to set bottom navigation index
  Sink<int> get setNavigationEvent => _navigationIndexController.sink;


  final BehaviorSubject<int> _navigationHomeEventIndex = BehaviorSubject<int>();
  ///stream to get bottom navigation tab index
  Stream<int> get navigationHomeEvent => _navigationHomeEventIndex.stream;
  final StreamController<int> _navigationHomeIndexController = StreamController();
  ///sink to set bottom navigation index
  Sink<int> get setNavigationHomeEvent => _navigationHomeIndexController.sink;

  //Control the bottom navigation index changes and fire ui changes
  final BehaviorSubject<int> _requestNavigationEventIndex = BehaviorSubject<int>();
  Stream<int> get requestNavigationEvent => _requestNavigationEventIndex.stream;
  final StreamController<int> _requestNavigationIndexController = StreamController();
  ///sink to set bottom navigation index
  Sink<int> get setRequestNavigationEvent => _requestNavigationIndexController.sink;

  final PublishSubject<bool> _isLoading = PublishSubject<bool>();
  ///Stream to get loading status
  Stream<bool> get isLoading => _isLoading.stream;

  //Controls the body content changes according to bottom navigation change
  final BehaviorSubject<HomeTabs> _pageChanges = BehaviorSubject<HomeTabs>();
  ///stream to get body content
  Stream<HomeTabs> get pageChanged => _pageChanges.stream;

  //Controls the body content changes according to bottom navigation change
  final BehaviorSubject<HomePages> _homePageChanges = BehaviorSubject<HomePages>();
  ///stream to get body content
  Stream<HomePages> get homePageChanged => _homePageChanges.stream;

  //Controls the body content changes according to bottom navigation change
  final BehaviorSubject<RequestTabs> _requestPageChanges = BehaviorSubject<RequestTabs>();
  ///stream to get body content
  Stream<RequestTabs> get requestPageChanged => _requestPageChanges.stream;

  /// log out the user
  // logoutUser() async {
  //   _isLoading.add(true);
  //   await _logOutUser().then((value) {
  //     _navigationEventIndex.add(0);
  //     _pageChanges.add(HomeTabs.ONLINE);
  //     _navigationController.add(true);
  //     _isLoading.add(false);
  //   });
  // }

  // Future<bool> _logOutUser() async {
  //   try {
  //     _appData.userID = null;
  //     final String loggedInSource =
  //         await SharedPreferenceHelper.getFromPref<String>(
  //             'loggedInSourcePokitPal');
  //     await SharedPreferenceHelper.saveToPref<bool>('loggedInPokitPal', false);
  //     _appData.isUserLogIn = false;
  //     await SecureStorage.deleteValue('jwtTokenPokitPal');
  //     await SecureStorage.deleteValue('refreshTokenPokitPal');
  //     await SharedPreferenceHelper.saveToPref<String>(
  //         'expirationPokitPal', null);
  //     await SharedPreferenceHelper.saveToPref<String>(
  //         'userID', null);
  //     await SharedPreferenceHelper.saveToPref<String>(
  //         'userEmailPokitPal', null);
  //     switch (loggedInSource) {
  //       case 'facebook':
  //         await _socialLoginHelper.fbLogOut();
  //         break;
  //       case 'google':
  //         await _socialLoginHelper.googleLogOut();
  //         break;
  //     }
  //     await SharedPreferenceHelper.saveToPref<String>(
  //         'loggedInSourcePokitPal', null);
  //     await SharedPreferenceHelper.saveToPref<bool>(
  //         'isUserSkipOrAddedCreditCard', false);
  //     await SharedPreferenceHelper.saveToPref<bool>(
  //         'isUserSkipOrAddedBankAccount', false);
  //     await SharedPreferenceHelper.saveToPref<bool>(
  //         'isUserCheckedPayout', false);
  //
  //     return true;
  //   } catch (error,stacktrace) {
  //     CrashlyticsHelper.sendErrorToCrashlytics(error, stacktrace);
  //     return false;
  //   }
  //

  @override
  dispose() {
    _navigationHomeEventIndex.close();
    _navigationHomeIndexController.close();
    _homePageChanges.close();
    _requestPageChanges.close();
    _requestNavigationEventIndex.close();
    _requestNavigationIndexController.close();
    _navigationEventIndex.close();
    _navigationIndexController.close();
    _navigationController.close();
    _pageChanges.close();
    _isLoading.close();
  }
}


