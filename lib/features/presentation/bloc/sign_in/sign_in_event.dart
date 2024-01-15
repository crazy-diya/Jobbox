part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class LoginEvent extends SignInEvent {
  final String? email;
  final String? password;

  LoginEvent({required this.email, required this.password});
}
