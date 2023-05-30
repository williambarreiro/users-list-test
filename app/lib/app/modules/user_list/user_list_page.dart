import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_sodre/app/core/widgets/default_button.dart';
import 'package:test_sodre/app/modules/user_list/controller/user_list_controller.dart';

import 'widgets/user_card.dart';

class UserListPage extends StatelessWidget {
  final UserListController controller;

  const UserListPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuários'),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<UserListController, UserListState>(
              bloc: controller,
              listener: (context, state) {
                if (state is Failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Falha ao carregar usuários')),
                  );
                }
              },
              builder: (context, state) {
                if (state is Success) {
                  return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return UserCard(state.users[index]);
                    },
                  );
                }

                if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Center(
                  child: DefaultButton(
                    title: 'Recarregar',
                    onPressed: () => controller.loadUsers(),
                  ),
                );
              },
            ),
          ),
          DefaultButton(
            title: 'Cadastrar',
            onPressed: () async {
              await Modular.to.pushNamed('/user_register');
              controller.loadUsers();
            },
          ),
        ],
      ),
    );
  }
}
