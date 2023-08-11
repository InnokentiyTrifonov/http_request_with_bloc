import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_2/features/bloc/users_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final UsersBloc bloc = UsersBloc();

  @override
  void initState() {
    bloc.add(GetUsersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UsersBloc, UsersState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is UsersInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UsersLoadedState) {
            return Column(
              children: [Expanded(child: listOfUsers(state))],
            );
          }
          return const Center(
            child: Text('Something went wrong'),
          );
        },
      ),
    );
  }
}

Widget listOfUsers(UsersLoadedState state) {
  return ListView.builder(
    itemCount: state.listOfUsers.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 5, left: 16, right: 16),
        child: Container(
          height: 150,
          color: Colors.grey.shade200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('id : ${state.listOfUsers[index].id.toString()}'),
              Text('name : ${state.listOfUsers[index].name}'),
              Text('email : ${state.listOfUsers[index].email}'),
              Text('address : ${state.listOfUsers[index].address.street}'),
            ],
          ),
        ),
      );
    },
  );
}
