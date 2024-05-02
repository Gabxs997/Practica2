import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
//Controlador para manejar la posición del scroll
final ScrollController chatScrollController = ScrollController();
final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Gabriel, ¿Te iras a repe?', fromWho: FromWho.me)
  ];

  // metodo para enviar mensaje
  Future<void> sendMessage(String text) async {

    if(text.isEmpty) return;
//El mensaje siempre va a ser de "me" (o mío) porque
//yo, el usuario, siempre será el que envíe el mensaje
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agregar un mensaje a la lista
    messageList.add(newMessage);
    //Detecta si el usuario hizo una pregunta para desencadenar la respuesta "ella"
      if(text.endsWith('?')){
         herReply();
      }

    //notificar si algo del provider cambió
    //para que se guarde en el estado
    notifyListeners();
    moveScrollToButtom();
    // ignore: avoid_print
    print('Cantidad de elementos en la lista: ${messageList.length}');
  }
  Future<void> herReply() async{
    //Obtener petición y almacenarlo en una variable 
    final herMessage = await getYesNoAnswer.getAnswer();
    //Añadir en la lista de mensajes
    messageList.add(herMessage);
    //Notificar si algo de provider cambió para que se guarde en el estado
    notifyListeners();
    //Mueve el scroll hasta el último mensaje recibido
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