import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';

class ChatView extends ConsumerStatefulWidget {
  const ChatView({super.key});

  static const routeName = '/chat';

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final _chatController = InMemoryChatController();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(titleSpacing: 20, title: Text('Chat'), actions: []),
      child: Chat(
        currentUserId: 'user1',
        resolveUser: (id) async {
          return User(id: id, name: 'John Doe');
        },
        chatController: _chatController,
        onMessageSend: (text) {
          _chatController.insertMessage(
            TextMessage(
              // Better to use UUID or similar for the ID - IDs must be unique
              id: '${Random().nextInt(1000) + 1}',
              authorId: 'user1',
              createdAt: DateTime.now().toUtc(),
              text: text,
            ),
          );
        },
      ),
    );
  }
}
