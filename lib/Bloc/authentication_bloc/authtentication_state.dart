part of 'authtentication_bloc.dart';

sealed class AuthtenticationState extends Equatable {
  const AuthtenticationState();
  
  @override
  List<Object> get props => [];
}

final class AuthtenticationInitial extends AuthtenticationState {}
