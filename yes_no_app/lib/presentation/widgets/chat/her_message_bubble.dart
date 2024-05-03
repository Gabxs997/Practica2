import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  
  const HerMessageBubble({super.key, required this.message,});

  @override
  Widget build(BuildContext context) {
    
final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container( 
        decoration: BoxDecoration(
        color: colors.secondary, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(message.text, style: const TextStyle(color: Colors.white),),
        ),
        ),
       const SizedBox(height: 5),

         _ImageBubble(message.imageURL!),

        const SizedBox(height: 10),
      
      ],
    );
  }
}


class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentTime = DateTime.now(); // Obtener la hora actual

    // Formatear los minutos con un cero delante si es un solo dígito
    final formattedMinutes = currentTime.minute.toString().padLeft(2, '0');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imageUrl,
            width: size.width * 0.7,
            height: 180,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: size.width * 0.7,
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text('Mi novia está enviando una imagen'),
              );
            },
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(right: 10), // Ajustar el espacio a la derecha
          child: Text(
            '${currentTime.hour}:$formattedMinutes',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}