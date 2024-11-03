import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:notifyme/services/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioService {
  AudioService._();
  static const _defaultSound = 'assets/sounds/notif.mp3';
  static String? _selectedSoundFilePath;
  static const _audioValueList = 'SELECTEDAUDIO';
  static String? selectedSoundName;
  static late SharedPreferences _sharedPreferences;
  static init(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
    final response = _sharedPreferences.getStringList(_audioValueList);
    if (response != null) {
      _selectedSoundFilePath = response[0];
      selectedSoundName = response[1];
    }
  }

  static playNotifSound() async {
    try {
      final player = AudioPlayer();
      if (_selectedSoundFilePath != null) {
        await player.setFilePath(_selectedSoundFilePath!);
      } else {
        await player.setAsset(_defaultSound);
      }
      await player.setVolume(10);
      await player.play();
      await player.dispose();
    } catch (e) {
      _sharedPreferences.remove(_audioValueList);
      debugPrint('Error from [playNotifSound]: $e');
    }
  }

  static Future<bool> selectSound() async {
    try {
      final audioPath = await FilePickerService.pickAudio();
      if (audioPath != null) {
        _selectedSoundFilePath = audioPath.path!;
        selectedSoundName = audioPath.name;
        await _sharedPreferences.setStringList(
          _audioValueList,
          [audioPath.path!, audioPath.name],
        );
        return true;
      }
    } catch (e) {
      debugPrint('Error from [selectSound]: $e');
    }
    return false;
  }
}
