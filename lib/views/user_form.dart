import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();
                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    password: _formData['password'],
                    avatarUrl: _formData['avatarUrl'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nome inválido!';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _formData['name'] = newValue,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email inválido!';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _formData['email'] = newValue,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  validator: (value) {
                    if (value.length < 6) {
                      return 'A senha dete ter no mínimo 6 caracteres!';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _formData['password'] = newValue,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'URL do Avatar'),
                  onSaved: (newValue) => _formData['avatarUrl'] = newValue,
                ),
              ],
            )),
      ),
    );
  }
}
