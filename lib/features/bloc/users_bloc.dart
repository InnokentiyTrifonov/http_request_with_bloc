import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lesson_2/features/model/users_model.dart';

import '../repository/repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitialState()) {
    on<GetUsersEvent>(getUsersFromApi);
  }

  FutureOr<void> getUsersFromApi(
      GetUsersEvent event, Emitter<UsersState> emit) async {
    final users = await GetUsers.getUsers();
    emit(UsersLoadedState(listOfUsers: users));
  }
}
