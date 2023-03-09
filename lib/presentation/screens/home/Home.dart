import 'package:first/presentation/screens/screens.dart';
import 'package:first/presentation/widgets/widgets.dart';
import 'package:first/services/http.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuarios'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: httpService.getAllUsers(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final user = snapshot.data![index];
                    return ListTile(
                      title: Text(user.name!),
                      subtitle: Text(user.email!),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      onTap: () => Navigator.pushNamed(
                          context, DetailUserScreen.routeName),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                )
              : const LoadingWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewUserScreen.routeName);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
