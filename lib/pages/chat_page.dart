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
                              String question = questionCont.text;
                              messages.add(Message(isMe: true, data: question));
                              questionCont.clear();
                              setState(() {});
                              String response = await chatResponse(question);
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
        body: Center(
          child: messages.isNotEmpty
              ? Column(
                  children: messages.map((msg) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(msg.isMe ? "I said:" : "Anoot said:"),
                        Text(msg.data)
                      ],
                    );
                  }).toList(),
                )
              : Text("Yalla send a question!"),
        ));
  }
}
