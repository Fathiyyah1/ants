import 'package:flutter/material.dart';

class component extends StatelessWidget {
  final String message;
  const component({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.teal.shade200),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

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
