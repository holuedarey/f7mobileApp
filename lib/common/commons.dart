import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:f7apparel_mobile/common/extensions/int_extensions.dart';


/// Make any variable nullable
T? makeNullable<T>(T? value) => value;

/// Enum for page route
enum PageRouteAnimation { fade, scale, rotate, slide, slideBottomTop }

/// has match return bool for pattern matching
bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}
Color? defaultInkWellSplashColor;
Color? defaultInkWellHoverColor;
Color? defaultInkWellHighlightColor;
double? defaultInkWellRadius;

PageRouteAnimation? pageRouteAnimationGlobal;
Duration pageRouteTransitionDurationGlobal = 400.milliseconds;
//endregion
Color shadowColorGlobal = Colors.grey.withOpacity(0.2);
int defaultElevation = 4;
double defaultRadius = 8.0;
double defaultBlurRadius = 4.0;
double defaultSpreadRadius = 1.0;
double defaultAppBarElevation = 4.0;
const channelName = 'nb_utils';
final navigatorKey = GlobalKey<NavigatorState>();

get getContext => navigatorKey.currentState?.overlay?.context;


/// Show SnackBar
void snackBar(
    BuildContext context, {
      String title = '',
      Widget? content,
      SnackBarAction? snackBarAction,
      Function? onVisible,
      Color? textColor,
      Color? backgroundColor,
      EdgeInsets? margin,
      EdgeInsets? padding,
      Animation<double>? animation,
      double? width,
      ShapeBorder? shape,
      Duration? duration,
      SnackBarBehavior? behavior,
      double? elevation,
    }) {
  if (title.isEmpty && content == null) {
    // log('SnackBar message is empty');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        action: snackBarAction,
        margin: margin,
        animation: animation,
        width: width,
        shape: shape,
        duration: duration ?? 4.seconds,
        behavior: margin != null ? SnackBarBehavior.floating : behavior,
        elevation: elevation,
        onVisible: onVisible?.call(),
        content: content ??
            Padding(
              padding: padding ?? const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                title,
                // style: primaryTextStyle(color: textColor ?? Colors.white),
              ),
            ),
      ),
    );
  }
}

/// Hide soft keyboard
void hideKeyboard(context) => FocusScope.of(context).requestFocus(FocusNode());

/// Returns a string from Clipboard
Future<String> paste() async {
  ClipboardData? data = await Clipboard.getData('text/plain');
  return data?.text?.toString() ?? "";
}

/// Returns a string from Clipboard
Future<dynamic> pasteObject() async {
  ClipboardData? data = await Clipboard.getData('text/plain');
  return data;
}



/// returns Radius
BorderRadius radius([double? radius]) {
  return BorderRadius.all(radiusCircular(radius ?? defaultRadius));
}

/// returns Radius
Radius radiusCircular([double? radius]) {
  return Radius.circular(radius ?? defaultRadius);
}

ShapeBorder dialogShape([double? borderRadius]) {
  return RoundedRectangleBorder(
    borderRadius: radius(borderRadius ?? defaultRadius),
  );
}



const double degrees2Radians = pi / 180.0;

double radians(double degrees) => degrees * degrees2Radians;

void afterBuildCreated(Function()? onCreated) {
  makeNullable(SchedulerBinding.instance)!
      .addPostFrameCallback((_) => onCreated?.call());
}


Route<T> buildPageRoute<T>(
    Widget child,
    PageRouteAnimation? pageRouteAnimation,
    Duration? duration,
    ) {
  if (pageRouteAnimation != null) {
    if (pageRouteAnimation == PageRouteAnimation.fade) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return FadeTransition(opacity: anim, child: child);
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == PageRouteAnimation.rotate) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return RotationTransition(
              turns: ReverseAnimation(anim),
              child: child);
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == PageRouteAnimation.scale) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return ScaleTransition(scale: anim, child: child);
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == PageRouteAnimation.slide) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(anim),
            child: child,
          );
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == PageRouteAnimation.slideBottomTop) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ).animate(anim),
            child: child,
          );
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    }
  }
  return MaterialPageRoute<T>(builder: (_) => child);
}

/// mailto: function to open native email app
Uri mailTo({
  required List<String> to,
  String subject = '',
  String body = '',
  List<String> cc = const [],
  List<String> bcc = const [],
}) {
  String _subject = '';
  if (subject.isNotEmpty) _subject = '&subject=$subject';

  String _body = '';
  if (body.isNotEmpty) _body = '&body=$body';

  String _cc = '';
  if (cc.isNotEmpty) _cc = '&cc=${cc.join(',')}';

  String _bcc = '';
  if (bcc.isNotEmpty) _bcc = '&bcc=${bcc.join(',')}';

  return Uri(
    scheme: 'mailto',
    query: 'to=${to.join(',')}$_subject$_body$_cc$_bcc',
  );
}

