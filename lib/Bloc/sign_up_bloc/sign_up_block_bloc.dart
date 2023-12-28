import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_block_event.dart';
part 'sign_up_block_state.dart';

class SignUpBlockBloc extends Bloc<SignUpBlockEvent, SignUpBlockState> {
  SignUpBlockBloc() : super(SignUpBlockInitial()) {
    on<SignUpBlockEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
