import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthcare - Doctor Consultation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        // The displayColor is applied to displayLarge, displayMedium, displaySmall, headlineLarge, headlineMedium, and bodySmall.
        textTheme: Theme.of(context).textTheme.apply(displayColor: textColor,),
        // this is to add this theme to all the elevated button we use
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(defaultPadding),
            backgroundColor: primaryColor,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: textFieldBorder,
          // border is the border before the textfield is clicked on
          enabledBorder: textFieldBorder,
          // border is the border after the textfield is clicked on
          focusedBorder: textFieldBorder,
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}