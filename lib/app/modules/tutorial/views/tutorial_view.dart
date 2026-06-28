import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tutorial_controller.dart';

class TutorialView extends GetView<TutorialController> {
  const TutorialView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TutorialView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'TutorialView is working',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                    onPressed: () async {
                      if (controller.voiceEnabled.value) {
                        await controller.voice.decreaseSpeakRate(true);
                        await controller.voice.stopAll();
                        await controller.startStep(
                            controller.listStep[controller.stepIndex.value]);
                      }
                    },
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.black),
                    )),
                MaterialButton(
                  onPressed: () async {
                    controller.voiceEnabled.value =
                        !controller.voiceEnabled.value;
                    if (controller.voiceEnabled.value) {
                      await controller.startStep(
                          controller.listStep[controller.stepIndex.value]);
                    } else {
                      await controller.stopVoice();
                    }
                  },
                  child: Obx(() => Icon(
                        controller.voiceEnabled.value
                            ? Icons.keyboard_voice_rounded
                            : Icons.mic_off_rounded,
                        color: controller.voiceEnabled.value
                            ? Colors.green
                            : Colors.red,
                      )),
                ),
                MaterialButton(
                    onPressed: () async {
                      if (controller.voiceEnabled.value) {
                        await controller.voice.increaseSpeakRate(true);
                        await controller.voice.stopAll();
                        await controller.startStep(
                            controller.listStep[controller.stepIndex.value]);
                      }
                    },
                    child: Text(
                      "+",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
