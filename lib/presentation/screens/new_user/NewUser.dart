import 'package:first/models/models.dart';
import 'package:first/presentation/widgets/widgets.dart';
import 'package:first/services/http.dart';
import 'package:flutter/material.dart';

class NewUserScreen extends StatefulWidget {
  static String routeName = 'new_user';

  const NewUserScreen({super.key});

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  final _nameTextEditingController = TextEditingController();
  final _emailTextEditingController = TextEditingController();

  final List<ItemDropdown> listSex = [
    ItemDropdown(label: 'Femenino', value: 'female'),
    ItemDropdown(label: 'Masculino', value: 'male'),
  ];

  final List<ItemDropdown> listStatus = [
    ItemDropdown(label: 'Activo', value: 'active'),
    ItemDropdown(label: 'Inactivo', value: 'inactive'),
  ];

  ItemDropdown? _selectSex;
  ItemDropdown? _selectStatus;

  HttpService httpService = HttpService();

  late bool loading = false;

  void _save() {
    if (_nameTextEditingController.text.trim().isEmpty ||
        _emailTextEditingController.text.trim().isEmpty ||
        _selectSex == null ||
        _selectStatus == null) {
      return;
    }

    setState(() {
      loading = true;
    });

    final user = UserModel(
      name: _nameTextEditingController.text.trim(),
      email: _emailTextEditingController.text.trim(),
      gender: _selectSex!.value,
      status: _selectStatus!.value,
    );

    httpService.postUset(user).then((value) {
      if (value == true) {
        Navigator.pop(context, true);
      }
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _emailTextEditingController.dispose();

    super.dispose();
  }

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
              controller: _nameTextEditingController,
            ),
            const SizedBox(height: 10.0),
            TextFieldWidget(
              label: 'Correo',
              placeholder: 'Correo',
              icon: Icons.mail,
              controller: _emailTextEditingController,
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownWidget(
                  label: 'Género',
                  list: listSex,
                  onSelect: (value) {
                    setState(() {
                      _selectSex = value;
                    });
                  },
                ),
                DropdownWidget(
                  label: 'Estado',
                  list: listStatus,
                  onSelect: (value) {
                    setState(() {
                      _selectStatus = value;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            loading ? const LoadingWidget() : ButtomWidget(onPressed: _save)
          ],
        ),
      ),
    );
  }
}
