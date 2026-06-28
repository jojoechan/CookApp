import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class TextToSpeech {
  FlutterTts? _tts;
  SpeechToText? _stt;

  double speechRate = 0.5;
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    _stt = SpeechToText();
    _tts = FlutterTts();

    await _tts?.setLanguage("en-US");
    await _stt?.initialize();
    _tts?.setStartHandler(() {
      print("TTS STARTED");
    });

    _tts?.setCompletionHandler(() {
      print("TTS COMPLETED");
    });

    _tts?.setErrorHandler((msg) {
      print("TTS ERROR: $msg");
    });

    _initialized = true;
  }

  Future<void> increaseSpeakRate(bool speak) async {
    await _tts?.stop();
    await _stt?.stop();
    speechRate == 1 ? 1 : speechRate += 0.1;
    _tts?.setSpeechRate(speechRate);
    if (speak) {
      await _tts?.speak("Increasing Speak Rate");
    }
  }

  Future<void> decreaseSpeakRate(bool speak) async {
    await _tts?.stop();
    await _stt?.stop();
    speechRate == 0 ? 0 : speechRate -= 0.1;
    _tts?.setSpeechRate(speechRate);
    if (speak) {
      await _tts?.speak("Decreasing Speak Rate");
    }
  }

  Future<void> speak(String text) async {
    await _tts?.stop();
    await _tts?.speak(text);
  }

  Future<String?> listenOnce() async {
    String? bestResult;
    double bestConfidence = 0.0;
    final completer = Completer<String?>();

    await _stt?.listen(
      listenOptions: SpeechListenOptions(
          listenMode: ListenMode.confirmation), // short utterances
      onResult: (result) async {
        final confidence = result.confidence;
        if (confidence > bestConfidence) {
          bestConfidence = confidence;
          bestResult = result.recognizedWords;
        }

        if (result.finalResult && !completer.isCompleted) {
          // Apply threshold only at the end
          if (bestConfidence > 0.4) {
            // Always stop TTS before listening (defensive)
            await _tts?.stop();
            completer.complete(bestResult);
          } else {
            completer.complete(null); // fallback
          }
        }
      },
    );

    // ⏱️ Timeout safeguard
    Future.delayed(const Duration(seconds: 5), () {
      if (!completer.isCompleted) {
        completer.complete(bestResult); // return best guess
      }
    });

    return completer.future;
  }

  Future<void> stopAll() async {
    await _tts?.stop();
    await _stt?.stop();
  }
}
