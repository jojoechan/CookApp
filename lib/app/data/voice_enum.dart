enum VoiceState {
  idle,
  speaking,
  settling,
  listening,
  processing,
  error,
}

enum VoiceCommand {
  next,
  repeat,
  previous,
  stop,
  unknown,
}
