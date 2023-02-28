import 'package:first/models/models.dart';
import 'package:first/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NewUserScreen extends StatefulWidget {
  static String routeName = 'new_user';

  const NewUserScreen({super.key});

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  final List<ItemDropdown> listSex = [
    ItemDropdown(label: 'Femenino', value: 'female'),
    ItemDropdown(label: 'Masculino', value: 'male'),
  ];

  final List<ItemDropdown> listStatus = [
    ItemDropdown(label: 'Activo', value: 'active'),
    ItemDropdown(label: 'Inactivo', value: 'inactive'),
  ];

  ItemDropdown? _selectSex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFieldWidget(
              label: 'Nombre',
              placeholder: 'Nombre',
              icon: Icons.person,
            ),
            SizedBox(height: 10.0),
            TextFieldWidget(
              label: 'Correo',
              placeholder: 'Correo',
              icon: Icons.mail,
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownWidget(label: 'Género', list: listSex),
                DropdownWidget(label: 'Estado', list: listStatus),
              ],
            ),
            const Spacer(),
            const ButtomWidget()
          ],
        ),
      ),
    );
  }
}
