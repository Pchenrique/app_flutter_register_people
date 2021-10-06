import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_people/database/database.dart';
import 'package:register_people/model/people.dart';

class PeopleList extends StatefulWidget {
  const PeopleList({Key? key, required this.title,  required this.db}) : super(key: key);
  final DatabaseApp db;
  final String title;

  @override
  _PeopleListState createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  final itens = List<String>.generate(50, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.of(context).pushNamed('/registrar');
        },
        tooltip: 'Nova pessoa',
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<People>>(
        future: widget.db.peopleRepositoryDAO.getAll(),
        builder: (context, snapshot){
          return snapshot.hasData ? 
          ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${snapshot.data![index].name} - ${snapshot.data![index].phone}'),
                    subtitle: Text(snapshot.data![index].address),
                  ),
                );
              }
            )
          : Center(
            child: Text('Nenhuma pessoa cadastrada'),
          );
        },
      ),
    );
  }
}