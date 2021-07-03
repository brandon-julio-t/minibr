import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:minibr/models/user.dart';
import 'package:minibr/store/store.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var _emailController = new TextEditingController();
  var _passwordController = new TextEditingController();
  var _credentials = [
    User('ae@19-2', 'ae', 'Andree Benaya Abyatar'),
    User('br@20-2', 'br', 'Brandon Julio Thenaro'),
    User('cc@20-2', 'cc', 'Clarissa Chuardi'),
    User('ga@20-2', 'ga', 'Skolastika Gabriella Theresandia Prasetyo'),
    User('st@20-2', 'st', 'Stanley Dave Teherag'),
    User('tc@20-2', 'tc', 'Thaddeus Cleo'),
    User('vn@20-2', 'vn', 'Vincent Benedict'),
    User('ll@20-2', 'll', 'Lionel Ritchie'),
    User('jp@20-2', 'jp', 'Johanes Peter Vincentius'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dotenv.env['APP_NAME'].toString()),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Image.asset('assets/logo.png'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email (required)',
                  labelText: 'Email (required)',
                ),
                validator: (String? email) {
                  if (email == null || email.trim().isEmpty) {
                    return 'Email must not be empty';
                  }

                  if (!email.contains('@')) {
                    return "Email must contain '@'.";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password (required)',
                  labelText: 'Password (required)',
                ),
                obscureText: true,
                validator: (String? password) {
                  if (password == null || password.trim().isEmpty) {
                    return 'Password must not be empty';
                  }

                  try {
                    context.read<Store>().user =
                        _credentials.singleWhere((user) {
                      return user.email == _emailController.text &&
                          user.password == _passwordController.text;
                    });
                  } catch (_) {
                    return 'Invalid credential';
                  }

                  return null;
                },
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/home',
                            (_) => false,
                          );
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
