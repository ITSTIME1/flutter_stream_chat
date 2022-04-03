import 'package:flutter/material.dart';
import 'package:stream_chat_ui_design/model/message.data.dart';

class ChatScreen extends StatelessWidget {
  final MessageData messageData;
  static Route route(MessageData data) =>
      MaterialPageRoute(builder: (context) => ChatScreen(messageData: data));
  const ChatScreen({Key? key, required this.messageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Stream Chat'),
      ),
    );
  }
}
