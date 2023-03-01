import 'package:first/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class ListPostWidget extends StatelessWidget {
  const ListPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Lista de posts',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Card(
          elevation: 20,
          child: SizedBox(
            height: 250.0,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return  ListTile(
                  leading:const Icon(Icons.file_copy),
                  title:const Text('Nombre de post'),
                  trailing:const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () => Navigator.pushNamed(context, DetailPostScreen.routeName),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 2,
            ),
          ),
        )
      ],
    );
  }
}
