import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<LoginEvent>(_login);
  }

  Future<void> _login(LoginEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());

    if (event.email == "Dimuthu@gmail.com" && event.password == "12345678") {
      emit(SignInSuccessState());
    } else {
      emit(SignInFailState());
    }
  }
}
