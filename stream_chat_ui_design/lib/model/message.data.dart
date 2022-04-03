import 'package:flutter/cupertino.dart';

@immutable
class MessageData {
  final String sendName;
  final String message;
  final dynamic dateMessage;

  const MessageData({
    required this.sendName,
    required this.message,
    required this.dateMessage,
  });
}
