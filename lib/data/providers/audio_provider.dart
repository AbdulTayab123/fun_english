import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioProvider extends ChangeNotifier {
  final FlutterTts _flutterTts = FlutterTts();

  AudioProvider() {
    _initTts();
  }

  Future<void> _initTts() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.4); // Slower, clear for kids
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.2); // Slightly higher pitch for a kid-friendly tone
  }

  Future<void> speak(String text) async {
    if (text.isNotEmpty) {
      await _flutterTts.speak(text);
    }
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }
}
