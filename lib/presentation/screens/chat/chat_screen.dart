import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_menssage_buble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

import '../../../domain/entidad/message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-Vector-No-Background.png'))),
          title: const Text('MY amigo'),
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>() ; //Esto es para escuchar los cambios en el provider Gestor de Estado

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
            controller: chatProvider.chatScrollController,
            itemCount: chatProvider.messageList.length,
            itemBuilder: (context, index) {
              final message = chatProvider.messageList[index];

              return (message.fromWho == FromWho.hers)
                  ? HerMenssageBuble(message: message)
                  : MyMenssageBuble(message: message);
            },
          )),
          // Caja de mensajes
           MessageFieldBox(
             onValue: chatProvider.sendMessage
             ,
           ),
        ]),
      ),
    );
  }
}
