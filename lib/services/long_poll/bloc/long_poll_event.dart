part of 'long_poll_bloc.dart';

@immutable
abstract class LongPollEvent {}

class LongPollSend extends LongPollEvent {
  final String server;
  final String key;
  final String ts;

  LongPollSend({
    required this.server,
    required this.key,
    required this.ts,
  });
}
