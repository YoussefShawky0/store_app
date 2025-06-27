import 'package:flutter/material.dart';

class CustomFormTextField extends StatefulWidget {
  const CustomFormTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.controller,
  });

  final String? hintText;
  final String? labelText;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  String get label => widget.labelText?.toLowerCase() ?? '';

  bool get isPriceField => label == 'price';
  bool get isImageField => label == 'image url' || label.contains('image');
  bool get isNameField => label == 'product name' || label.contains('name');
  bool get isDescriptionField => label == 'description';

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      style: const TextStyle(color: Colors.black),
      keyboardType: isPriceField
          ? const TextInputType.numberWithOptions(decimal: true)
          : isImageField
              ? TextInputType.url
              : TextInputType.text,
      maxLines: isDescriptionField ? 3 : 1,
      decoration: InputDecoration(
        label: Text(widget.labelText ?? ''),
        labelStyle: const TextStyle(color: Colors.black),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.black45),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 135, 147, 174),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 135, 147, 174),
            width: 2,
          ),
        ),
      ),
    );
  }
}
