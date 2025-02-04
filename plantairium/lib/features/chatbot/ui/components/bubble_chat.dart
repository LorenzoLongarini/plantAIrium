// lib/features/chatbot/ui/components/bubble_chat.dart

import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:plantairium/common/utils/colors.dart';

class BubbleMessage extends StatelessWidget {
  final String message;
  final String userType;
  final String? timestamp;
  final bool isLoading;

  const BubbleMessage({
    Key? key,
    required this.message,
    required this.userType,
    this.timestamp,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: isLoading ? "..." : message,
      isSender: userType == "user",
      color: userType == "user" ? Color.fromARGB(255, 112, 213, 62) : Palette.primary,
      tail: true,
      textStyle: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}
