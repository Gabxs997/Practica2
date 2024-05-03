import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({Key? key, required this.message}) : super(key: key);
  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final currentTime = DateTime.now(); // Obtener la hora actual
    final formattedMinutes = currentTime.minute.toString().padLeft(2, '0'); // Formatear los minutos con un cero delante si es un solo dígito

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 30), // Ajustar el espacio a la derecha
          child: Text(
            '${currentTime.hour}:$formattedMinutes',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}