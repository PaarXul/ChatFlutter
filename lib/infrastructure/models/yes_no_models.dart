/* {
//TODO MODELO DE RESPUESTA DE LA API ->> Se auto-genero con https://app.quicktype.io/  ->> se pasa el Json de la API y genera el modelo de respuesta
"answer":"yes",
"forced":false,
"image":"https://yesno.wtf/assets/yes/12-e4f57c8f172c51fdd983c2837349f853.gif"}
*
 */

import 'package:yes_no_app/domain/entidad/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  Message toMessageEntity()=>
      Message(text: answer == 'yes'? 'Si': 'No' , fromWho: FromWho.hers, imageUrl: image);

}
