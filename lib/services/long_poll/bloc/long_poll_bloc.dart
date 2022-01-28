import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';
import 'package:vk_messenger_2/models/base/base_response.dart';
import 'package:vk_messenger_2/services/request_handler/long_poll_handler.dart';

part 'long_poll_event.dart';
part 'long_poll_state.dart';

class LongPollBloc extends Bloc<LongPollEvent, LongPollState> {
  LongPollBloc() : super(LongPollInitial()) {
    on<LongPollSend>(
      (event, emit) {
        emit(LongPollWaiting());
      },
    );
  }

  Future<void> _sendPoll(
      LongPollSend event, Emitter<LongPollState> emit) async {
    final lph = LongPollHandler();

    emit(LongPollWaiting());

    try {
      var response = BaseResponseRepository.fromMap(
          await lph.get(event.path) as Map<String, dynamic>);
    } on ResponseParseException {
      emit(LongPollFailed());
    }
  }
}
