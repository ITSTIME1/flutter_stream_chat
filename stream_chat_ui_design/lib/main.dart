import 'package:flutter/material.dart';
import 'package:stream_chat_ui_design/component/theme.dart';
import 'package:stream_chat_ui_design/home_screen.dart';

void main() => runApp(MyApp(appTheme: AppTheme()));

class MyApp extends StatelessWidget {
  final AppTheme appTheme;
  const MyApp({Key? key, required this.appTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}
