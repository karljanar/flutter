import 'package:flutter/material.dart';
import 'package:untitled/models/conversation.dart';

import '../widgets/conversationList.dart';

class ConversationScreen extends StatefulWidget {
  final String name;

  const ConversationScreen({super.key, required this.name});

  @override
  ConversationScreenState createState() => ConversationScreenState();
}

class ConversationScreenState extends State<ConversationScreen> {
  late List<Conversation> conversationList;

  @override
  void initState() {
    conversationList = [
      Conversation(
          message:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore",
          time: DateTime.now(),
          messageType: MessageType.text,
          from: widget.name),
      Conversation(
          message: "Lorem ipsum dolor sit",
          time: DateTime.now(),
          messageType: MessageType.text,
          from: 'You'),
      Conversation(
          time: DateTime.now(),
          messageType: MessageType.media,
          mediaLocation: MediaLocation.network,
          fileName: "https://picsum.photos/400/500",
          from: "You"),
      Conversation(
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
          itemCount: conversationList.length,
          itemBuilder: (BuildContext context, int index) {
            return ConversationList(
              conversation: conversationList[index],
            );
          }),
    );
  }
}
