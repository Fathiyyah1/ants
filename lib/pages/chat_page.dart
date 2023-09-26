import 'package:ants/data_source.dart';
import 'package:ants/models/message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = [];
  TextEditingController questionCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat with Anoot!"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: 300,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: TextField(
                  controller: questionCont,
                  decoration: InputDecoration(hintText: "Enter your question!"),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                          onPressed: () async {
                            if (questionCont.text.isNotEmpty) {
                              messages.add(
                                  Message(isMe: true, data: questionCont.text));
                              setState(() {});
                              String response =
                                  await chatResponse(questionCont.text);
                              setState(() {});
                              messages
                                  .add(Message(isMe: false, data: response));
                            }
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          ))))
            ],
          ),
        ),
        body: messages.isNotEmpty
            ? Column(
                children: messages.map((msg) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(msg.isMe ? "Me said:" : "Anoot said:"),
                      Text(msg.data)
                    ],
                  );
                }).toList(),
              )
            : Center(child: Text("Yalla send a question!")));
  }
}
