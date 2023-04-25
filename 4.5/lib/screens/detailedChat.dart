import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
    ];
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();
  final textController = TextEditingController();
  late String messageText;
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _onImageButtonPressed(ImageSource source, {BuildContext? context}) async {
    _imageFile = await _picker.pickImage(source: source);
    _addMessage(MessageType.media);
  }

  void _addMessage(MessageType messageType) {
    if (messageType == MessageType.text){
      detailedChatList.add(DetailedChat(
          message: messageText,
          time: DateTime.now(),
          from: "You",
          messageType: messageType));
    } else {
      detailedChatList.add(DetailedChat(
          time: DateTime.now(),
          from: "You",
          fileName: _imageFile!.path,
          messageType: messageType,
      mediaLocation: MediaLocation.local));
    }

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
                itemCount: detailedChatList.length,
                itemBuilder: (BuildContext context, int index) {
                  return DetailedChatList(
                    detailedChat: detailedChatList[index],
                  );
                }),
            const SizedBox(height: 50),
          ],
        ),
        bottomSheet: SizedBox(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _onImageButtonPressed(ImageSource.gallery, context: context);
                },
                icon: const Icon(Icons.photo),
              ),
              IconButton(
                onPressed: () {
                  _onImageButtonPressed(ImageSource.camera, context: context);
                },
                icon: const Icon(Icons.camera_alt),
              ),
              Expanded(
                child: TextField(
                  controller: textController,
                  onChanged: (value) => messageText = value,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (messageText.isNotEmpty) {
                    _addMessage(MessageType.text);
                    messageText = "";
                    textController.clear();
                  }
                },
                icon: const Icon(
                  Icons.send,
                ),
              )
            ],
          ),
        ));
  }
}
