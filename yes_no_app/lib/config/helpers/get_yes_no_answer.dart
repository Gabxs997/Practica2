import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer{
  //se crea la instancia de la clase DIO
  //Nos ayudará a manejar peticiones HTTP
  final _dio = Dio();

  Future<Message> getAnswer() async{
    //Almacenar la petición GET en una variable 
    final response = await _dio.get('http://yesno.wtf/api');

     //generar un error para obtener una respuesta con un breakpoint

    throw UnimplementedError();
  }
}