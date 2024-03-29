part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserFailedLoaded extends UserState {
  final String message;
  UserFailedLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class UserSignUp extends UserState {
  final int value;
  UserSignUp(this.value);

  @override
  List<Object> get props => [value];
}
