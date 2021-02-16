// Flutter imports:
import 'package:flutter/material.dart';

// Removes the scroll glow from list top and bottom.
// Use case: Single child scroll view
// that doesn"t want to indicate a scroll view in ui

///scroll glow removing
class ScrollGlowRemoved extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
