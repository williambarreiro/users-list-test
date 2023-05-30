import 'package:flutter/material.dart';

import '../../../models/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(user.email),
            Text('${user.age} anos'),
          ],
        ),
      ),
    );
  }
}
