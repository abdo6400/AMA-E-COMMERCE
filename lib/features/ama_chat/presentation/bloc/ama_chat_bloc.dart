import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ama_chat_event.dart';
part 'ama_chat_state.dart';

class AmaChatBloc extends Bloc<AmaChatEvent, AmaChatState> {
  AmaChatBloc() : super(AmaChatInitial()) {
    on<AmaChatEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
