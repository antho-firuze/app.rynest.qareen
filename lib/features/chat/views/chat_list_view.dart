import 'package:flutter/material.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  static const routeName = '/chat_list';

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(titleSpacing: 20, title: Text('Chat')),
      child: ListView(children: [
        
      ],),
    );
  }
}
