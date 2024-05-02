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
            backgroundImage: NetworkImage('https://scontent.fmid6-1.fna.fbcdn.net/v/t39.30808-6/415004360_2664862580332715_6779704559452544924_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFLTYMphtiyOMWVrHNlRd7UNEG0shPa1680QbSyE9rXr4ZDMQxx8Uvyc2JPvqBfFuIys-oPJ0lNOu5kSxjWzy4N&_nc_ohc=uxj8qwMUHr0Q7kNvgGgeNw5&_nc_ht=scontent.fmid6-1.fna&oh=00_AfCyZMOp-WOo4sKk-qYX7oj2AgGLNgU3ojTUvEIt9o1JeQ&oe=663994E4'),
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

              ?  HerMessageBubble(message: message,)
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