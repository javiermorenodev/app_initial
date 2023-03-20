import 'package:first/models/post.dart';
import 'package:first/presentation/widgets/buttom.dart';
import 'package:first/presentation/widgets/text_field.dart';
import 'package:first/presentation/widgets/widgets.dart';
import 'package:first/services/http.dart';
import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  static String routeName = 'new_post';

  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final _titleTextEditingController = TextEditingController();
  final _bodyTextEditingController = TextEditingController();

  late int userId = 0;

  HttpService httpService = HttpService();
  late bool loading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        userId = ModalRoute.of(context)!.settings.arguments as int;
      });
    });
    super.initState();
  }

  void _save() {
    if (_titleTextEditingController.text.isEmpty ||
        _bodyTextEditingController.text.isEmpty) {
      return;
    }

    setState(() {
      loading = true;
    });

    final post = PostModel(
      title: _titleTextEditingController.text.trim(),
      body: _bodyTextEditingController.text.trim(),
      userId: userId,
    );

    httpService.postPost(post).then((value) {
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
    _titleTextEditingController.dispose();
    _bodyTextEditingController.dispose();
    super.dispose();
  }

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
          children: [
            TextFieldWidget(
              label: 'Titulo',
              placeholder: 'Titulo',
              icon: Icons.title,
              controller: _titleTextEditingController,
            ),
            const SizedBox(height: 10.0),
            TextFieldWidget(
              label: 'Contenido',
              placeholder: 'Contenido',
              isTextArea: true,
              controller: _bodyTextEditingController,
            ),
            const Spacer(),
            loading ? const LoadingWidget() : ButtomWidget(onPressed: _save)
          ],
        ),
      ),
    );
  }
}
