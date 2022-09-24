import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/components/applocal.dart';
import 'package:project/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade100,
          primarySwatch: Colors.orange,
          appBarTheme:const AppBarTheme(
              backgroundColor: Colors.orange,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
          )
      ),
      home: MyHomePage(),
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en",""),
        Locale("ar",""),
      ],
      localeResolutionCallback:(currentlang,supportlang) {
        if (currentlang != null){
          for(Locale locale in supportlang ){
            if(locale.languageCode==currentlang.languageCode){
              return currentlang;
            }
          }
        }
        return supportlang.first;
      },
    );
  }
}
