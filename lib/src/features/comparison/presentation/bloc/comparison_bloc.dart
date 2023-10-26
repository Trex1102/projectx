import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'comparison_event.dart';
part 'comparison_state.dart';

class ComparisonBloc extends Bloc<ComparisonEvent, ComparisonState> {
  ComparisonBloc() : super(ComparisonInitial()) {
    on<ComparisonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
