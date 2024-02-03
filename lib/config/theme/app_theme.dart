import 'package:flutter/material.dart';


const Color _customColor= Color(0xFF5C11D4);

const List<Color>_colorThemes = [
_customColor,
Colors.red,
Colors.green,
Colors.blue,
Colors.yellow,
Colors.purple,
Colors.orange,
Colors.pink,
Colors.teal,
Colors.cyan,
Colors.brown,
Colors.grey,
Colors.black,

];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
}):assert(selectedColor >= 0 && selectedColor < _colorThemes.length, 'selectedColor must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme()=> ThemeData(
    useMaterial3: true,
    colorSchemeSeed: _colorThemes[selectedColor],
    //brightness: Brightness.dark,

  );
}