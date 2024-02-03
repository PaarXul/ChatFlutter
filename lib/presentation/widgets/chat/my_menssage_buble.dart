import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entidad/message.dart';

class MyMenssageBuble extends StatelessWidget {

  final Message message;


  const MyMenssageBuble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(message.text,
                style: TextStyle(fontSize: 20.0, color: colors.onPrimary)),
          ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
