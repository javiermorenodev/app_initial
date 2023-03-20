import 'package:first/models/users.dart';
import 'package:first/presentation/screens/detail_user/widgets/info.dart';
import 'package:first/presentation/screens/detail_user/widgets/list_post.dart';
import 'package:first/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class DetailUserScreen extends StatefulWidget {
  static String routeName = 'detail_user';

  const DetailUserScreen({super.key});

  @override
  State<DetailUserScreen> createState() => _DetailUserScreenState();
}

class _DetailUserScreenState extends State<DetailUserScreen> {
  UserModel? userModel;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        userModel = ModalRoute.of(context)!.settings.arguments as UserModel;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de usuario'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Eliminar usuario'),
                    content: const Text('Seguro desea eliminar el usuario?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Aceptar',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.delete_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: userModel != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InfoWidget(userModel: userModel!),
                  SizedBox(height: 10.0),
                  ListPostWidget(userId: userModel!.id!)
                ],
              )
            : const SizedBox.shrink(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          NewPostScreen.routeName,
          arguments: userModel!.id,
        ).then((value) {
          if (value == true) {
            setState(() {});
          }
        }),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.note_add_rounded),
      ),
    );
  }
}
