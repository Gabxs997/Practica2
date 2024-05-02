//El modelo define que datos debe tener la aplicación
import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  //atributos de la clase
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });
//Factory sirve para crear una nueva instancia
  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );
//Crear una instancia de "Message" desde el modelo

  Message toMessageEntity() => Message(
      //condicional para darle el valor al mensaje
      text: answer == 'yes' ? 'Sí' : answer == 'no' ? 'No' : 'Quizá',
      fromWho: FromWho.hers,
      imageURL: image);
}
