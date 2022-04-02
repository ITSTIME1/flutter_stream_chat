import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_ui_design/component/theme.dart';
import 'package:stream_chat_ui_design/view/calls_screen.dart';
import 'package:stream_chat_ui_design/view/contacts_screen.dart';
import 'package:stream_chat_ui_design/view/message_screen.dart';
import 'package:stream_chat_ui_design/view/notifications_screen.dart';

// ignore: slash_for_doc_comments
/**
 * [MainScreen]
 */
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  /// [List Pages]
  final pages = const [
    CallsScreen(),
    NotificationsScreen(),
    MessageScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: AppColors.textLigth,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.bubble_left_bubble_right_fill,
              color: AppColors.textLigth,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.bell_solid,
              color: AppColors.textLigth,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.phone_fill,
              color: AppColors.textLigth,
            ),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_2_fill,
              color: AppColors.textLigth,
            ),
            label: 'Contacts',
          ),
        ],
      ),
    );
  }
}
