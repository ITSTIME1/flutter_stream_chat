import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() async {
  /// [English]
  /**
   * The official Dart client for Stream Chat, a service for building chat applications. This library can be used on any Dart project and on both mobile and web apps with Flutter.
   * You can sign up for a Stream account at https://getstream.io/chat/
   * The Chat client will manage API call, event handling and manage the websocket connection to Stream Chat servers.
   */
  /// [Korean]
  /**
   * 스트림 챗을 위한 다트의 공식적인 클라이언트(클래스)다. 이 서비스는 채팅 어플리케이션을 위한 것이다. 이 라이브러리는 다트 프로젝트, 앱, 웹 둘다 사용이 가능하다.
   * getStream 가서 회원가입 절차부터 밟을 수 있다.
   * 이 채팅 클라이언트는 API 를 불러오는걸 관리한다, Stream Chat Server 로부터 이벤트 핸틀링, 그리고 websocket의 연결하는걸 관리한다
   */

  /// [By using StreamClient]
  /// The Chat client will manage API call, event handling, manage the websocket connection to Stream Chat servers
  final StreamChatClient client = StreamChatClient(
    // [API Key]
    'n6knppaxvymd',
    // [Logging Information]
    logLevel: Level.INFO,
  );

  ///[Example User Setting]
  /// Manually Generating Tokens
  /// create id and token.

  await client.connectUser(
    User(id: 'sanghun'),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic2FuZ2h1biJ9.M_G6UdJ5epSIqCoBzH6I-xJWLLizS-1zPTXAJB8qgG4',
  );

  final Channel channel = client.channel('messaging', id: 'sanghun');

  /// [Initialize Channel State]
  /// This change for chat state
  await channel.watch();

  /// [Deliver values to MyApp]
  runApp(
    MyApp(
      client: client,
      channel: channel,
    ),
  );
}

class MyApp extends StatelessWidget {
  /// [Reciver values from runApp()]

  final StreamChatClient client;
  final Channel channel;
  const MyApp({Key? key, required this.client, required this.channel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        /// [Provider 역할]
        /// StreamChat 자체는 위젯인데 위젯 트리에다가 client 정보랑 chatting의 UI widget을 보여주는 역할을한다.
        return StreamChat(
          client: client,
          child: widget,
        );
      },

      /// [Proivder 역할]
      /// StreamChannel 자체는 위젯인데 위젯트리에다가 channel정보를 공급하고 그걸 가지고 widget에 보여주는 역할을 해준다.
      home: StreamChannel(
        channel: channel,
        child: const ChannelPage(),
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 *  [Channel Widget]
 *  StreamChannel을 통해서 ChannelPage를 child로 설정하고
 *  현재 페이지에서는 그 채팅의 내용을 보여준다.
 */
class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChannelHeader(
        title: Text('StreamChat'),
      ),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: MessageListView(),
          ),
          /**
           * [Stream InputChat Widget]
           * stream_chat 에서 MessageInput() 위젯을 제공해준다.
           */
          MessageInput(),
        ],
      ),
    );
  }
}
