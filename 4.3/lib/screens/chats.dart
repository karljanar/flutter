import 'package:flutter/material.dart';

import '../models/chats.dart';
import '../widgets/chatsList.dart';
import '../widgets/searchBar.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

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

  List<Chats> _foundChatList = [];
  @override
  initState() {
    _foundChatList = _chatList;
    super.initState();
  }

  callback(foundChatUsers) {
    setState(() {
      _foundChatList = foundChatUsers;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(searchableList: _chatList, callback: callback,),
            ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: _foundChatList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatsList(chat: _foundChatList[index]);
                })
          ],
        ));
  }
}