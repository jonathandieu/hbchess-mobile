import 'package:flutter/material.dart';
import 'package:hb_chess/utils/getAPI.dart';
import 'package:hb_chess/main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form (
        key: _formKey,
        child:
          Center(
            child: ListView(
              children: <Widget>[
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text('Welcome Back',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold)),

                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Padding (
                    padding: EdgeInsets.only(bottom:20),
                    child:
                      Text('Sign in here',
                        style: TextStyle(
                          fontSize: 20,
                    )),
                  ),
                ),
                
                createInputField(false, _email, 'E-Mail', Icons.mail),
                createInputField(true, _password, 'Password', Icons.lock),

                Align(
                  alignment: Alignment.center,
                  child: Padding (
                    padding: const EdgeInsets.only(left:40, right:40, top:30),
                    child:
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          textStyle: const TextStyle(fontSize: 20),
                          minimumSize: const Size.fromHeight(50),
                        ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {

                          var email = _email.text;
                          var password = _password.text;
                          var token = await doLogin(email, password);

                          if (token == "Url Not Found" || token == "Invalid Credentials")
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(token)),
                            );
                          }
                          else if (token == "")
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("There was an error logging in")),
                            );
                          }
                          else
                          {
                            storage.write(key: "token", value: token);
                            Navigator.pushNamed(context, '/dashboard');
                          }

                          // if (token != "")
                          // {
                          //   storage.write(key: "token", value: token);
                          //   Navigator.pushNamed(context, '/dashboard');
                          // }
                          // else
                          // {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(content: Text('Incorrect credentials')),
                          //   );
                          // }
                        }
                      },
                      child: const Text('Log In'),
                      ),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }

  Align createInputField(bool showText, TextEditingController controllerType, String placeholder, IconData icon) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left:40, right:40),
        child:
          TextFormField(
            obscureText: showText,
            controller: controllerType,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill out field';
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: placeholder,
              prefixIcon: Icon(icon),
            ),
          ),
        ),
      );
    }
}