import 'dart:convert';
import 'dart:io';

class ZlibBase64 {
  Future<String> compress(String text) async {
    final data = utf8.encode(text);
    final compressed = zlib.encode(data);
    return base64.encode(compressed);
  }

  Future<String> decompress(String text) async {
    final compressed = base64.decode(text);
    final data = zlib.decode(compressed);
    return utf8.decode(data);
  }
}
