import 'package:flutter/material.dart';
import 'package:untitled/models/conversation.dart';

import '../widgets/conversationList.dart';

class ConversationScreen extends StatefulWidget {
  final String name;

  const ConversationScreen({Key? key, required this.name}) : super(key: key);

  @override
  ConversationScreenState createState() => ConversationScreenState();
}

class ConversationScreenState extends State<ConversationScreen> {
  late List<Conversation> conversationList;
  final ScrollController _scrollController = ScrollController();
  final myController = TextEditingController();
  late String messageText;

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
    ];
    super.initState();
  }

  void _addMessage(MessageType messageType) {
    conversationList.add(Conversation(
        message: messageText,
        time: DateTime.now(),
        from: "You",
        messageType: MessageType.text));

    setState(() {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: conversationList.length,
            itemBuilder: (BuildContext context, int index) {
              return ConversationList(
                conversation: conversationList[index],
              );
            }),
          const SizedBox(height: 50),
      ],),

        bottomSheet: SizedBox(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: myController,
                  onChanged: (value) => messageText = value,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (messageText.isNotEmpty) {
                    _addMessage(MessageType.text);
                    messageText = "";
                    myController.clear();
                  }
                },
                icon: const Icon(
                  Icons.send,
                ),
              )
            ],
          ),
        )
    );
  }
}
