import 'package:flutter/material.dart';

class BindingTextField extends StatefulWidget {
  final bool autofocus;
  final bool obscureText;
  final TextInputType keyboardType;
  final InputDecoration decoration;
  final Binding<String> text;
  final ValueChanged<String> onChanged;

  BindingTextField({Key key, this.autofocus = false, this.keyboardType, this.obscureText = false, this.decoration, this.text, this.onChanged}) : super(key: key);

  @override
  _BindingTextFieldState createState() => _BindingTextFieldState();
}

class _BindingTextFieldState extends State<BindingTextField> {

  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: this.widget.text.value);
    controller.addListener(() {
      if (this.widget.text.value != controller.text) {
        this.widget.text.value = controller.text;
        if (this.widget.onChanged != null) { 
          this.widget.onChanged(controller.text);
        }
      }
    });
  }

  @override
  void didUpdateWidget(BindingTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (this.widget.text.value != controller.text) {
      controller.text = this.widget.text.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: this.widget.decoration,
      autofocus: this.widget.autofocus,
      obscureText: this.widget.obscureText,
    );
  }
}

class Binding<T> {
  T value;

  Binding();

  Binding.initialValue(T value) {
    this.value = value;
  }
}
