part of 'long_poll_bloc.dart';

@immutable
abstract class LongPollEvent {}

class LongPollSend extends LongPollEvent {
  final String path;

  LongPollSend({
    required this.path,
  });
}
