import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWithCopy extends StatelessWidget {
  const TextFieldWithCopy({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
    this.clipboardCopiedText = 'Copied to clipboard',
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String clipboardCopiedText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              label: Text(labelText),
            ),
            maxLines: null,
          ),
        ),
        IconButton(
            onPressed: () {
              if (controller.text.isEmpty) return;
              Clipboard.setData(ClipboardData(text: controller.text));
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(clipboardCopiedText)));
            },
            icon: Icon(Icons.copy)),
      ],
    );
  }
}
