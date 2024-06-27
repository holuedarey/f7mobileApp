import 'package:flutter/material.dart';

/// This method allows to determinate which theme is using based on context data
bool isDarkTheme(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
