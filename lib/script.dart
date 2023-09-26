import 'package:ants/component.dart';
import 'package:flutter/material.dart';

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

List<Message> messages = [
  Message(text: "Hello", isMe: true),
  Message(text: "Hi there!", isMe: false),
  Message(text: 'Call for work', isMe: true),
  Message(text: '22', isMe: false)
];

class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isMe
              ? const Color.fromARGB(255, 53, 87, 82)
              : const Color.fromARGB(255, 81, 138, 130),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message.text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Script extends StatefulWidget {
  @override
  _ScriptState createState() => _ScriptState();
}

class _ScriptState extends State<Script> {
  List<Message> messages = [];

  String? selectedChoice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 231, 226),
      appBar: AppBar(
        title: const Text('Chemicals'),
        backgroundColor: const Color.fromARGB(255, 68, 107, 103),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return MessageWidget(message: message);
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ChoiceChip(
                  label: Text('Choice 1'),
                  selected: selectedChoice == 'Choice 1',
                  onSelected: (selected) {
                    setState(() {
                      selectedChoice = selected ? 'Choice 1' : null;
                    });
                  },
                ),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                ChoiceChip(
                  label: Text('Choice 2'),
                  selected: selectedChoice == 'Choice 2',
                  onSelected: (selected) {
                    setState(() {
                      selectedChoice = selected ? 'Choice 2' : null;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 237, 238, 238),
                  ),
                  width: 510,
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: "  here..."),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (selectedChoice != null) {
                    final isMe = selectedChoice == 'Choice 1';
                    final message = Message(
                      text: 'You chose: $selectedChoice',
                      isMe: isMe,
                    );

                    setState(() {
                      messages.add(message);
                    });

                    setState(() {
                      selectedChoice = null;
                    });
                  }
                },
                icon: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ],
      ),
    );
  }
}
