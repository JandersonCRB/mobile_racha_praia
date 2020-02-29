import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPlayerScreen extends StatefulWidget {
  @override
  _AddPlayerScreenState createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  final _formKey = GlobalKey<FormState>();
  String name;

  void _submit() {
    _formKey.currentState.save();
    final body = {
      'player': {'name': name},
    };
    Map<String, String> headers = {"Content-type": "application/json"};
    http
        .post(
          'http://10.0.3.2:3000/players',
          headers: headers,
          body: jsonEncode(body),
        )
        .then((_) => Navigator.pop(this.context))
        .catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo jogador"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onSaved: (name) => this.name = name,
                decoration: InputDecoration(labelText: "Nome"),
              ),
              Container(
                height: 8,
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Enviar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
