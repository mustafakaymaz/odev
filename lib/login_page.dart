import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'userGrid/user_list_page.dart';

class LoginPage extends StatefulWidget {



  @override
  _LoginPageState createState() => _LoginPageState();
}
var token;
class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailKontrolu = TextEditingController();
  TextEditingController _sifreKontrolu = TextEditingController();

  bool _isLoading = false;

  signIn(String email, String password)async{
    String url = "http://test11.internative.net/Login/SignIn";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jsonResponse;
    var res = await http.post(url, body: jsonEncode({
      "Email": email,
      "Password": password,
    }),headers: {
      'Content-Type': 'application/json; charset=utf-8'
    });

    if(res.statusCode == 200){
      jsonResponse = json.decode(res.body);
      print("Response status: ${res.statusCode}");
      print("Response status: ${res.body}");
      token = jsonResponse['Data']['Token'];
      print(token);
      if(jsonResponse != null){
        setState((){
          _isLoading= false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context)=> UserListPage()), (Route<dynamic>route) => false);
      }
    }else{
      setState((){
        _isLoading = false;
      });
      print("Response status: ${res.body}");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Login",
                style: TextStyle(fontSize: 48),
              ),
              SizedBox(height: 30,),
              Card(
                elevation: 8,
                shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(8.0) ) ,
                child: Container(
                  height: 190,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: _emailKontrolu,
                            decoration: InputDecoration(
                                hintText: "Email"
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _sifreKontrolu,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Password"
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Text("Sign In",
                    style: TextStyle(fontSize: 48, color: Colors.white),),
                  onPressed: _emailKontrolu.text == "" || _sifreKontrolu.text == ""
                      ? null
                      : () async{
                    setState(() {
                      _isLoading = true;
                    });
                    signIn(_emailKontrolu.text, _sifreKontrolu.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
