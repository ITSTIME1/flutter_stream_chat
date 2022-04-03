import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Contacts');
    return Container(
      child: Center(child: Text('Contact Screen')),
    );
  }
}
