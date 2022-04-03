import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:stream_chat_ui_design/component/theme.dart';
import 'package:stream_chat_ui_design/model/message.data.dart';
import 'package:stream_chat_ui_design/model/story.data.dart';
import 'package:intl/intl.dart';

final faker = Faker();

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Message');
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Stories(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return MessageTitle(
                messageData: MessageData(
                  sendName: faker.person.name().toString(),
                  message: faker.lorem.sentence().toString(),
                  dateMessage: DateTime.now(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [Stories Screen]
 */

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 0.0,
      child: SizedBox(
        height: 150,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Sotries',
                    style: TextStyle(color: AppColors.textFaded),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const ProfilePicture(
                        name: 'Aditya Dharmawan Saputra',
                        radius: 31,
                        fontsize: 21,
                        random: true,
                      ),
                      SizedBox(
                        width: 120.0,
                        child: StoryCard(
                          storyData: StoryData(
                            name: faker.person.name(),
                            url: faker.address.toString(),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            storyData.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textFaded,
              letterSpacing: 0.3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class MessageTitle extends StatelessWidget {
  final MessageData messageData;
  const MessageTitle({Key? key, required this.messageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formatDate = DateFormat('yy/MM/dd').format(messageData.dateMessage);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: ProfilePicture(
            name: 'Profile',
            radius: 30.0,
            fontsize: 15,
            random: true,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageData.sendName,
                style: const TextStyle(
                  fontSize: 12.0,
                  wordSpacing: 2.0,
                ),
              ),
              Text(
                messageData.message,
                style: const TextStyle(
                  fontSize: 12.0,
                  wordSpacing: 2.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatDate,
                style: const TextStyle(fontSize: 12.0),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
                child: Container(
                  width: 18.0,
                  height: 18.0,
                  decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('1'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
