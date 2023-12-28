import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authtentication_event.dart';
part 'authtentication_state.dart';

class AuthtenticationBloc extends Bloc<AuthtenticationEvent, AuthtenticationState> {
  AuthtenticationBloc() : super(AuthtenticationInitial()) {
    on<AuthtenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
