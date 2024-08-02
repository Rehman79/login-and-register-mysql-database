import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  Future<void> insertrecord() async{
    if(email.text!="" || password.text!=""){
      try{
         String uri="http://Your_Emulator_Ip_For_LocalHost/localconnect/fluttconn.php";
        var res=await http.post(Uri.parse(uri),body: {
          "email":email.text,
          "password":password.text
        });
        var response=jsonDecode(res.body);
        if(response["success"]=="true"){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response['message']),
          ));
          Navigator.pushNamed(context, '/login');
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response['message']),
          ));
        }
      }
          catch(e){
        print(e);
          }
    }
    else{
      print("Please Fill All Fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery.of(context).size.height*0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:  Radius.circular(20)),
              ),
              child: Center(child: Text('''Register your account''',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(labelText: 'Email'),

                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,

                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        insertrecord();
                      }
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
