import 'package:ants/component.dart';
import 'package:flutter/material.dart';

class script extends StatelessWidget {
  const script({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 231, 226),
      appBar: AppBar(
        title: const Text('Chemicals'),
        backgroundColor: const Color.fromARGB(255, 68, 107, 103),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return MessageWidget(message: message);
        },
      ),
    );
  }
}

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
