import 'package:first/presentation/widgets/buttom.dart';
import 'package:first/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

class NewPostScreen extends StatelessWidget {
  static String routeName = 'new_post';

  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo post'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            TextFieldWidget(
              label: 'Titulo',
              placeholder: 'Titulo',
              icon: Icons.title,
            ),
            SizedBox(height: 10.0),
            TextFieldWidget(
              label: 'Contenido',
              placeholder: 'Contenido',
              isTextArea: true,
            ),
            Spacer(),
            ButtomWidget()
          ],
        ),
      ),
    );
  }
}
