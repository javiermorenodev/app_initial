import 'package:first/models/users.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final UserModel userModel;

  const InfoWidget({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Información de usuario',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Card(
          elevation: 20,
          child: Column(
            children: [
              _item(userModel.name!, Icons.person),
              _item(userModel.email!, Icons.email),
              _item(userModel.gender == 'female' ? 'Femenino' : 'Masculino',
                  Icons.supervised_user_circle_rounded),
              _item(userModel.status == 'inactive' ? 'Inactivo' : 'Activo',
                  Icons.circle),
            ],
          ),
        ),
      ],
    );
  }

  Widget _item(String text, IconData icon) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.grey,
            size: 40.0,
          ),
          trailing: Text(text),
        ),
        const Divider()
      ],
    );
  }
}
