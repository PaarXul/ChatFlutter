import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entidad/message.dart';

class HerMenssageBuble extends StatelessWidget {

  final Message message;

  const HerMenssageBuble({super.key, required this.message});


  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(message.text,
                style: TextStyle(fontSize: 20.0, color: colors.onSecondary)),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(message.imageUrl),
        const SizedBox(height: 10)      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String? imageUrl;

  const _ImageBubble( this.imageUrl);



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (imageUrl == null) {
      // return a different widget or handle it in a way that suits your application
      return Container();
    }

    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network(
          imageUrl!,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Mi amor está enviando una imagen'),
            );
          },
        ));
  }
}
