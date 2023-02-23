import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              _item('Nombre', Icons.person),
              _item('correo@correo.com', Icons.email),
              _item('Masculino', Icons.supervised_user_circle_rounded),
              _item('Activo', Icons.circle),
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
