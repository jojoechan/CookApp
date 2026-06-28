import 'dart:developer';

import 'package:cook_app/app/data/text_to_speech.dart';
import 'package:cook_app/app/data/voice_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class TutorialController extends GetxController {
  final voice = Get.find<TextToSpeech>();
  var voiceState = VoiceState.idle.obs;
  var voiceEnabled = false.obs;

  var stepIndex = 0.obs;
  final listStep = [
    "Open the piece of pork onto the butcher paper or clean countertop, skin side down.",
    "Sprinkle generously with the salt and work the salt into the pork.",
    "Add the freshly ground black pepper all over the porchetta.",
    "Now add the fennel pollen. Sprinkle evenly over the pork, but save a little of the pollen for after the porchetta has been rolled.",
    "Roll the Pork Belly tightly. But as you roll it, sprinkly some salt onto the unseasoned side of the pork.",
    "Keeping the seam side down, start tying the pork. Another pair of hands will make this part immensely easier and repeat every few inches.",
    "Turn the roast seam side up and add more seasonings, including the rest of the fennel pollen to the non-skin parts of the pork which are exposed (including the ends).",
    "Place seam side down on a rack on a roasting pan or baking tray. Cover the ends with aluminum foil and secure with toothpicks.",
    "Drizzle with olive oil and rub all over the skin with your hands. Sprinkle with more salt and rosemary.",
    "Preheat the oven to 400˚F (200˚C).",
    "Place in the hot oven when it comes to temperature and roast for 1 hour, then lower the temperature to 350°F (170°C) and continue to cook for about another 2 hours.",
    "Check the center of the roast when it reaches 170°F (76°C) remove from the oven. Take the foil off the ends and place on top of the porchetta, and allow to rest for about 10 minutes on a cutting board.",
    "Using a sharp knife, remove one or two of the pieces of twine.",
    "Cut into slices and it's ready to serve."
  ];

  @override
  void onInit() async {
    super.onInit();
    voice.init();
  }

  @override
  void onReady() async {
    super.onReady();
    await voice.speak("Testing speaking.");
    print("TTS speak called");
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> requestMicPermission() async {
    final status = await Permission.microphone.request();
    return status.isGranted;
  }

  Future<void> stopVoice() async {
    try {
      await voice.stopAll();
      voiceEnabled.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> startStep(String step) async {
    if (await requestMicPermission()) {
      try {
        // 1) SPEAK
        debugPrint(step);
        voiceState.value = VoiceState.speaking;
        await voice.speak(step);

        // 2) SETTLING (delay after TTS)
        if (!voiceEnabled.value) return;
        await _postTtsDelay(const Duration(milliseconds: 500));

        // 3) LISTEN
        if (!voiceEnabled.value) return;
        voiceState.value = VoiceState.listening;
        final command = await voice.listenOnce();

        // 4) PROCESS
        if (!voiceEnabled.value) return;
        voiceState.value = VoiceState.processing;
        await handleCommand(command);

        // Loop continues based on command handling
      } catch (e) {
        voiceState.value = VoiceState.error;
      }
    } else {
      stopVoice();
    }
  }

  Future<void> _postTtsDelay(
      [Duration d = const Duration(milliseconds: 500)]) async {
    voiceState.value = VoiceState.settling;
    await Future.delayed(d);
  }

  VoiceCommand parseCommand(String? text) {
    if (text == null) return VoiceCommand.unknown;

    final input = text.toLowerCase();
    if (input.contains("next")) return VoiceCommand.next;
    if (input.contains("repeat")) return VoiceCommand.repeat;
    if (input.contains("again")) return VoiceCommand.repeat;
    if (input.contains("back")) return VoiceCommand.previous;
    if (input.contains("previous")) return VoiceCommand.previous;
    if (input.contains("stop")) return VoiceCommand.stop;

    return VoiceCommand.unknown;
  }

  Future<void> handleCommand(String? text) async {
    final command = parseCommand(text);

    switch (command) {
      case VoiceCommand.next:
        stepIndex++;
        debugPrint(listStep[stepIndex.value]);
        await startStep(listStep[stepIndex.value]);
        break;

      case VoiceCommand.repeat:
        debugPrint(listStep[stepIndex.value]);
        await startStep(listStep[stepIndex.value]);
        break;

      case VoiceCommand.previous:
        if (stepIndex > 0) stepIndex--;
        debugPrint(listStep[stepIndex.value]);
        await startStep(listStep[stepIndex.value]);
        break;

      case VoiceCommand.stop:
        voiceState.value = VoiceState.idle;
        debugPrint("Stop");
        await voice.stopAll();
        break;

      case VoiceCommand.unknown:
        await startStep(
            "Sorry, I didn't catch that. Tell me another command like next, repeat, or stop.");
        debugPrint(
            "Sorry, I didn't catch that. Tell me another command like next, repeat, or stop.");
        break;
    }
  }
}
