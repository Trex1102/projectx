import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_language_event.dart';
part 'change_language_state.dart';

class ChangeLanguageBloc extends Bloc<ChangeLanguageEvent, ChangeLanguageState> {
  ChangeLanguageBloc() : super(ChangeLanguageInitial()) {
    on<ChangeLanguageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
