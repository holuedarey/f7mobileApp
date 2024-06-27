import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  /// Create the light Theme
  static ThemeData get light {
    final defaultLightTheme = ThemeData.light();

    return defaultLightTheme.copyWith(
      brightness: Brightness.light,
      primaryColor: TDMColors.kPrimaryColor,
      primaryColorDark: TDMColors.kPrimaryColor,
      primaryColorLight: TDMColors.kPrimaryColor,
      scaffoldBackgroundColor: TDMColors.kWhiteBackgroundColor,
      colorScheme: defaultLightTheme.colorScheme.copyWith(
         onSurfaceVariant:TDMColors.kHintGreyColor,
          primary: TDMColors.kPrimaryColor,
          inverseSurface: TDMColors.grey,
          background: TDMColors.kWhiteBackgroundColor,
          secondary: TDMColors.kSecondaryDarkColor),
      appBarTheme:  const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: TDMColors.kWhiteBackgroundColor,
          centerTitle: true,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Color(0xff37527E))),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return TDMColors
                  .kPrimaryColor; // the color when checkbox is selected;
            }
            return Colors.black; //the color when checkbox is unselected;
          },
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: TDMColors.grey,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        )
      ),
      // iconTheme: defaultLightTheme.iconTheme.copyWith(
      //   color: const Color(0xff37527E),
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lato',
          ),
          padding: EdgeInsets.symmetric(vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          minimumSize:  Size(double.infinity, 56),
        )
      ),

      cardColor: TDMColors.kWhiteCardColor,
      // errorColor: TDMColors.kErrorColor,
      // primaryIconTheme: defaultLightTheme.iconTheme.copyWith(
      //   color: TDMColors.kAppBarIconColor,
      // ),

      // accentIconTheme: defaultLightTheme.iconTheme.copyWith(
      //   color: TDMColors.kTextOnPrimaryColor,
      // ),
      buttonTheme: defaultLightTheme.buttonTheme.copyWith(
        textTheme: ButtonTextTheme.primary,
        buttonColor: TDMColors.kPrimaryColor,
        minWidth: 88.w,
        height: 56.h,
        shape: const StadiumBorder(),
      ),
      bottomNavigationBarTheme:
          defaultLightTheme.bottomNavigationBarTheme.copyWith(
        selectedIconTheme: defaultLightTheme.iconTheme.copyWith(
          color: TDMColors.kPrimaryColor,
        ),
        selectedItemColor: TDMColors.kTabTextSelectedColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        unselectedItemColor: const Color(0xff37527E),
        // unselectedLabelStyle: const TextStyle(fontSize: 8,fontWeight: FontWeight.w300 ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
      ),
      tabBarTheme: defaultLightTheme.tabBarTheme.copyWith(
          labelColor: TDMColors.kPrimaryColor,
          unselectedLabelColor: TDMColors.kTextOnSecondaryColor),

      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: const Color(0xff21312A),
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        displayMedium: TextStyle(
          color: const Color(0xdd000000),
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        displaySmall: TextStyle(
          color: (const Color(0xff37527E)),
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        headlineMedium: TextStyle(
          color: const Color(0xff151F1A),
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        headlineSmall: TextStyle(
          color: const Color(0xff002041),
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        titleLarge: TextStyle(
          color: const Color(0xff002041),
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        titleMedium: TextStyle(
          color: const Color(0xff3E4352),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        titleSmall: TextStyle(
          color: const Color(0xff3E4352),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        bodyLarge: TextStyle(
          color: const Color(0xdd616161),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        bodySmall: TextStyle(
          color: const Color(0xdd616161),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        bodyMedium: TextStyle(
          color: const Color(0xdd000000),
          fontSize: 8.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        labelLarge: TextStyle(
          color: const Color(0x8a000000),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        labelSmall: TextStyle(
          color: const Color(0xff3E4352),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'OpenSans',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
      ),
    );
  }

  /// Create the Dark theme
  static ThemeData get dark {
    final defaultDarkTheme = ThemeData.dark();
    return defaultDarkTheme.copyWith(
      brightness: Brightness.dark,
      primaryColor: TDMColors.kPrimaryColor,
      primaryColorDark: TDMColors.kPrimaryDarkColor,
      primaryColorLight: TDMColors.kPrimaryLightColor,
      // accentColor: TDMColors.kSecondaryDarkColor,
      // textSelectionColor: TDMColors.kPrimaryLightColor,
      // textSelectionHandleColor: TDMColors.kPrimaryDarkColor,
      scaffoldBackgroundColor: TDMColors.kDarkBackgroundColor,
      // backgroundColor: TDMColors.kDarkBackgroundColor,
      appBarTheme: defaultDarkTheme.appBarTheme.copyWith(
        elevation: 0.0,
        color: TDMColors.kDarkBackgroundColor,
      ),
      cardColor: TDMColors.kWhiteCardColor,
      // errorColor: TDMColors.kErrorColor,
      primaryIconTheme: defaultDarkTheme.iconTheme.copyWith(
        color: TDMColors.kTextOnSecondaryColor,
      ),
      // accentIconTheme: defaultDarkTheme.iconTheme.copyWith(
      //   color: TDMColors.kTextOnPrimaryColor,
      // ),
      buttonTheme: defaultDarkTheme.buttonTheme.copyWith(
        textTheme: ButtonTextTheme.primary,
        buttonColor: TDMColors.kPrimaryColor,
        minWidth: 88.w,
        height: 52.h,
        shape: const StadiumBorder(),
      ),
      tabBarTheme: defaultDarkTheme.tabBarTheme.copyWith(
          labelColor: TDMColors.kPrimaryColor,
          unselectedLabelColor: TDMColors.kTextOnSecondaryColor),
      textTheme: TextTheme(
        displayMedium: TextStyle(
          color: const Color(0xffffffff),
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        displaySmall: TextStyle(
          color: (const Color(0xff37527E)),
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        headlineMedium: TextStyle(
          color: const Color(0xffffffff),
          fontSize: 48.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        headlineSmall: TextStyle(
          color: const Color(0xffffffff),
          fontSize: 34.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        titleLarge: TextStyle(
          color: const Color(0xffffffff),
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        titleMedium: TextStyle(
          color: const Color(0xffffffff),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        titleSmall: TextStyle(
          color: const Color(0xffffffff),
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        bodyLarge: TextStyle(
          color: const Color(0xdd616161),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        bodySmall: TextStyle(
          color: const Color(0xdd616161),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        bodyMedium: TextStyle(
          color: const Color(0xffffffff),
          fontSize: 8.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        labelLarge: TextStyle(
          color: const Color(0xffffffff),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        labelSmall: TextStyle(
          color: const Color(0xffffffff),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lato',
          fontFamilyFallback: const <String>['OpenSans'],
        ),
        // overline: TextStyle(
        //   color: const Color(0xffffffff),
        //   fontSize: 10.sp,
        //   fontWeight: FontWeight.w400,
        //   fontStyle: FontStyle.normal,
        //   fontFamily: 'Lato',
        //   fontFamilyFallback: const <String>['OpenSans'],
        // ),
      ),
    );
  }
}
