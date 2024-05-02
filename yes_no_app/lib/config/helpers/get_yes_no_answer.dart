import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer{
  //se crea la instancia de la clase DIO
  //Nos ayudará a manejar peticiones HTTP
  final _dio = Dio();

  Future<Message> getAnswer() async{
    //Almacenar la petición GET en una variable 
    final response = await _dio.get('https://yesno.wtf/api');

   //Almacenar los datos de la respuesta en una variable 
   final yesNoModel = YesNoModel.fromJson(response.data); 

   //retornar la instancia de "Message" creada en el modelo
   return yesNoModel.toMessageEntity();
  }
}