import 'package:dvh_flutter_application/theme.dart';
import 'package:dvh_flutter_application/ui/home/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(
        fontFamily: 'IranYekan', color: LightThemeColors.primaryTextColor);

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
              subtitle1: defaultTextStyle.apply(
                  color: LightThemeColors.secondaryColor),
              bodyText2: defaultTextStyle,
              button: defaultTextStyle,
              caption: defaultTextStyle.apply(
                  color: LightThemeColors.secondaryTextColor),
              headline6:
                  defaultTextStyle.copyWith(fontWeight: FontWeight.bold)),
          colorScheme: const ColorScheme.light(
            primary: LightThemeColors.primaryColor,
            secondary: LightThemeColors.secondaryColor,
            onSecondary: Colors.white,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: HomeScreen(),
        ));
  }
}
