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
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAwTbdmtxRNL2ckjMLJISKN3cH6FzqNMtOfw&usqp=CAU'),
          ),
        ),
        title: const Text('My crush'),
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