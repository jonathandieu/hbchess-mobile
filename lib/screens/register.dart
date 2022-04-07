import 'package:flutter/material.dart';
import 'package:hb_chess/main.dart';
import 'package:hb_chess/utils/getRegisterAPI.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            children: <Widget>[
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'Welcome to Hand Brain Chess!',
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Create your account today!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              createInputField(false, _username, "Username", Icons.person),
              createInputField(false, _email, "E-Mail", Icons.email),
              createInputField(true, _password, "Password", Icons.lock),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      textStyle: const TextStyle(fontSize: 20),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var username = _username.text;
                        var email = _email.text;
                        var password = _password.text;
                        var token = await doRegister(username, email, password);

                        if (token == "Url Not Found" ||
                            token == "Invalid Credentials") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(token)),
                          );
                        } else if (token == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("There was an error signing up")),
                          );
                        } else {
                          storage.write(key: "token", value: token);
                          //FIXME: ADD email verification here!
                          Navigator.pushNamed(context, '/login');
                        }
                      }
                    },
                    child: const Text('Sign in'),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                // need to add another button next to text message
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Already have an account?'),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text('Login here'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align createInputField(bool showText, TextEditingController controllerType,
      String placeholder, IconData icon) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: TextFormField(
          obscureText: showText,
          controller: controllerType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please fill out the " +
                  placeholder.toLowerCase() +
                  " field.";
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
