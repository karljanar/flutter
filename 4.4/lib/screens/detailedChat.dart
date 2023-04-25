import 'package:flutter/material.dart';
import 'package:untitled/models/detailedChat.dart';

import '../widgets/detailedChatList.dart';

class DetailedChatScreen extends StatefulWidget {
  final String name;

  const DetailedChatScreen({super.key, required this.name});

  @override
  DetailedChatScreenState createState() => DetailedChatScreenState();
}

class DetailedChatScreenState extends State<DetailedChatScreen> {
  late List<DetailedChat> detailedChatList;

  @override
  void initState() {
    detailedChatList = [
      DetailedChat(
          message:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
          time: DateTime.now(),
          messageType: MessageType.text,
          from: widget.name),
      DetailedChat(
          message: "Lorem ipsum dolor sit",
          time: DateTime.now(),
          messageType: MessageType.text,
          from: 'You'),
      DetailedChat(
          time: DateTime.now(),
          messageType: MessageType.media,
          mediaLocation: MediaLocation.network,
          fileName: "https://picsum.photos/400/500",
          from: "You"),
      DetailedChat(
          time: DateTime.now(),
          messageType: MessageType.media,
          mediaLocation: MediaLocation.network,
          fileName: "https://picsum.p",
          from: 'You'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: detailedChatList.length,
          itemBuilder: (BuildContext context, int index) {
            return DetailedChatList(
              detailedChat: detailedChatList[index],
            );
          }),
    );
  }
}
