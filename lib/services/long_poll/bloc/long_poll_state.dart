part of 'long_poll_bloc.dart';

@immutable
abstract class LongPollState {}

class LongPollInitial extends LongPollState {}

class LongPollSuccess extends LongPollState {}

class LongPollFailed extends LongPollState {}
