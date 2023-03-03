import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    this.type = TextInputType.text,
    this.padding = 10.0,
    required this.labelText,
    required this.handler,
  });

  final TextInputType type;
  final String labelText;
  final double padding;
  final Function(String labelText, String newValue) handler;

  @override
  Widget build(BuildContext context) { 
    return Container (
      width: 330,
      padding: EdgeInsets.all(padding),
      child: TextFormField(
        keyboardType: type,
        onSaved: (value){
          handler(labelText, value!);
        },
        validator: (value) {
          if(value!.isEmpty) {
            return "Llena este campo";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
          errorStyle: const TextStyle(
            height: 0.0,
            fontSize: 0.0
          ),
        )
      ),
    );
  } 
}