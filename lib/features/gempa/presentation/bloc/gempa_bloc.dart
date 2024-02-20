import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gempa_event.dart';
part 'gempa_state.dart';

class GempaBloc extends Bloc<GempaEvent, GempaState> {
  GempaBloc() : super(GempaInitial()) {
    on<GempaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
