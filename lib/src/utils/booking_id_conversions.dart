import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class BookingIdConversions {
  /// Encode JSON data to a unique ID
  static String encodeJsonToId(Map<String, dynamic> data) {
    // Step 1: Convert JSON to a compact string
    String jsonString = jsonEncode(data);

    // Step 2: Compress the string
    List<int> compressed = zlib.encode(utf8.encode(jsonString));

    // Step 3: Encode to Base64 (URL-safe)
    String encoded = base64UrlEncode(Uint8List.fromList(compressed));

    return encoded;
  }

  /// Decode ID back to JSON
  static Map<String, dynamic> decodeIdToJson(String encodedId) {
    // Step 1: Decode Base64
    List<int> compressed = base64Url.decode(encodedId);

    // Step 2: Decompress the data
    String jsonString = utf8.decode(zlib.decode(compressed));

    // Step 3: Parse JSON string back to a map
    Map<String, dynamic> data = jsonDecode(jsonString);

    return data;
  }
}
