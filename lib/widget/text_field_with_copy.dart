import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWithCopy extends StatefulWidget {
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
  State<TextFieldWithCopy> createState() => _TextFieldWithCopyState();
}

class _TextFieldWithCopyState extends State<TextFieldWithCopy> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              label:
                  Text('${widget.labelText}: ${widget.controller.text.length}'),
            ),
            maxLines: null,
          ),
        ),
        IconButton(
            onPressed: () {
              if (widget.controller.text.isEmpty) return;
              Clipboard.setData(ClipboardData(text: widget.controller.text));
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(widget.clipboardCopiedText)));
            },
            icon: Icon(Icons.copy)),
      ],
    );
  }
}
