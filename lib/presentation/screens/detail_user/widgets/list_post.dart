import 'package:first/presentation/screens/screens.dart';
import 'package:first/presentation/widgets/widgets.dart';
import 'package:first/services/http.dart';
import 'package:flutter/material.dart';

class ListPostWidget extends StatefulWidget {
  final int userId;

  const ListPostWidget({super.key, required this.userId});

  @override
  State<ListPostWidget> createState() => _ListPostWidgetState();
}

class _ListPostWidgetState extends State<ListPostWidget> {
  HttpService httpService = HttpService();

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
            child: FutureBuilder(
              future: httpService.getAllPostByUser(widget.userId),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? snapshot.data!.isEmpty
                        ? const Center(child: Text('No posee posts'))
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              final post = snapshot.data![index];
                              return ListTile(
                                leading: const Icon(Icons.file_copy),
                                title: Text(post.title!),
                                trailing:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                                onTap: () => Navigator.pushNamed(
                                    context, DetailPostScreen.routeName),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: snapshot.data!.length,
                          )
                    : const LoadingWidget();
              },
            ),
          ),
        )
      ],
    );
  }
}
