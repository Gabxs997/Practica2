import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
//Controlador para manejar la posición del scroll
final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Gabriel, ¿Te iras a repe?', fromWho: FromWho.me)
  ];

  // metodo para enviar mensaje
  Future<void> sendMessage(String text) async {
//El mensaje siempre va a ser de "me" (o mío) porque
//yo, el usuario, siempre será el que envíe el mensaje
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agregar un mensaje a la lista
    messageList.add(newMessage);

    //notificar si algo del provider cambió
    //para que se guarde en el estado
    notifyListeners();
    moveScrollToButtom();
  }

Future<void> moveScrollToButtom() async{
//Un pequeño retraso para garantizar que la animación se vea bien
await Future.delayed(const Duration(milliseconds: 100));

  chatScrollController.animateTo(
  //maxScrollExtent determina lo máximo que el scroll puede dar 
  chatScrollController.position.maxScrollExtent,//offset: Posición de animación
  duration: const Duration(milliseconds: 300), 
  curve: Curves.easeOut);
  }

}


//tarea 1 - no permitir mensajes vacios 
//tarea 2 - que se imprima la cantidad de mensajes en la consola
