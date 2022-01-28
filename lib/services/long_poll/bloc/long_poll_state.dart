part of 'long_poll_bloc.dart';

@immutable
abstract class LongPollState {}

class LongPollInitial extends LongPollState {}

class LongPollSuccess extends LongPollState {
  final String ts;

  LongPollSuccess({required this.ts});
}

class LongPollFailed extends LongPollState {}

class LongPollWaiting extends LongPollState {}
