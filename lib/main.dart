import 'package:flutter/material.dart';
import 'package:register_people/database/database.dart';
import 'package:register_people/screens/paginaInicial.dart';
import 'package:register_people/screens/paginaCadastrarPessoa.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    db: await $FloorDatabaseApp.databaseBuilder('people_database.db').build()
  ));
}

class MyApp extends StatelessWidget {

  final DatabaseApp db;

  const MyApp({ Key? key, required this.db }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Pessoas',
      initialRoute: '/',
      routes: {
        '/': (context) => PeopleList(title: 'Pessoas cadastradas', db: db),
        '/registrar': (context) => RegisterPeople(title: 'Detalhes da pessoa',  db: db),
      },
    );
  }
}

