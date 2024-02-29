enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageURL; //? significa que puede ser nulo
  final FromWho fromWho;
  
  Message({required this.text, this.imageURL, required this.fromWho});
}
