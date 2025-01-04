import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ssk_tools/core/zlib_base64.dart';

import '../../widget/text_field_with_copy.dart';

class TextCompressPage extends StatefulWidget {
  const TextCompressPage({super.key});

  @override
  State<TextCompressPage> createState() => _TextCompressPageState();
}

class _TextCompressPageState extends State<TextCompressPage> {
  final compressInputController = TextEditingController();
  final compressOutputController = TextEditingController();
  final decompressInputController = TextEditingController();
  final decompressOutputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('zlib-Base64'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Compress'),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextFieldWithCopy(
                            labelText: 'input',
                            controller: compressInputController,
                            hintText: 'Enter text to compress...',
                          ),
                          TextFieldWithCopy(
                            labelText: 'output',
                            controller: compressOutputController,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          final input = compressInputController.text;
                          final output = await ZlibBase64().compress(input);
                          compressOutputController.text = output;
                        },
                        icon: Icon(Icons.run_circle)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Divider(height: 2),
                ),
                Text('Decompress'),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          TextFieldWithCopy(
                            controller: decompressInputController,
                            labelText: 'input',
                            hintText: 'Enter text to decompress...',
                          ),
                          TextFieldWithCopy(
                            controller: decompressOutputController,
                            labelText: 'output',
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          final input = decompressInputController.text;
                          final output = await ZlibBase64().decompress(input);
                          decompressOutputController.text = output;
                        },
                        icon: Icon(Icons.run_circle))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
