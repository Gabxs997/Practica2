import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:yes_no_app/domain/entities/message.dart";
import "package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart";
import "package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart";
import "package:yes_no_app/presentation/widgets/chat/shared/message_field_box.dart";

import "../../providers/chat_provider.dart";

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://scontent-dfw5-2.xx.fbcdn.net/v/t39.30808-6/415004360_2664862580332715_6779704559452544924_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFLTYMphtiyOMWVrHNlRd7UNEG0shPa1680QbSyE9rXr4ZDMQxx8Uvyc2JPvqBfFuIys-oPJ0lNOu5kSxjWzy4N&_nc_ohc=kfKo8NswaAYQ7kNvgFZlxon&_nc_ht=scontent-dfw5-2.xx&oh=00_AfD6hY4x-YM8fJysGA9fhjgBqXi5WoBaQCZqDJwwC0FXmA&oe=6630CAE4'),
          ),
        ),
        title: const Text('My princess <3'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
     
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              //Enlaza al controlador creado en ChatProvider
              controller: chatProvider.chatScrollController,
              //Se pone en la longitud de la lista que se encientra en ChatProvider
              itemCount: chatProvider.messageList.length, //cuantos elementos puede tener tu vista
              itemBuilder: (context, index) { //que es lo que va a mostrar
                //Instancia del message que sabra de quién es el mensaje
                final message = chatProvider.messageList[index];
                //Asigna MessageBubble a partir de quién venga el mensaje 

              return (message.fromWho == FromWho.hers)

              ? const HerMessageBubble()
              : MyMessageBubble(message: message,);
      
            },)
            ),
        
        ///Caja de Texto y que llama el metodo provider para enviar el mensaje
        
          MessageFieldBox(onValue: chatProvider.sendMessage),
         
          ],
        ),
      ),
    );
  }
}