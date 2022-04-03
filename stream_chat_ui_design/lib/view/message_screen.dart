import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Message');
    return Container(
      child: Center(child: Text('Message Screen')),
    );
  }
}
