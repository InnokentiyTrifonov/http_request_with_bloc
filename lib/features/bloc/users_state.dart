part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UsersInitialState extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoadedState extends UsersState {
  final List<Users> listOfUsers;

  const UsersLoadedState({required this.listOfUsers});

  @override
  List<Users> get props => [];
}
