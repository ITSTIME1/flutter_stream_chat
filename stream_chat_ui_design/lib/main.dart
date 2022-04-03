import 'dart:async';

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
      home: const StreamSplashScreen(),
    );
  }
}

class StreamSplashScreen extends StatefulWidget {
  const StreamSplashScreen({Key? key}) : super(key: key);

  @override
  State<StreamSplashScreen> createState() => _StreamSplashScreenState();
}

class _StreamSplashScreenState extends State<StreamSplashScreen> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('lib/images/stream.png'),
      ),
    );
  }
}
