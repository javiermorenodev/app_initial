import 'package:first/models/post.dart';
import 'package:flutter/material.dart';

class DetailPostScreen extends StatelessWidget {
  static String routeName = 'detail_post';

  const DetailPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)!.settings.arguments as PostModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de post'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _item('Título', post.title!),
            const SizedBox(height: 10.0),
            _item('Contenido', post.body!),
          ],
        ),
      ),
    );
  }

  Widget _item(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Card(
          elevation: 20.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(text),
          ),
        )
      ],
    );
  }
}
