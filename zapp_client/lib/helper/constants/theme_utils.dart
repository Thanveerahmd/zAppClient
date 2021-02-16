// Dart imports:
import 'dart:ui';

// Project imports:
import 'colors.dart';
import 'enums.dart';
import 'strings.dart';

///theme utils class
class ThemeUtils {
  static final ThemeUtils _themeUtils = ThemeUtils._privateConstructor();

  ThemeUtils._privateConstructor();

  ///get singleton instance
  static ThemeUtils get getInstance => _themeUtils;

  Map<String, Color> _pallet = {
    zappStrings.BUTTON_COLOUR1: BUTTON_COLOUR1,
    zappStrings.BUTTON_COLOUR2: BUTTON_COLOUR2,
    zappStrings.TEXT_COLOUR1: TEXT_COLOUR1,
    zappStrings.TEXT_COLOUR2: TEXT_COLOUR2,
    zappStrings.TEXT_COLOUR3: TEXT_COLOUR3,
    zappStrings.TEXT_COLOUR4: TEXT_COLOUR4,
    zappStrings.TEXT_COLOUR5: TEXT_COLOUR5,
    zappStrings.TEXT_COLOUR6: TEXT_COLOUR6,
    zappStrings.BACKGROUND_COLOUR1: BACKGROUND_COLOUR1,
    zappStrings.BACKGROUND_COLOUR2: BACKGROUND_COLOUR2,
    zappStrings.ACTIVE_ICON: TEXT_COLOUR1,
    zappStrings.RANGE_COLOUR1: RANGE_COLOUR1,
    zappStrings.RANGE_COLOUR2: RANGE_COLOUR2,
    zappStrings.BORDER_COLOUR1: BORDER_COLOUR1,
    zappStrings.BORDER_COLOUR2: BORDER_COLOUR2,
    zappStrings.INACTIVE_ICON: INACTIVE_ICON,
    zappStrings.NOTIFICATION_BANNER:NOTIFICATION_BANNER,
    zappStrings.HEADER_COLOUR1:HEADER_COLOUR1,
    zappStrings.HEADER_COLOUR2:HEADER_COLOUR2,
  };

  ///get theme color
  Color getColor(String key) {
    return _pallet[key];
  }

}
