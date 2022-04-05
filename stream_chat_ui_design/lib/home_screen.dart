import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:stream_chat_ui_design/component/theme.dart';
import 'package:stream_chat_ui_design/view/calls_screen.dart';
import 'package:stream_chat_ui_design/view/contacts_screen.dart';
import 'package:stream_chat_ui_design/view/message_screen.dart';
import 'package:stream_chat_ui_design/view/notifications_screen.dart';

// ignore: slash_for_doc_comments
/**
 * [MainScreen]
 */
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  /// [List Pages]
  final pages = const [
    MessageScreen(),
    NotificationsScreen(),
    CallsScreen(),
    ContactScreen(),
  ];

  /// [Page Titles]
  final List<dynamic> pageTitle = [
    'Messages',
    'Notifications',
    'Calls',
    'Contacts',
  ];

  ///[Index Change]
  void newChangeIndex(newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('HomeScreen');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(pageTitle[_selectedIndex].toString()),
        leading: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Icon(Icons.search),
        ),
        actions: const [
          /// [Avatar Profile]
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: ProfilePicture(
              name: 'Taesun',
              radius: 20.0,
              fontsize: 15,
            ),
          )
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // fixedColor: Colors.white,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: Colors.white.withOpacity(.60),
        currentIndex: _selectedIndex,
        onTap: (newIndex) => newChangeIndex(newIndex),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.bubble_left_bubble_right_fill,
              color: _selectedIndex == 0
                  ? AppColors.secondary
                  : AppColors.iconDark,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.bell_solid,
              color: _selectedIndex == 1
                  ? AppColors.secondary
                  : AppColors.iconDark,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.phone_fill,
              color: _selectedIndex == 2
                  ? AppColors.secondary
                  : AppColors.iconDark,
            ),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_2_fill,
              color: _selectedIndex == 3
                  ? AppColors.secondary
                  : AppColors.iconDark,
            ),
            label: 'Contacts',
          ),
        ],
      ),
    );
  }
}
