import 'package:flutter_test/flutter_test.dart';
import 'package:ssk_tools/core/zlib_base64.dart';

void main() {
  test('compress hello world', () async {
    final compressed = await ZlibBase64().compress('hello world');
    expect(compressed, 'eJzLSM3JyVcozy/KSQEAGgsEXQ==');
  });

  test('decompress hello world', () async {
    final decompressed = await ZlibBase64().decompress('eJzLSM3JyVcozy/KSQEAGgsEXQ==');
    expect(decompressed, 'hello world');
  });
}

