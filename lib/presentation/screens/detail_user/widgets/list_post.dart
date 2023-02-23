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
                return const ListTile(
                  leading: Icon(Icons.file_copy),
                  title: Text('Nombre de post'),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
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
