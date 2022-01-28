import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'long_poll_event.dart';
part 'long_poll_state.dart';

class LongPollBloc extends Bloc<LongPollEvent, LongPollState> {
  LongPollBloc() : super(LongPollInitial()) {
    on<LongPollEvent>(
      (event, emit) {
        // TODO: implement event handler
      },
    );
  }
}
