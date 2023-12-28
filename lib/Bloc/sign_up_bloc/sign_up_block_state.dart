part of 'sign_up_block_bloc.dart';

sealed class SignUpBlockState extends Equatable {
  const SignUpBlockState();
  
  @override
  List<Object> get props => [];
}

final class SignUpBlockInitial extends SignUpBlockState {}
