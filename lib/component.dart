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
