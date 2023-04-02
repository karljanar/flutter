import 'package:flutter/material.dart';

import '../models/chats.dart';
import '../widgets/chatsList.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  ChatsScreenState createState() => ChatsScreenState();
}

class ChatsScreenState extends State<ChatsScreen> {
  final List<Chats> _chatList = [
    Chats(
        name: "User1",
        message: "Lorem ipsum dolor sit amet",
        time: "12:30",
        seenMessage: true),
    Chats(
        name: "User2",
        message:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        time: "12:30",
        seenMessage: false),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: _chatList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatsList(chat: _chatList[index]);

                })
          ],
        ));

  }
}