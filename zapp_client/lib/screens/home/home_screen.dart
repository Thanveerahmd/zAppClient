import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:zapp_client/blocs/content_bloc.dart';
import 'package:zapp_client/blocs/notificationBloc.dart';
import 'package:zapp_client/helper/constants/asset_paths.dart';
import 'package:zapp_client/helper/constants/enums.dart';
import 'package:zapp_client/helper/constants/theme_utils.dart';
import 'package:zapp_client/helper/general/utils.dart';
import 'package:zapp_client/screens/onboarding/profile/address.dart';
import 'package:zapp_client/screens/payment/billing_information.dart';
import 'package:zapp_client/screens/payment/order_summary.dart';
import 'package:zapp_client/screens/payment/purchase_key_code.dart';
import 'package:zapp_client/screens/search/search_instructor.dart';
import 'package:zapp_client/screens/search/search_results.dart';
import "../../helper/constants/strings.dart";
import 'landing/certification.dart';
import 'landing/home.dart';
import 'landing/key_code.dart';
import 'notification/notification_screen.dart';
import 'profile/profile_screen.dart';
import 'request/requests.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _height = Utils.totalBodyHeight;
  final _width = Utils.bodyWidth;
  final _themeUtils = ThemeUtils.getInstance;

  ContentBloc _contentBloc;
  NotificationBloc _notificationBloc;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contentBloc = Provider.of<ContentBloc>(context);
    _notificationBloc = Provider.of<NotificationBloc>(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor:  _themeUtils.getColor(zappStrings.BACKGROUND_COLOUR1),
    body: Builder(builder: (BuildContext context) {
      return StreamBuilder(
        stream: _contentBloc.pageChanged,
        initialData: HomeTabs.HOME,
        builder: (context, AsyncSnapshot<HomeTabs> snapshot) {
          switch (snapshot.data) {
            case HomeTabs.HOME:
              return  StreamBuilder(
                stream: _contentBloc.homePageChanged,
                  initialData: HomePages.REQUESTS,
                builder: (context, AsyncSnapshot<HomePages> snapshotData) {
                  switch (snapshotData.data){
                    case HomePages.HOME:
                      return Home();
                    case HomePages.CERTIFICATION:
                      return Certification();
                    case HomePages.KEYCODE:
                      return KeyCodes();
                    case HomePages.SEARCH_INSTRUCTOR:
                      return SearchInstructor();
                    case HomePages.SEARCH_RESULTS:
                      return SearchResults();
                    case HomePages.REQUESTS:
                      return Requests();
                    case HomePages.PURCHASE_KEYCODE:
                      return PurchaseKeyCode();
                    case HomePages.ORDER_SUMMARY1:
                      return  OrderSummary(isCourse: false,);
                    case HomePages.ORDER_SUMMARY2:
                      return  OrderSummary(isCourse: true,);
                    case HomePages.BILLING_INFORMATION1:
                      return BillingInformation(isCourse: false,);
                    case HomePages.BILLING_INFORMATION2:
                      return BillingInformation(isCourse: true,);
                    default:
                      return SizedBox.shrink();
                  }
                }
              );
            case HomeTabs.NOTIFICATION:
             return NotificationScreen();
            case HomeTabs.PROFILE:
              return ProfileScreen();
            default:
              return SizedBox.shrink();
          }
        },
      );
    }),
    bottomNavigationBar: StreamBuilder(
        stream: _contentBloc.navigationEvent,
        builder: (context, AsyncSnapshot<int> snapshot) {
          final double height = _height * 0.0287;
          final double width = _width * 0.074;
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: _themeUtils.getColor(zappStrings.TEXT_COLOUR2),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: _themeUtils.getColor(zappStrings.ACTIVE_ICON),
                unselectedItemColor: _themeUtils.getColor(zappStrings.INACTIVE_ICON),
                selectedFontSize: 10,
                unselectedFontSize: 10,
                showUnselectedLabels: true,
                currentIndex: snapshot.data ?? 0,
                elevation: 15,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      HOME_ICON,
                      color: _themeUtils.getColor(zappStrings.ACTIVE_ICON),
                      height: height,
                      width: width,
                    ),
                    icon: SvgPicture.asset(
                      HOME_ICON,
                      height: height,
                      width: width,
                    ),
                    title: Text(
                      '.',
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),
                    ),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      NOTIFICATION_ICON,
                      height: height,
                      width: width,
                      color: _themeUtils.getColor(zappStrings.ACTIVE_ICON),
                    ),
                    icon: SvgPicture.asset(
                      NOTIFICATION_ICON,
                      height: height,
                      width: width,
                    ),
                    title: Text(
                      '.',
                      style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: 25),
                    ),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      PROFILE_ICON,
                      color: _themeUtils.getColor(zappStrings.ACTIVE_ICON),
                      height: height,
                      width: width,
                    ),
                    icon: SvgPicture.asset(
                      PROFILE_ICON,
                      height: height,
                      width: width,
                    ),
                    title: Text(
                      '.',
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),
                    ),
                  ),
                ],
                onTap: (index) => _contentBloc.setNavigationEvent.add(index),
              ),
            ),
          );
        }),
  );
}
