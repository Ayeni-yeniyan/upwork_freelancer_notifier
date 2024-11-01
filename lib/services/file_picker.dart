import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerService {
  FilePickerService._();
  static Future<AudioWrapper?> pickAudio() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.audio);
      if (result != null) {
        return AudioWrapper(
          name: result.files.single.name,
          path: result.files.single.path,
        );
      }
    } catch (e) {
      debugPrint('Error wwhen picking audio: $e');
    }
    return null;
  }
}

class AudioWrapper {
  final String name;
  final String? path;

  AudioWrapper({
    required this.name,
    required this.path,
  });
}
