
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_people/database/database.dart';
import 'package:register_people/model/people.dart';

class RegisterPeople extends StatefulWidget {
  final DatabaseApp db;
  final String title;

  RegisterPeople({Key? key, required this.title,  required this.db}) : super(key: key);

  @override
  _RegisterPeopleState createState() => _RegisterPeopleState();
}

class _RegisterPeopleState extends State<RegisterPeople> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();

  void registerPeople(context) {
    if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty && _addressController.text.isNotEmpty) {
      widget.db.peopleRepositoryDAO.insertItem(new People(
        createdAt: DateTime.now().toUtc().toString(),
        name: _nameController.text,
        phone: _phoneController.text,
        address: _addressController.text,
      ));

      Navigator.of(context).pushNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          registerPeople(context);
        },
        tooltip: 'Salvar',
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body: new SingleChildScrollView(
        padding: EdgeInsets.all(24 ),
        child: new Column(
          children: <Widget> [
            new TextField(
              controller: _nameController,
              decoration: 
              InputDecoration(
                hintText: "Digite o nome",
              ),
                maxLines: 1,
            ),
            new TextField(
              controller: _phoneController,
              decoration: 
              InputDecoration(
                hintText: "Digite o telefone",
              ),
                maxLines: 1,
            ),
            new TextField(
              controller: _addressController,
              decoration: 
              InputDecoration(
                hintText: "Digite o endereço",
              ),
                maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}