import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool enabledInput;
  final String? labelText;
  final TextInputType? inputType;
  const InputField({
    required this.textEditingController,
    required this.enabledInput,
    this.labelText,
    this.inputType,
    Key? key,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        label: Text(widget.labelText != null ? widget.labelText! : ''),
        suffixIcon: widget.enabledInput ? const Icon(Icons.edit) : null,
        labelStyle: Theme.of(context).textTheme.bodyText1,
      ),
      enabled: widget.enabledInput,
      controller: widget.textEditingController,
    );
  }
}
