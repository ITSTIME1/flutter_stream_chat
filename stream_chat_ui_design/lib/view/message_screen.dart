import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_ui_design/component/theme.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Message');
    return const Stories();
  }
}

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 0.0,
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            const Text(
              'Sotries',
              style: TextStyle(color: AppColors.textFaded),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Text('Testing');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
