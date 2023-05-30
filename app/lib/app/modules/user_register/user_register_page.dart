import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_sodre/app/core/widgets/default_button.dart';
import 'package:test_sodre/app/core/widgets/default_input_field.dart';
import 'package:test_sodre/app/models/user_model.dart';
import 'package:validatorless/validatorless.dart';

import 'controller/user_register_controller.dart';

class UserRegisterPage extends StatefulWidget {
  final UserRegisterController controller;

  const UserRegisterPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _ageEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _ageEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
        ),
        backgroundColor: Colors.grey[200],
        body: BlocConsumer<UserRegisterController, UserRegisterState>(
          bloc: widget.controller,
          listener: (context, state) {
            if (state is Failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Falha ao cadastrar usuário')),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                DefaultInputField(
                                  controller: _nameEC,
                                  label: 'Nome',
                                  validator: Validatorless.required(
                                      'Campo obrigatório'),
                                ),
                                const SizedBox(height: 12),
                                DefaultInputField(
                                  controller: _emailEC,
                                  label: 'E-mail',
                                  validator: Validatorless.multiple([
                                    Validatorless.required('Campo obrigatório'),
                                    Validatorless.email(
                                        'Formato de e-mail incorreto'),
                                  ]),
                                ),
                                const SizedBox(height: 12),
                                DefaultInputField(
                                  controller: _ageEC,
                                  label: 'Idade',
                                  onlyNumbers: true,
                                  validator: Validatorless.required(
                                      'Campo obrigatório'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      DefaultButton(
                        title: 'Cadastrar',
                        enabled: state is! Loading,
                        onPressed: () {
                          _hideKeyboard();
                          final validForm =
                              _formKey.currentState?.validate() ?? false;
                          if (validForm) {
                            final user = UserModel(
                              name: _nameEC.text,
                              email: _emailEC.text,
                              age: int.parse(_ageEC.text),
                            );
                            widget.controller.registerUser(user);
                          }
                        },
                      )
                    ],
                  ),
                  Visibility(
                    visible: state is Loading,
                    child: Stack(children: const [
                      SizedBox(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    ]),
                  ),
                ],
              ),
            );
          },
        ));
  }

  void _hideKeyboard() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
